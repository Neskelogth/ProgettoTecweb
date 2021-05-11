<?php

require_once "../libs/DBaccess.php";

session_start();

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$user = $input["user"];

$dbaccess = new DBaccess();

if($dbaccess-> getConnection()){

    $response['ok'] = $dbaccess-> deleteUser($user);
}

$dbaccess-> closeConnection();

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;