<?php
require_once PROJECT_ROOT_PATH . '/Model/Database.php';
 
class IssueModel extends Database {

    public function getData($params = []) {
        $query = 'SELECT * FROM issue'; // Initial query - will add to this
        $paramNames = []; // Temp array to hold the param argument names
        
        foreach ($params as $key=>$value) { // Filling the temp array with where clause variables
            if ($key == 'limit') {
                continue;
            }
            array_push($paramNames, $key . '=?'); // Array push var=?
        }

        if ($paramNames) { // If there are WHERE arguments appending that to the query
            $query .= ' WHERE ' . implode('AND', $paramNames);
        }

        if (isset($params['limit']) && $params['limit']) { // If a limit param is given set it to that
            $params = $params + array('limit'=>$params['limit']);
        } else { // otherwise always limit results to 10 to avoid fetching the whole database
            $params = $params + array('limit'=>10);
        }

        $query .= ' ORDER BY issue_id ASC LIMIT ?'; // Append the limit to the query

        return $this->select($query, array_values($params));
    }


    public function postData($params = []) {
        // Generating query
        $query = 'INSERT INTO issue (' . implode(', ', array_keys($params)) . ') VALUES (' . implode(', ', array_fill(0, count($params), '?')) . ')';

        return $this->insert($query, array_values($params));
    }


    public function patchData($params = []) {
        $query = 'UPDATE issues'; // Initial query - will add to this
        $issueID = $params['issue_id']; // Isolation of the issue id 

        unset($params['issue_id']); // Removing from param list
        
        if ($params) { // If there are SET arguments appending that to the query
            $query .= ' SET ' . implode(',', $params);
        }

        $params = $params + array('issue_id'=>$issueID); // Adding issue_id back for correct sql binding

        $query .= ' WHERE issue_id=?';

        return $this->update($query, array_values($params));
    }
}
?>
