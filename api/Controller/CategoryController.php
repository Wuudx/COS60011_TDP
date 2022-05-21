<?php
class CategoryController extends BaseController {

    public function categoryAction() {
        $model = new CategoryModel(); // new model
        $strErrorDesc = ''; // String to hold error message
        $requestMethod = $_SERVER["REQUEST_METHOD"]; // Getting the request method

        // Assignment of the correct function for the given request method
        if (strtoupper($requestMethod) == 'GET') {
            try { // Try query
                $data = $model->getCategory();
                $responseData = json_encode($data);
            } catch (Error $e) { // Error
                $strErrorDesc = $e->getMessage().' Something went wrong! Please contact support.';
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';
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