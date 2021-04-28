<?php

require_once "libs/Parser.php";
require_once "libs/Renderer.php";
require_once "libs/contentCreator.php";
require_once "libs/DBaccess.php";
require_once "vendor/autoload.php";

session_start();

$parser = new Parser();
//var_dump($_SESSION);
//var_dump($_COOKIE);
$parser-> addRoute('login', function(string $data){

    return $data;
}, array(
    'title' => 'Login - La Palestra',
    'redirect' => $_GET['prev'] ?? urlencode('/?r=home')
));

$parser-> addRoute('logout', function(string $data){

    session_destroy();
    $toRedirect = urldecode($_GET['prev'] ?? urlencode('/?r=home'));

    header("location: $toRedirect");
});

$parser-> addRoute('signup', function(string $data){
    return $data;
}, array(
    'title' => 'Signup - La Palestra',
    'redirect' => $_GET['prev'] ?? urlencode('/?r=home')
));

$parser-> addRoute('home', function (string $data){
    return $data;
}, array(
    'title' => 'Home - La Palestra',
    'id' => 'contenthome',
    'logged' => $_SESSION['username'] ?? false,
    'notlogged' =>  !($_SESSION['username'] ?? false),
    'redirect' => urlencode("/?".http_build_query($_GET))
));

$parser-> addRoute('workout', function (string $data){
    return $data;
}, array(
    'title' => 'Workout - La Palestra',
    'id' => 'content',
    'logged' => $_SESSION['username'] ?? false,
    'notlogged' =>  !($_SESSION['username'] ?? false),
    'redirect' => urlencode("/?".http_build_query($_GET))
));

$parser-> addRoute('split', function (string $data){
    return $data;
}, array(
    'title' => '<splitPlaceholder /> - Workout - La Palestra',
    'id' => 'content',
    'brosplit' => ($_GET['type'] ?? "") == "bro",
    'ppl' => ($_GET['type'] ?? "") == "ppl",
    'ul' => ($_GET['type'] ?? "") == "ul",
    'fb' => ($_GET['type'] ?? "") == "fb",
    'logged' => $_SESSION['username'] ?? false,
    'notlogged' =>  !($_SESSION['username'] ?? false),
    'redirect' => urlencode("/?".http_build_query($_GET))
));

$parser-> addRoute('alimentation', function (string $data){

    return createAlimentationContent($data);
}, array(
    'title' => 'Alimentazione - La Palestra',
    'id' => 'content',
    'logged' => $_SESSION['username'] ?? false,
    'notlogged' =>  !($_SESSION['username'] ?? false),
    'redirect' => urlencode("/?".http_build_query($_GET))
));

$parser-> addRoute('singleRecipe', function (string $data){

    return createSingleRecipeContent($data, $_GET['id']);
}, array(
    'title' => '<recipeTitlePlaceholder /> - Alimentazione - La Palestra',
    'id' => 'content',
    'logged' => $_SESSION['username'] ?? false,
    'notlogged' =>  !($_SESSION['username'] ?? false),
    'redirect' => urlencode("/?".http_build_query($_GET))
));

$parser-> addRoute('forum', function (string $data){

    return $data;
}, array(
    'title' => 'Forum - La Palestra',
    'id' => 'content',
    'logged' => $_SESSION['username'] ?? false,
    'notlogged' =>  !($_SESSION['username'] ?? false),
    'redirect' => urlencode("/?".http_build_query($_GET))
));

$parser-> addRoute('news', function (string $data){

    $data = createNavMenuNews($data, $_GET['type'] ?? 'All');
    return createNewsContent($data, $_GET['type'] ?? 'All');
}, array(
    'title' => 'News - La Palestra',
    'id' => 'content',
    'type' => ($_GET['type'] ?? '%%All%%'),
    'logged' => $_SESSION['username'] ?? false,
    'notlogged' =>  !($_SESSION['username'] ?? false),
    'redirect' => urlencode("/?".http_build_query($_GET))
));

$parser-> onNotFound(function (){
						  header('location: 404.html');
						  });

$parser->addDefault('home');

$parser-> parse();
