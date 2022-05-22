<?php
// Initialize the session
session_start();

require_once('api/inc/bootstrap.php');
require_once('api/Model/StaffModel.php');

$email = $password = "";
$loginErr = "";
 
// Process login form data when submitted
if($_SERVER["REQUEST_METHOD"] === "POST") {
 
    $email = trim($_POST["email"]);
    $password = trim($_POST["password"]);
    
    // Validate credentials
    if(!empty($email) && !empty($password)) {

        $model = new StaffModel();
        $data = $model->getUserByEmail($email);

        if (count($data) > 0)
        {
            $user = $data[0];
            if ($password == $user['password']) // TODO: use password hashes
            {
                // Password is correct, create new session
                session_start();
                            
                // Store user info in session variables
                $_SESSION["loggedin"] = true;
                $_SESSION["id"] = $user['staff_id'];
                $_SESSION["email"] = $email;                            
                
                // Redirect user to home page
                header("location: home");
            }
            else
            {
                // Incorrect password
                $loginErr = "Invalid email or password.";
            }
        }
        else
        {
            // User doesn't exist, displaying generic error
            $loginErr = "Invalid email or password.";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
	<head>  
		<?php require_once('includes/header.php'); ?>
	</head>
	
	<body>
		<div class="container-fluid mt-3">
		    <h3 class="text-center mb-5">Welcome to council reporting</h3>
            <form action="/login" method="post">
                <?php 
                    if (!empty($loginErr)) {
                        echo '<div class="row d-flex justify-content-center">';
                        echo '<div class="alert alert-danger col-lg-4">' . $loginErr . '</div>';
                        echo '</div>';
                    }        
                ?>
                <div class="row d-flex justify-content-center">
                    <div class="form-group col-lg-4">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" name="email" placeholder="example@email.com" required>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="form-group col-lg-4">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
		</div>
		<?php require_once('includes/footer.php'); ?>
	</body>
</html>