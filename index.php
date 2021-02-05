<?php

require_once 'libs/Parser.php';
require_once "libs/Renderer.php";
require_once "vendor/autoload.php";
require_once "libs/contentCreator.php";
require_once "libs/DBaccess.php";

$parser = new Parser();

$parser-> addRoute('home', function (string $data){
    return $data;
}, array(
    'title' => 'Home - La Palestra'
));

$parser-> addRoute('workout', function (string $data){
    return $data;
}, array(
    'title' => 'Workout - La Palestra'
));

$parser-> addRoute('alimentation', function (string $data){

    return createAlimentationContent($data);
}, array(
    'title' => 'Alimentazione - La Palestra'
));

$parser-> addRoute('singleRecipe', function (string $data){

    return createSingleRecipeContent($data);
}, array(
    'title' => '<recipeTitlePlaceHolder /> - Alimentazione - La Palestra'
));

$parser-> addRoute('forum', function (string $data){
    return $data;
}, array(
    'title' => 'Forum - La Palestra'
));

$parser-> addRoute('news', function (string $data){
    return $data;
}, array(
    'title' => 'News - La Palestra'
));

$parser-> onNotFound(function (){
						  header('location: 404.html');
						  });

$parser-> parse();
