<?php
define("PROJECT_ROOT_PATH", __DIR__ . "/../");
 
// include main configuration file
require_once PROJECT_ROOT_PATH . "/../../config/dbinfo.inc";
 
// include the base controller file
require_once PROJECT_ROOT_PATH . "/Controller/BaseController.php";
 
// include the issue model file
require_once PROJECT_ROOT_PATH . "/Model/IssueModel.php";

// include the user model file
require_once PROJECT_ROOT_PATH . "/Model/UserModel.php";

// include the category model file
require_once PROJECT_ROOT_PATH . "/Model/CategoryModel.php";
?>