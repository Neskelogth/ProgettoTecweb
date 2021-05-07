<?php

require_once "../libs/DBaccess.php";
require_once "../libs/helper.php";

session_start();

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$name = cleanFromTags($input['name']);
$description = cleanFromTags($input['description']);
$link = cleanFromTags($input['link']);
$alt = cleanFromTags($input['alt']);
$ingredients = cleanFromTags($input['ingredients']);
$method = cleanFromTags($input['method']);
$hints = cleanFromTags($input['hints']);
$people = cleanFromTags($input['people']);

$opts = array(

    'checkForFormat' => true,
    'checkOnlyName' => true
);

$validName = validateText($name);
$validDescription = validateText($description);
$validLink = validateText($link, $opts);
$validAlt = validateText($alt);
$validIngredients = validateText($ingredients);
$validMethod = validateText($method);
$validHints = cleanFromTags($hints);
$validPeople = validateText($people);

if($validAlt && $validDescription && $validHints && $validIngredients && $validLink && $validMethod && $validName && $validPeople){

    $DBaccess = new DBaccess();

    if($DBaccess-> getConnection()){

        $response['ok'] = $DBaccess-> insertRecipe($name, $description, $link, $alt, $ingredients, $method, $hints, $people);
    }else{

        $response['ok'] = false;
    }

    $response['red'] = '/?r=adminPanel';

}else{

    $elements = array(
        'r' => 'adminPanel'
    );

    if(!$validPeople){

        $elements['erp'] = 'error';
    }

    if(!$validName){

        $elements['ern'] = 'error';
    }

    if(!$validMethod){

        $elements['erm'] = 'error';
    }

    if(!$validLink){

        $elements['erl'] = 'error';
    }

    if(!$validIngredients){

        $elements['eri'] = 'error';
    }

    if(!$validHints){

        $elements['erh'] = 'error';
    }

    if(!$validDescription){

        $elements['erd'] = 'error';
    }

    if(!$validAlt){

        $elements['era'] = 'error';
    }

    $redirect = '/?' . http_build_query($elements);

    $response['red'] = $redirect;
}

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;