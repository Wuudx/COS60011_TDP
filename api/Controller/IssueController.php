<?php
class IssueController extends BaseController {

    public function issueAction() {
        $model = new IssueModel();
        $strErrorDesc = '';
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        $queryParams = $this->getQueryStringParams();

        if (strtoupper($requestMethod) == 'GET') {
            try {
                $data = $model->getData($queryParams);
                $responseData = json_encode($data);
            } catch (Error $e) {
                $strErrorDesc = $e->getMessage().' Something went wrong! Please contact support.';
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';
            }
        } 
        elseif (strtoupper($requestMethod) == 'POST') {
            try {
                $data = $model->postData($queryParams);
                $responseData = json_encode($data);
            } catch (Error $e) {
                $strErrorDesc = $e->getMessage(). ' Something went wrong! Please contact support.'; // TODO
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error'; // TODO
            }
        } 
        elseif (strtoupper($requestMethod) == 'PATCH') {
            try {
                if (isset($params['issue_id']) && $params['issue_id']) {
                    $data = $model->patchData($queryParams);
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
                // TODO

            } catch (Error $e) {
                $strErrorDesc = $e->getMessage(). ' Something went wrong! Please contact support.';// TODO
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';// TODO
            }
        } else {
            $strErrorDesc = 'Method not supported';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }
 
        // send output
        if (!$strErrorDesc) {
            $this->sendOutput(
                $responseData,
                array('Content-Type: application/json', 'HTTP/1.1 200 OK')
            );
        } else {
            $this->sendOutput(json_encode(array('error' => $strErrorDesc)), 
                array('Content-Type: application/json', $strErrorHeader)
            );
        }
    }
}
?>
