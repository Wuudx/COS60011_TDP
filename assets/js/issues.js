function extraDetails(description, notes) {
    description = description ? description : 'N/A';
    notes = notes ? notes : 'N/A';

    return `<div class="row">
                <div class="col-6">
                    <h6>Description:</h4>
                    <p>${description}</p>
                </div>
                <div class="col-6">
                <h6>Notes:</h4>
                    <p>${notes}</p>
                </div>
            </div>`;
}

$(document).ready(function () {
    var table = $('#issue-table').DataTable({
        order: [[3, 'desc'],[7, 'desc']],
        "columnDefs": [
            { "orderable": false, "targets": [0] }
        ]
    });

    // Add listener for expanding row
    $('#issue-table tbody').on('click', 'td.dt-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);

        if (row.child.isShown()) {
            row.child.hide();
            tr.removeClass('shown');
        } else {
            row.child(extraDetails(tr.data('description'), tr.data('notes'))).show();
            tr.addClass('shown');
        }
    });
});