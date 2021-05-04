<?php

require_once "../libs/DBaccess.php";
require_once "../libs/contentCreator.php";
require_once "../libs/helper.php";

session_start();

$DBaccess = new DBaccess();

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$username = $_SESSION["username"] ?? "";
$text = cleanInput($input["val"] ?? "");
$idPost = intval($input["idPost"] ?? -1);


if(strlen($username)!=0 && strlen($text)>0 && $idPost > 0) {

    if($DBaccess->getConnection()){

        $response['ok'] = $DBaccess->insertAnswer($username,$text, $idPost);
    }else{

        $response['ok'] = false;
        //echo"Banana";
    }
}
$DBaccess-> closeConnection();

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;