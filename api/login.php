<?php

require_once __DIR__ . '/../libs/DBaccess.php';
require_once __DIR__ . "/../libs/helper.php";

session_start();

$DBaccess = new DBaccess();

$userName = $_POST['username'];
$password = $_POST['password'];

//echo $userName;

//check if userName exists
$existingUsername = ($DBaccess->getConnection() !== false) ? $DBaccess->getUsernameQuery($userName) : false;
$correctPasswordForUser = ($DBaccess->getConnection() !== false) ? $DBaccess->getCorrectPasswordQuery($userName, hash("sha512", $password)) : false;

//var_dump($existingUsername);
//var_dump($correctPasswordForUser);

if($existingUsername && $correctPasswordForUser){

    $userData = $DBaccess->getUserData($userName);

    $_SESSION['username'] = $userData['IDUtente'];
    $_SESSION['admin'] = $userData['Admin'];
}

$toRedirect = urldecode($_POST['redirect'] ?? urlencode('/?r=home'));

header("location: $toRedirect");
