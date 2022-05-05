<?php
include "../../config/dbinfo.inc"; 
 
// Create connection to MySQL database 
$conn = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
 
// Verify connection to DB
if (mysqli_connect_errno()){
    die("ERROR: Failed to connect to DB. " . mysqli_connect_error());
}
?>