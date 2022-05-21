<?php
require_once PROJECT_ROOT_PATH . '/Model/Database.php';
 
class CategoryModel extends Database {

    public function getCategory() {
        $query = 'SELECT * FROM `category` ORDER BY `id` ASC'; // Initial query - will add to this


        return $this->select($query, null);
    }
}
?>