<?php

require_once '../libs/DBaccess.php';
require_once "../libs/helper.php";

session_start();

$DBaccess = new DBaccess();

$userName = $_POST['username'];
$password = $_POST['password'];

echo $userName;

//if session exists, destroy it
session_destroy();

//check if userName exists
$existingUsername = ($DBaccess->getConnection() !== false) ? $DBaccess->getUsernameQuery($userName) : false;
$correctPassword = ($DBaccess->getConnection() !== false) ? $DBaccess->getCorrectPasswordQuery($userName, hash("sha512", $password)) : false;

var_dump($existingUsername);
var_dump($correctPassword);

if($existingUsername && $correctPassword){

    $userData = $DBaccess->getUserData($userName);
    //var_dump(($userData));

    $_SESSION['username'] = $userData['IDUtente'];
    $_SESSION['admin'] = $userData['Admin'];
}

