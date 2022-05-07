<?php
require __DIR__ . "/inc/bootstrap.php";
require PROJECT_ROOT_PATH . "/Controller/IssueController.php";


if (isset($uri[2]) && $uri[2] == 'issue') { // Issue Model
    $controller = new IssueController();
    $controller->issueAction();
} else { // Invalid endpoint - no model found
    $strErrorDesc = 'Method not supported';
    $strErrorHeader = 'HTTP/1.1 400 Bad Request';
    $controller = new BaseController();
    $controller->sendOutput(json_encode(array('error' => $strErrorDesc)), 
    array('Content-Type: application/json', $strErrorHeader));
}
?>
