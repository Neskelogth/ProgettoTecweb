<?php

require_once "../libs/DBaccess.php.php";
require_once "../libs/contentCreator.php";

session_start();

$dbaccess = new DBaccess();

$result = $dbaccess-> getPostsList($_SESSION['username'] ?? "") ?? array();


$response = array('ok'=> true, 'result' => array());

foreach ($result as $item) {


    //$item['Testo'] = urlencode($item['Testo']);
    array_push($response['result'], $item);
    //echo json_encode($item);
}

//var_dump($response);

$response = json_encode($response, JSON_THROW_ON_ERROR);


header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;
