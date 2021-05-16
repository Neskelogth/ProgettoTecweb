<?php

require_once "../libs/DBaccess.php";
require_once "../libs/helper.php";

session_start();

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$name = $input['name'];
$surname = $input['surname'];
$email = $input['email'];
$user = $_SESSION['username'];

$dbaccess = new DBaccess();
if($dbaccess-> getConnection()){

    $response['ok'] = $dbaccess-> changeData($user, $name, $surname, $email);
    $dbaccess-> closeConnection();
}else{

    $dbaccess-> closeConnection();
    $response['ok'] = false;
}

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;


