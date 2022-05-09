<?php
require_once PROJECT_ROOT_PATH . '/Model/Database.php';
 
class StaffModel extends Database {

    public function getUserByEmail($email) {
        $query = 'SELECT staff_id, first_name, last_name, email, password FROM staff WHERE email = ?';
        return $this->select($query, [$email]);
    }
}
?>
