<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
</html>

<?php
    // require_once('api/inc/bootstrap.php');
    // require_once('api/Model/StaffModel.php');
    // include "../includes/header.php";
    $hostname = "localhost";
    $username = "root";
    $password = "root";
    $database = "council_project";
    $connection = mysqli_connect($hostname, $username, $password, $database);
    if(!$connection) {
        die("Conenction FAILED" . mysqli_error($connection));
    }
    
    $query = "SELECT i.vote AS votes,
                     i.address AS address,
                     i.status AS status, 
                     i.description AS issue,
                     c.description AS category 
              FROM issue AS i 
              INNER JOIN category AS c ON c.id = i.category_1 
              WHERE status != 'COMPLETED' 
              ORDER BY votes DESC 
              LIMIT 10;";
    $result = mysqli_query($connection, $query);
?>

<!-- Table header -->
    <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Number of votes</th>
                    <th scope="col">Address</th>
                    <th scope="col">Status</th>
                    <th scope="col">Issue</th>
                    <th scope="col">Category</th>
                </tr>
            </thead>
            <tbody>

<!-- Content of table -->
<?php
    // row count for the table
    $count = 0;

    while($row = mysqli_fetch_assoc($result)) {

        // skip the header row of SQL result
        if($count == 0) {
            $count ++;
            continue;
        } else {
            
            // Shorten the text in description column of issue table to 50 characters
            if(strlen($row["issue"]) > 50) {
                $row["issue"] = substr($row["issue"], 0, 50) . "...";
            }

            // fill in the table
            echo "<tr>";
            echo "<th scope='row'>" . $count . "</th>";
            echo "<td>" . $row["votes"] . "</td>";
            echo "<td>" . $row["address"] . "</td>";
            echo "<td>" . strtolower($row["status"]) . "</td>";
            echo "<td>" . $row["issue"] . "</td>";
            echo "<td>" . $row["category"] . "</td>";
            echo "</tr>";
            $count++;
        }
    }

    echo "</tbody>";
    echo "</table>";
?>




<?php
    // include "../includes/footer.php";
?>