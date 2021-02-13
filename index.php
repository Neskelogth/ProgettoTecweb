<?php

require_once 'libs/Parser.php';
require_once "libs/Renderer.php";
require_once "vendor/autoload.php";
require_once "libs/contentCreator.php";
require_once "libs/DBaccess.php";

session_start();

$parser = new Parser();

$parser-> addRoute('login', function(string $data){

    return $data;
}, array(
    'title' => 'Login - La Palestra'

));

$parser-> addRoute('signup', function(string $data){
    return $data;
}, array(

    'title' => 'Signup - La Palestra'
));

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

$parser-> addRoute('split', function (string $data){
    return $data;
}, array(
    'title' => '<splitPlaceholder /> - Workout - La Palestra',
    'id' => 'content',
    'brosplit' => ($_GET['type'] ?? "") == "bro",
    'ppl' => ($_GET['type'] ?? "") == "ppl",
    'ul' => ($_GET['type'] ?? "") == "ul",
    'fb' => ($_GET['type'] ?? "") == "fb"
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

    return createForumContent($data);
}, array(
    'title' => 'Forum - La Palestra',
    'id' => 'content'
));

$parser-> addRoute('news', function (string $data){

    $data = createNavMenuNews($data, $_GET['type'] ?? 'All');
    return createNewsContent($data, $_GET['type'] ?? 'All');
}, array(
    'title' => 'News - La Palestra',
    'id' => 'content',
    'type' => ($_GET['type'] ?? '%%All%%')
));

$parser-> onNotFound(function (){
						  header('location: 404.html');
						  });

$parser->addDefault('home');

$parser-> parse();
