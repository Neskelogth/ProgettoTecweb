<?php

require_once "../libs/DBaccess.php";

session_start();



$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$type = $input['type'];
$title = $input['title'];
$text = $input['text'];
$link = $input['link'];

$DBaccess = new DBaccess();

$validTitle = validateTitle($title);
$validLink = validateLink($link);
$validText = validateText($text);
$validType = validateType($type);

if($validLink && $validText && $validTitle && $validType) {
    //inserisco informazioni nel database
    if($DBaccess->getConnection()){

        $response['ok'] = $DBaccess->insertNews($type,$title, $text, $link);
    }else{

        $response['ok'] = false;
    }
}else{

    $elements = array(
        'r' => 'adminPanel'
    );

    if(!$validTitle){

        $elements['title'] = 'true';
    }

    if(!$validLink){

        $elements['link'] = 'true';
    }

    if(!$validText){

        $elements['text'] = 'true';
    }

    if(!$validType){

        $elements['type'] = 'true';
    }

}
$DBaccess-> closeConnection();

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;