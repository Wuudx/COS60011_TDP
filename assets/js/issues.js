$(document).ready(function () {
    var table = $('#issue-table').DataTable({
        order: [[2, 'desc'],[5, 'desc']],
        "columnDefs": [
            { "orderable": false, "targets": [0] }
        ]
    });

    var imageBaseUrl = 'https://councilreporting-s3uploadbucket-3bc29137lz99.s3.ap-southeast-2.amazonaws.com/';

    // Add listener for expanding row
    $('#issue-table tbody').on('click', 'td.dt-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);

        if (row.child.isShown()) {
            row.child.hide();
            tr.removeClass('shown');
        } else {
            // Ensure only one row is expanded at a time
            table.rows().every( function ( rowIdx, tableLoop, rowLoop ) {
                if (this.child.isShown()) {
                    this.child.hide();
                    $(this).closest('tr').removeClass('shown');
                }
            } );

            // Add images to carousel
            var images = !!tr.attr('data-images') ? tr.attr('data-images').split(',') : null;
            updateCarousel(images);

            // Display extra details below clicked row
            row.child(extraDetails(tr.attr('data-issue-id'), tr.attr('data-description'), 
                                   tr.attr('data-notes'), tr.attr('data-status'), tr.attr('data-staff'), images, 
                                   $('#issue-table').data('staff-list'))).show();
            tr.addClass('shown');
        }
    });

    // Addes images from issue to carousel in modal
    function updateCarousel(images) {
        if (!!images && images.length > 0) {
            var carouselIndicatorsHtml = '';
            var carouselInnerHtml = '';
            images.forEach((image, index) => {
                carouselIndicatorsHtml += `<li data-target="#carouselIndicators" data-slide-to="${index}" ${index == 0 ? 'class="active"' : ''}></li>`;
                carouselInnerHtml += `<div class="carousel-item ${index == 0 ? 'active' : ''}">
                                        <img class="d-block w-100" style="max-height: 80vh; object-fit: contain;" src="${imageBaseUrl + image}">
                                        </div>`;
            });

            $('#image-view-modal .carousel-indicators').html(carouselIndicatorsHtml);
            $('#image-view-modal .carousel-inner').html(carouselInnerHtml);
        }
    }

    // Form that is shown when issue table row is expanded
    function extraDetails(issueId, description, notes, status, assignedStaff, images, staffList) {
        description = description ? description : 'N/A';
        notes = notes ? notes : 'N/A';

        let staffSelect = '<select name="assigned_staff" class="form-control" id="assigned-staff">';
        if (!assignedStaff) {
            staffSelect += `<option selected value="" >Unassigned</option>`;
        }
        for (var id in staffList) {
            staffSelect += `<option ${assignedStaff == id ? 'selected' : ''} value="${id}">${staffList[id]}</option>`;
        }
        staffSelect += '</select>';

        console.log(images);

        return `<form id="update-issue" class="row">
                    <input type="hidden" name="issue_id" value="${issueId}">
                    <div class="form-group col-3">
                        <label for="description">Description:</label>
                        <textarea name="description" class="form-control" id="description" rows="3">${description}</textarea>
                    </div>
                    <div class="form-group col-3">
                        <label for="notes">Notes:</label>
                        <textarea name="notes" class="form-control" id="notes" rows="3">${notes}</textarea>
                    </div>
                    <div class="form-group col-3">
                        <label for="status">Status:</label>
                        <select name="status" class="form-control" id="status">
                            <option ${status == 'PENDING' ? 'selected' : ''} value="PENDING">PENDING</option>
                            <option ${status == 'IN_PROGRESS' ? 'selected' : ''} value="IN_PROGRESS">IN PROGRESS</option>
                            <option ${status == 'COMPLETED' ? 'selected' : ''} value="COMPLETED">COMPLETED</option>
                        </select>
                        <button type="button" class="btn btn-secondary mt-3" ${!!images ? '' : 'disabled'} data-toggle="modal" data-target="#image-view-modal">View Images</button>
                    </div>
                    <div class="form-group col-3">
                        <label for="status">Assigned Staff:</label>
                        ${staffSelect}
                        <button type="submit" class="btn btn-primary mt-3">Update Report</button>
                    </div>
                </form>`;
    }

    $(document).on("submit", "#update-issue", function(e){
        e.preventDefault();

        var form = $(this);
        $.ajax({
            type: 'PATCH',
            url: '/api/issue?' + form.serialize(),
            dataType: 'text',
            success: function(data) {
                var issueId = $('input[name="issue_id"]').val();
                var status = $('select[name="status"]').val();
                var issueRow = $(`tr[data-issue-id="${issueId}"]`);

                // update issue row values
                issueRow.attr('data-status', status);
                issueRow.attr('data-description', $('textarea[name="description"]').val());
                issueRow.attr('data-notes', $('textarea[name="notes"]').val());
                issueRow.attr('data-staff', $('select[name="assigned_staff"]').val());
                issueRow.children('.issue-status').text(status);
                issueRow.find('td:first').trigger('click');

                // flash row to indicate successfully update
                issueRow.css('background-color', '#d3ffce');
                issueRow.css('transition', 'background-color 0.5s linear');
                setTimeout(
                    function() 
                    {
                        issueRow.css('background-color', '');
                    }, 1000);
            }
        });
    });
});