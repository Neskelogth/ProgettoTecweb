<?php

require_once "../libs/DBaccess.php";
require_once "../libs/Renderer.php";
require_once __DIR__ . "/../vendor/autoload.php";
use \Gobie\Regex\Wrappers\Pcre\PcreRegex;

session_start();

$response = array(
    'user' => 'ok',
    'mail' => 'ok',
    'name' => 'ok',
    'surname' => 'ok',
    'password' => 'ok',
    'rePassword' => 'ok',
    'internalError' => array()
);

$input = json_decode(file_get_contents("php://input"), true);

$keys = array(

    'user' => $input['username'] ?? "",
    'mail' => $input['mail'] ?? "",
    'name' => $input['name'] ?? "",
    'surname' => $input['surname'] ?? "",
    'password' => $input['password'] ?? "",
    'rePassword' => $input['rePassword'] ?? ""
);

$DBaccess = new DBaccess();

$connection = $DBaccess-> getConnection();

$existingMail = false;
$existingUsername = false;

if($connection === false){

    $response['internalError'] = 'connection_to_db_went_wrong';
}else{

    $existingUsername = $DBaccess->getUsernameQuery($keys['user']);
    $existingMail = $DBaccess->getMailQuery($keys['mail']);
}
$DBaccess-> closeConnection();

//checking if user exists
if($existingUsername){

    $response['user'] = 'already_exists';
}
if($existingMail){

    $response['mail'] = 'already_exists';
}

//checking mail input
$atPos = strpos($keys['mail'], '@');
$dotPos = strrpos($keys['mail'], '.');

if($atPos === false || $dotPos === false || $dotPos == strlen($keys['mail'] - 1)){

    $response['mail'] = 'invalid_mail';
}else{

    //chech for valid mail and enough length of mail
    if(!filter_var($keys['mail'], FILTER_VALIDATE_EMAIL || ($dotPos - $atPos) < 3) || $atPos < 3){

        $keys['mail'] = filter_var($keys['mail'], FILTER_SANITIZE_EMAIL);
        if(!filter_var($keys['mail'], FILTER_VALIDATE_EMAIL)){

            $keys['mail'] = 'not_sanitazable';
        }
    }
}

//checking for sql injection
$regex = "/(?i)^[a-z0-9]+$/";

foreach($keys as $item){

    if(!PcreRegex::match($regex, $item)){

        $response[$item] = 'not_only_letters_and_numbers';
    }
    if((strpos($item, '"') + strpos($item, "'")) != -2){

        $response[$item] = 'that_was_a_SQL_injection_try';
    }
}

//check for empty fields
foreach($keys as $item){

    if($item == ""){

        $response[$item] = "empty";
    }
}

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;
