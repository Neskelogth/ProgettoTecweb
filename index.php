<?php

$parser = new Parser();
$parser-> addRoute('alimentation', array(
    'basePage' => 'html/alimentazione.xhtml',
    'params' => array(

    )
));
$parser-> addRoute('workout', array(

    'basePage' => 'html/workout.xhtml'

));
$parser-> addRoute('home', array());
$parser-> addRoute('forum', array());
$parser-> addRoute('news', array());
$parser-> addRoute('login', array());
$parser-> addRoute('signup', array());
$parser-> addRoute('adminPanel', array());

$parser-> onNotFound(function (){
						  header('location: 404.html');
						  });

$parser-> parse();
