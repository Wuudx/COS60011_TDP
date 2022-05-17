<?php
	require_once('api/inc/bootstrap.php');
	require_once('api/Model/IssueModel.php');

	$model = new IssueModel();
	$issues = $model->getIssue(array('limit'=>100));
?>
<!DOCTYPE html>
<html lang="en">
	<head>  
		<?php require_once('includes/header.php'); ?>
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.0/css/dataTables.bootstrap4.min.css"/>
	</head>
	
	<body>
		<?php require_once('includes/navbar.php'); ?>
		<div class="container-fluid mt-3">
		  <h3 class="mb-5">Local Issues</h3>

		  <table id="issue-table" class="table table-striped table-bordered w-100">
			  <thead>
				  <tr>
					  <th class="dt-control" data-orderable="false" style="width: 10px !important;"></th>
					  <th>Issue Id</th>
					  <th>User Id</th>
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
						$category = $issue['category_1'];;
						if ($issue['category_2']) {
							$category .= " > {$issue['category_2']}";
						}

						if ($issue['category_3']) {
							$category .= " > {$issue['category_3']}";
						}

						$dataOrder = 0;
						if ($issue['status'] == 'PENDING'){
							$dataOrder = 1;
						}

						echo "<tr data-description=\"{$issue['description']}\" data-notes=\"{$issue['notes']}\">
								<td class=\"dt-control\"></td>
								<td>{$issue['issue_id']}</td>
								<td>{$issue['user_id']}</td>
								<td data-order=\"$dataOrder\">{$issue['status']}</td>
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

		<script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap4.min.js"></script>
		<script type="text/javascript" src="/assets/js/issues.js"></script>

		<?php require_once('includes/footer.php'); ?>
	</body>
</html>