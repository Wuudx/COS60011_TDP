<?php

session_start();
 
// Delete current session
$_SESSION = array();
session_destroy();
 
// Redirect to login page
header("location: login");
exit;
?>