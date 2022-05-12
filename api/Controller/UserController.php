<?php
class UserController extends BaseController {

    public function userAction() {
        $model = new UserModel(); // new model
        $strErrorDesc = ''; // String to hold error message
        $requestMethod = $_SERVER["REQUEST_METHOD"]; // Getting the request method
        $queryParams = $this->getQueryStringParams(); // Query parameters
        $uri = $this->getUriSegments(); // Getting the URI

        if (isset($uri[3])) { // The third uri element is set - eg. /api/issues/XXXX
            if ($uri[3] == 'id') { // ID handling
                if (strtoupper($requestMethod) != 'GET') { // Checking request method is valid for the endpoint
                    $requestMethod = null;
                }

                if (isset($uri[4])) { // Checking the user id is given as uri[4]
                    $queryParams['user_id'] = $uri[4];
                } else {
                    $requestMethod = null;
                }
            }

            elseif ($uri[3] == 'device') { // Device handling
                if (strtoupper($requestMethod) != 'GET') { // Valid request method
                    $requestMethod = null;
                }

                if (isset($uri[4])) { // Given device?
                    $queryParams['device_id'] = $uri[4];
                } else {
                    $requestMethod = null;
                }
            }

            elseif ($uri[3] == 'rank') { // rank handling
                if (strtoupper($requestMethod) != 'GET') { // Valid request method
                    $requestMethod = null;
                }

                if (isset($uri[4])) { // rank given?
                    $queryParams['rank'] = $uri[4];
                } else {
                    $requestMethod = null;
                }
            }

            else {
                $requestMethod = null;
            }
        } else { // No further endpoint given - /api/user
            if (strtoupper($requestMethod) != ('GET'||'POST')) { // Checking request method is valid for the endpoint
                $requestMethod = null;
            }
        }

        // Assignment of the correct function for the given request method
        if (strtoupper($requestMethod) == 'GET') {
            try { // Try query
                $data = $model->getUser($queryParams);
                $responseData = json_encode($data);
            } catch (Error $e) { // Error
                $strErrorDesc = $e->getMessage().' Something went wrong! Please contact support.';
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';
            }
        } 
        elseif (strtoupper($requestMethod) == 'POST') {
            try {
                $data = $model->postUser($queryParams);
                $responseData = json_encode($data);
            } catch (Error $e) {
                $strErrorDesc = $e->getMessage(). ' Something went wrong! Please contact support.'; // TODO
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error'; // TODO
            }
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
