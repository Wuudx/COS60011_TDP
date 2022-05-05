<?php
require_once PROJECT_ROOT_PATH . "/Model/database.php";
 
class GetData extends Database
{
    public function getData($limit)
    {
        return $this->select("SELECT * FROM API_test_table ORDER BY id ASC LIMIT ?", ["i", $limit]);
    }
}
?>