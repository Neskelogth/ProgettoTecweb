<?php

require_once "../libs/DBaccess.php";

session_start();

$DBaccess = new DBaccess();

$result = $DBaccess-> getUserData($_SESSION['username'] ?? "") ?? array();
$DBaccess->closeConnection();

$response = array(

    'ok' => true,
    'name' => $result['Nome'],
    'surname' => $result['Cognome'],
    'email' => $result['Email']
);

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;
