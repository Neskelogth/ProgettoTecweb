<?php

require_once "../libs/DBaccess.php";
require_once "../libs/Renderer.php";
require_once __DIR__ . "/../vendor/autoload.php";
use \Gobie\Regex\Wrappers\Pcre\PcreRegex;

session_start();

$response = array(
    'user' => 'ok',
    'password' => 'ok',
    'internalError' => array()
);

$keys = array(

    'user' => $_POST['username'] ?? "",
    'password' => $_POST['password'] ?? ""
);

if((strpos($keys['user'], '"') + strpos($keys['user'], "'")) != -2){

    $response['user'] = 'that_was_a_SQL_injection_try';
}

if($keys['user'] == ""){

    $response['user'] = 'empty';
}

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;
