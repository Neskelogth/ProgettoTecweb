<?php

require_once "../libs/DBaccess.php";
require_once "../libs/helper.php";

session_start();

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$name = cleanFromTags($input['name']);
$surname = cleanFromTags($input['surname']);
$email = cleanFromTags($input['email']);
$user = cleanFromTags($_SESSION['username']);

$dbaccess = new DBaccess();
if($dbaccess-> getConnection() && validateCredentials($user) && validateText($name) && validateText($surname) && validateEmail($email)){

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


