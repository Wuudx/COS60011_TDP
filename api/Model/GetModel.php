<?php
require_once PROJECT_ROOT_PATH . "/Model/Database.php";
 
class GetModel extends Database {

    public function getData($limit) {
        return $this->select("SELECT * FROM API_test_table");
    }
}
?>