<?php
require_once PROJECT_ROOT_PATH . '/Model/Database.php';
 
class StaffModel extends Database {

    public function getUserByEmail($email) {
        $query = 'SELECT staff_id, first_name, last_name, email, password FROM staff WHERE email = ?';
        return $this->select($query, [$email]);
    }

    public function getStaffList() {
        $query = 'SELECT staff_id, first_name, last_name FROM staff';
        $results = $this->select($query);
        $staffList = [];
        foreach ($results as $staff) {
            $staffList[$staff["staff_id"]] = $staff["first_name"] . ' ' . $staff["last_name"];
        }

        return $staffList;
    }
}
?>
