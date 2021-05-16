<?php

require_once "../libs/DBaccess.php";

session_start();

$DBaccess = new DBaccess();

$result = $DBaccess-> getUserList() ?? array();

$DBaccess->closeConnection();

$response = array('ok'=> true, 'result' => array(), 'current' => $_SESSION['username'] ?? "");

foreach ($result as $item) {

    array_push($response['result'], $item);
}

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;