<?php
	require_once('api/inc/bootstrap.php');
	require_once('api/Model/StaffModel.php');
	
	$staffModel = new StaffModel();
    $data = $staffModel->getUserByEmail($_SESSION["email"]);

	if (count($data) > 0)
	{
		$user = $data[0];
	}
?>
<!DOCTYPE html>
<html lang="en">
	<head>  
		<?php require_once('includes/header.php'); ?>
	</head>
	<body>
		<?php require_once('includes/navbar.php'); ?>
		<div class="container-fluid mt-3">
		  <h3 class="ml-3 mb-3">Profile</h3>
		  <div class="card ml-3 w-50">
			<div class="card-body">
				<div>
					<h6>Email:</h6>
					<p><?php echo $user['email']; ?></p>
				</div>
				<div>
					<h6>Name:</h6>
					<p><?php echo $user['first_name'] . ' ' . $user['last_name']; ?></p>
				</div>
				<div>
					<h6>Password:</h6>
					<p><?php echo str_repeat("*", strlen($user['password'])); ?></p>
				</div>
			</div>
		  </div>
		</div>
		<?php require_once('includes/footer.php'); ?>
	</body>
</html>