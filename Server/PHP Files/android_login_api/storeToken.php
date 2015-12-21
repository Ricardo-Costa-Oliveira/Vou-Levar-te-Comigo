<?php
 
require_once 'include/DB_Functions.php';
$db = new DB_Functions();
 
// json response array
$response = array("error" => FALSE);
 
if (isset($_POST['tokenName'] )) {
 
    // receiving the post params
    $tname = $_POST['tokenName'];
   
 
    // check if user is already existed with the same email
   
        // create a new token
        $token = $db->storeToken($tname);
        if ($token) {
            // user stored successfully
            $response["error"] = FALSE;
            $response["token"] = $token["token"];
           
            echo json_encode($response);
        } else {
            // user failed to store
            $response["error"] = TRUE;
            $response["error_msg"] = "Unknown error occurred in registration!";
            echo json_encode($response);
        }
    
} else {
    $response["error"] = TRUE;
    $response["error_msg"] = "Required parameters (token) is missing!";
    echo json_encode($response);
}
?>