<?php
/**
*	Routing
*/

$route = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);

// Initialize the session
session_start();

// If user not logged in redirect to login 
if($route != '/login' && !isset($_SESSION["loggedin"])){
    //header("location: login");
    //exit;
}

//echo "<h2>$route</h2>";

switch ($route) {
    case '/' :
    case '' :
        require __DIR__ . '/views/home.php';
        break;
    case '/login' :
        require __DIR__ . '/views/login.php';
        break;
	case '/profile' :
        require __DIR__ . '/views/profile.php';
        break;
    case '/api/test' :
        require __DIR__ . '/api/api.php';
        break;
    default:
        require __DIR__ . '/views/404.php';
        break;
}