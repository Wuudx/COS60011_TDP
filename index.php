<?php
/**
*	Routing
*/
$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode("/", $uri);

// Initialize the session
session_start();

// If user not logged in redirect to login 
if(!in_array($uri[1], ['login', 'api']) && !isset($_SESSION["loggedin"])) {
    header("location: login");
    exit;
}

//echo "<h2>$route</h2>";

switch ($uri[1]) {
    case '/' :
    case '' :
    case 'home' :
        require __DIR__ . '/views/home.php';
        break;
    case 'login' :
        require __DIR__ . '/views/login.php';
        break;
    case 'logout' :
        require __DIR__ . '/includes/logout.php';
        break;
	case 'profile' :
        require __DIR__ . '/views/profile.php';
        break;
    case 'api' :
        require __DIR__ . '/api/api.php';
        break;
    default:
        require __DIR__ . '/views/404.php';
        break;
}
?>