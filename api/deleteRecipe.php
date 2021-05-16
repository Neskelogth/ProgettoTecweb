<?php

require_once "../libs/DBaccess.php";

session_start();

$DBaccess = new DBaccess();

$input = json_decode(file_get_contents("php://input"), true);

$recipe = $input['recipe'];

$result = $DBaccess->removeRecipe($recipe);

$DBaccess->closeConnection();

$response = array();

$response['ok'] = $result;

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;
