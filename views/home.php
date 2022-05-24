<?php
	require_once('api/inc/bootstrap.php');
	require_once('api/Model/IssueModel.php');
	
	$issueModel = new IssueModel();
	$issues = $issueModel->getIssue();
	$counts = [];

	foreach($issues as $issue) {
		if (strtotime($issue['last_updated']) > strtotime("-1 week")) {
			$counts[$issue['status']]++;
			$counts['total']++;
		}
	}
?>

<!DOCTYPE html>
<html lang="en">
	<head>  
		<?php require_once('includes/header.php'); ?>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
	</head>
	
	<body>
		<?php require_once('includes/navbar.php'); ?>
		<div class="container-fluid ml-3 mt-3">
			<h3 class="mb-5">Dashboard</h3>
			<div class="row">
				<div class="card ml-3 mr-5 col-6">
					<div class="card-body">
						<div>
							<canvas id="pieChart" style="width:100%;max-width:700px" data-stats="<?php echo htmlspecialchars(json_encode($counts), ENT_QUOTES, 'UTF-8'); ?>"></canvas>
						</div>
					</div>
				</div>
				<div class="card col-5">
					<div class="card-body">
						<h4 class="pb-5">Weekly Report Summary</h4>
						<div class="row">
							<div class="col-6">
								<p class="text-center">Total created/updated reports:</p>
								<h4 class="text-center"><?php echo $counts['total'] ?></h4>
							</div>
							<div class="col-6">
								<p class="text-center">Reports pending action:</p>
								<h4 class="text-center"><?php echo $counts['PENDING'] ?></h4>
							</div>
						</div>
						<div class="pt-2 row">
							<div class="col-6">
								<p class="text-center">Reports in progress:</p>
								<h4 class="text-center"><?php echo $counts['IN_PROGRESS'] ?></h4>
							</div>
							<div class="col-6">
								<p class="text-center">Reports resolved:</p>
								<h4 class="text-center"><?php echo $counts['COMPLETED'] ?></h4>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<?php require_once('includes/footer.php'); ?>
	</body>

	<script>
		$stats = $('#pieChart').data('stats');
		var xValues = ['Pending', 'In Progress', 'Completed'];
		var yValues = [$stats.PENDING ?? 0, $stats.IN_PROGRESS ?? 0, $stats.COMPLETED ?? 0];
		var colors = ['#B8221D', '#2B5797', '#1E7145'];

		new Chart('pieChart', {
			type: 'pie',
			data: {
				labels: xValues,
				datasets: [{
				backgroundColor: colors,
				data: yValues
				}]
			},
			options: {
				title: {
				display: true,
				text: 'Reports in Past Week',
				fontSize: 18,
				fontColor: '#212529'
				}
			}
			});
	</script>
</html>