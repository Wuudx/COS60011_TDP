<?php
require_once PROJECT_ROOT_PATH . "/Model/Database.php";
 
class IssueModel extends Database {

    public function getData($limit) {
        return $this->select("SELECT * FROM API_test_table ORDER BY id ASC LIMIT ?", ["i", $limit]);
    }
}
?>