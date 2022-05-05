<?php
require __DIR__ . "/inc/bootstrap.php";
require PROJECT_ROOT_PATH . "/Controller/QueryController.php";

echo "<h1>";
// // echo var_dump($objFeedController);
echo $uri[2];
// $test = parse_str($_SERVER['QUERY_STRING'], $query);
// echo $test['limit'];
echo "</h1>";

$objFeedController = new QueryController();
$strMethodName = $uri[2] . 'Action';
$objFeedController->{$strMethodName}();
// echo "<h1>";
// // echo var_dump($objFeedController);
// echo "</h1>";
// 

?>