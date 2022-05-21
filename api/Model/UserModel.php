<?php
require_once PROJECT_ROOT_PATH . '/Model/Database.php';
 
class UserModel extends Database {

    public function getUser($params = []) {
        $query = 'SELECT * FROM `users`'; // Initial query - will add to this
        $limit = $params['limit'];
        $paramNames = []; // Temp array to hold the param argument names

        unset($params['limit']);        
        
        if ($params) { // If there are WHERE arguments appending that to the query
            foreach ($params as $key=>$value) { // Filling the temp array with where clause variables
                array_push($paramNames, $key . '`=?'); // Array push var=?
            }
            
            $query .= ' WHERE `' . implode(' AND `', $paramNames);
        }

        $query .= ' ORDER BY `user_id` ASC'; // Append the limit to the query
        
        if (isset($limit) && $limit) { // If a limit param is given set it to that
            $params = $params + array('limit'=>$limit);

            $query .= ' LIMIT ?';
        }

        return $this->select($query, array_values($params));
    }


    public function postUser($params = []) {
        // Generating query
        $query = 'INSERT INTO `users` (`' . implode('`, `', array_keys($params)) . '`) VALUES (' . implode(', ', array_fill(0, count($params), '?')) . ')';

        return $this->insert($query, array_values($params));
    }

    public function getUserPoints($params = []) {
        $query = 'SELECT * FROM `users` ORDER BY `points` ';

        $query .= (isset($params['order']) ? $params['order'] : 'DESC');

        return $this->select($query, null);
    }
}
?>