<?php

require_once __DIR__ . '/../libs/DBaccess.php';
require_once __DIR__ . "/../libs/helper.php";

session_start();

$DBaccess = new DBaccess();

$userName = $_POST['username'];
$password = $_POST['password'];

//check if userName exists
$existingUsername = ($DBaccess->getConnection() !== false) ? $DBaccess->getUsernameQuery($userName) : false;
$correctPasswordForUser = ($DBaccess->getConnection() !== false) ? $DBaccess->getCorrectPasswordQuery($userName, hash("sha512", $password)) : false;

if($existingUsername && $correctPasswordForUser){

    $userData = $DBaccess->getUserData($userName);

    $_SESSION['username'] = $userData['IDUtente'];
    $_SESSION['admin'] = $userData['Admin'];
}
$DBaccess->closeConnection();

$toRedirect = urldecode($_POST['redirect'] ?? urlencode('/?r=home'));

header("location: $toRedirect");
