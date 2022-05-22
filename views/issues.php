<?php
	require_once('api/inc/bootstrap.php');
	require_once('api/Model/IssueModel.php');
	require_once('api/Model/StaffModel.php');
	require_once('api/Model/CategoryModel.php');
	
	$issueModel = new IssueModel();
	$issues = $issueModel->getIssue();
	$staffModel = new StaffModel();
    $staffList = $staffModel->getStaffList();
	$categoryModel = new CategoryModel();
	$categories = $categoryModel->getCategory();
?>

<!DOCTYPE html>
<html lang="en">
	<head>  
		<?php require_once('includes/header.php'); ?>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css"/>
	</head>
	
	<body>
		<?php require_once('includes/navbar.php'); ?>
		<div class="container-fluid mt-3" style="padding-bottom: 100px">
		  <h3 class="mb-5">Local Issue Reports</h3>

		  <table id="issue-table" class="table table-striped table-bordered w-100" data-staff-list="<?php echo htmlspecialchars(json_encode($staffList), ENT_QUOTES); ?>">
			  <thead>
				  <tr>
					  <th class="dt-control" data-orderable="false" style="width: 10px !important;"></th>
					  <th>Issue Id</th>
					  <th>Status</th>
					  <th>Address</th>
					  <th>Category</th>
					  <th>Votes</th>
					  <th>Last Updated</th>
				  </tr>
			  </thead>
			  <tbody>
				  <?php
				  	foreach($issues as $issue) {
						$category = $categories[$issue['category_1']-1]['description'];;
						if ($issue['category_2']) {
							$category .= " ↳ {$categories[$issue['category_2']-1]['description']}";
						}

						if ($issue['category_3']) {
							$category .= " ↳ {$categories[$issue['category_3']-1]['description']}";
						}

						$dataOrder = 0;
						if ($issue['status'] == 'IN_PROGRESS'){
							$dataOrder = 1;
						}
						if ($issue['status'] == 'PENDING'){
							$dataOrder = 2;
						}

						echo "<tr data-issue-id=\"{$issue['issue_id']}\" data-description=\"{$issue['description']}\" 
								  data-notes=\"{$issue['notes']}\" data-status=\"{$issue['status']}\" 
								  data-staff=\"{$issue['assigned_staff']}\"
								  data-images=\"{$issue['images']}\">
								<td class=\"dt-control\"></td>
								<td>{$issue['issue_id']}</td>
								<td class=\"issue-status\" data-order=\"$dataOrder\">{$issue['status']}</td>
								<td>{$issue['address']}</td>
								<td>$category</td>
								<td>{$issue['vote']}</td>
								<td>{$issue['last_updated']}</td>
							</tr>";
					}
				  ?>
			  </tbody>
		  </table>
		</div>

		<!-- Image Viewer Modal with carousel for clicking through images -->
		<div class="modal fade" id="image-view-modal" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document" style="min-width: auto; max-width: fit-content;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Images of Issue</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="carouselIndicators" class="carousel slide" data-ride="carousel"  data-interval="false">
							<ol class="carousel-indicators">
							</ol>
							<div class="carousel-inner">
							</div>
							<a class="carousel-control-prev" href="#carouselIndicators" role="button" data-slide="prev">
								<span class="carousel-control-prev-icon" style="filter: invert(100%);" aria-hidden="true"></span>
							</a>
							<a class="carousel-control-next" href="#carouselIndicators" role="button" data-slide="next">
								<span class="carousel-control-next-icon" style="filter: invert(100%);" aria-hidden="true"></span>
							</a>
						</div>
					</div>
					<div class="modal-footer">
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap4.min.js"></script>
		<script type="text/javascript" src="/assets/js/issues.js"></script>

		<?php require_once('includes/footer.php'); ?>
	</body>
</html>