<?php

require_once "../libs/DBaccess.php";
require_once "../libs/helper.php";

session_start();

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$type = cleanFromTags($input['type'] ?? "Workout");
$title = cleanFromTags($input['title'] ?? "");
$text = cleanFromTags($input['text'] ?? "");
$link = $input['link'] ?? ""; //it's not necessary to clean tags here since it would be not pass URL validation


$validLink = true;
$validTitle = validateText($title);
if($link != ""){
    $validLink = validateLink($link);
}
$validText = validateText($text);
$validType = validateType($type);


if($validLink && $validText && $validTitle && $validType) {
    $DBaccess = new DBaccess();

    if($DBaccess->getConnection()){

        $response['ok'] = $DBaccess->insertNews($type,$title, $text, $link);
    }else{

        $response['ok'] = false;
    }
    $DBaccess-> closeConnection();
    $response['red'] = '/?r=adminPanel';

}else{

    $response['ok'] = false;

    $elements = array(
        'r' => 'adminPanel'
    );

    if(!$validTitle){

        $elements['eti'] = 'error';
    }
    if(!$validLink){

        $elements['eli'] = 'error';
    }

    if(!$validText){

        $elements['ete'] = 'error';
    }

    if(!$validType){

        $elements['ety'] = 'error';
    }

    $redirect = '/?' . http_build_query($elements);

    $response['red'] = $redirect;
}

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;