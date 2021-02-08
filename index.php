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
    'title' => 'Home - La Palestra',
    'id' => 'contenthome'
));

$parser-> addRoute('workout', function (string $data){
    return $data;
}, array(
    'title' => 'Workout - La Palestra',
    'id' => 'content'
));

$parser-> addRoute('alimentation', function (string $data){

    return createAlimentationContent($data);
}, array(
    'title' => 'Alimentazione - La Palestra',
    'id' => 'content'
));

$parser-> addRoute('singleRecipe', function (string $data){

    return createSingleRecipeContent($data, $_GET['id']);
}, array(
    'title' => '<recipeTitlePlaceholder /> - Alimentazione - La Palestra',
    'id' => 'content'
));

$parser-> addRoute('forum', function (string $data){
    return $data;
}, array(
    'title' => 'Forum - La Palestra',
    'id' => 'content'
));

$parser-> addRoute('news', function (string $data){
    return $data;
}, array(
    'title' => 'News - La Palestra',
    'id' => 'content'
));

$parser-> onNotFound(function (){
						  header('location: 404.html');
						  });

$parser->addDefault('home');

$parser-> parse();
