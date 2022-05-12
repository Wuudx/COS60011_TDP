<?php
class IssueController extends BaseController {

    public function issueAction() {
        $model = new IssueModel(); // new model
        $strErrorDesc = ''; // String to hold error message
        $requestMethod = $_SERVER["REQUEST_METHOD"]; // Getting the request method
        $queryParams = $this->getQueryStringParams(); // Query parameters
        $uri = $this->getUriSegments(); // Getting the URI

        if (isset($uri[3])) { // The third uri element is set - eg. /api/issues/XXXX
            if ($uri[3] == 'id') { // ID handling
                if (strtoupper($requestMethod) != ('GET'||'PATCH'||'DELETE')) { // Checking request method is valid for the endpoint
                    $requestMethod = null;
                }

                if (isset($uri[4])) { // Checking the issue id is given as uri[4]
                    $queryParams['issue_id'] = $uri[4];
                } else {
                    $requestMethod = null;
                }
            }

            elseif ($uri[3] == 'category') { // Category handling
                if (strtoupper($requestMethod) != 'GET') { // Valid request method
                    $requestMethod = null;
                }

                if (isset($uri[4])) { // Given category?
                    $queryParams['category_1'] = $uri[4];
                } else {
                    $requestMethod = null;
                }
            }

            elseif ($uri[3] == 'user') { // User_id handling
                if (strtoupper($requestMethod) != ('GET'||'POST')) { // Valid request method
                    $requestMethod = null;
                }

                if (isset($uri[4])) { // User_id given?
                    $queryParams['user_id'] = $uri[4];
                } else {
                    $requestMethod = null;
                }
            }

            else {
                $requestMethod = null;
            }
        } else { // No further endpoint given - /api/issue
            if (strtoupper($requestMethod) != ('GET'||'POST')) { // Checking request method is valid for the endpoint
                $requestMethod = null;
            }
        }

        // Assignment of the correct function for the given request method
        if (strtoupper($requestMethod) == 'GET') {
            try { // Try query
                $data = $model->getIssue($queryParams);
                $responseData = json_encode($data);
            } catch (Error $e) { // Error
                $strErrorDesc = $e->getMessage().' Something went wrong! Please contact support.';
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';
            }
        } 
        elseif (strtoupper($requestMethod) == 'POST') {
            try {
                $data = $model->postIssue($queryParams);
                $responseData = json_encode($data);
            } catch (Error $e) {
                $strErrorDesc = $e->getMessage(). ' Something went wrong! Please contact support.'; // TODO
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error'; // TODO
            }
        } 
        elseif (strtoupper($requestMethod) == 'PATCH') {
            try {
                if (isset($queryParams['issue_id']) && $queryParams['issue_id']) {
                    $data = $model->patchIssue($queryParams);
                } else {
                    $strErrorDesc = 'No issue_id field given.';
                    $strErrorHeader = 'HTTP/1.1 400 Bad Request';
                }

            } catch (Error $e) {
                $strErrorDesc = $e->getMessage(). ' Something went wrong! Please contact support.';// TODO
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';// TODO
            }
        } 
        elseif (strtoupper($requestMethod) == 'DELETE') {
            try {
                $data = $model->deleteIssue($queryParams);
                $responseData = json_encode($data);
            } catch (Error $e) {
                $strErrorDesc = $e->getMessage(). ' Something went wrong! Please contact support.';// TODO
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';// TODO
            }
        } else { // No valid method given - or invalid endpoint format
            $strErrorDesc = 'Method not supported';
            $strErrorHeader = 'HTTP/1.1 400 Bad Request';
        }
 
        // send output
        if (!$strErrorDesc) { // No error message = success
            $this->sendOutput(
                $responseData,
                array('Content-Type: application/json', 'HTTP/1.1 200 OK')
            );
        } else { // Error somewhere
            $this->sendOutput(json_encode(array('error' => $strErrorDesc)), 
                array('Content-Type: application/json', $strErrorHeader)
            );
        }
    }
}
?>
