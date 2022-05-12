<?php
require_once PROJECT_ROOT_PATH . '/Model/Database.php';
 
class IssueModel extends Database {

    public function getIssue($params = []) {
        $query = 'SELECT * FROM `issue`'; // Initial query - will add to this
        $limit = $params['limit'];
        $paramNames = []; // Temp array to hold the param argument names

        unset($params['limit']);        
        
        if ($params) { // If there are WHERE arguments appending that to the query
            foreach ($params as $key=>$value) { // Filling the temp array with where clause variables
                array_push($paramNames, $key . '`=?'); // Array push var=?
            }
            
            $query .= ' WHERE `' . implode(' AND `', $paramNames);
        }

        if (isset($limit) && $limit) { // If a limit param is given set it to that
            $params = $params + array('limit'=>$limit);
        } else { // otherwise always limit results to 10 to avoid fetching the whole database
            $params = $params + array('limit'=>10);
        }

        $query .= ' ORDER BY `issue_id` ASC LIMIT ?'; // Append the limit to the query

        return $this->select($query, array_values($params));
    }


    public function postIssue($params = []) {
        // Generating query
        $query = 'INSERT INTO `issue` (`' . implode('`, `', array_keys($params)) . '`) VALUES (' . implode(', ', array_fill(0, count($params), '?')) . ')';

        return $this->insert($query, array_values($params));
    }


    public function patchIssue($params = []) {
        $query = 'UPDATE issue'; // Initial query - will add to this
        $issueID = $params['issue_id']; // Isolation of the issue id
        $paramNames = []; // temp array to hold paramnames

        unset($params['issue_id']); // Removing from param list
        
        if ($params) { // If there are SET arguments appending that to the query
            foreach ($params as $key=>$value) { // Filling the temp array with SET clause variables
                array_push($paramNames, $key . '=?'); // Array push -> name=?
            }
            
            $query .= ' SET ' . implode(' AND ', $paramNames);
        }

        $params = $params + array('issue_id'=>$issueID); // Adding issue_id back for correct sql binding

        $query .= ' WHERE issue_id=?';

        return $this->update($query, array_values($params));
    }


    public function deleteIssue($params = []) {
        $query = 'DELETE FROM issue';
        $paramNames = [];

        if ($params) { // If there are WHERE arguments appending that to the query
            foreach ($params as $key=>$value) { // Filling the temp array with where clause variables
                array_push($paramNames, $key . '=?'); // Array push var=?
            }
            
            $query .= ' WHERE ' . implode(' AND ', $paramNames);
        } else { // NO ARGUMENTS GIVEN - DO NOT DELETE ALL DATA - SHOULD NEVER BE HERE... BUT JUST INCASE
            $query = '';
        }

        return $this->delete($query, array_values($params));
    }
}
?>
