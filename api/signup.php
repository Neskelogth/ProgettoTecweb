<?php

require_once '../libs/DBaccess.php';
require_once "../libs/helper.php";

session_start();

$username = cleanInput($_POST['username']);
$name = cleanInput($_POST['name']);
$surname = cleanInput($_POST['surname']);
$mail = cleanInput($_POST['mail'], true);
$password = cleanInput($_POST['password']);
$rePassword = cleanInput($_POST['rePassword']);
$toRedirect = urldecode($_POST['redirect'] ?? urlencode('/?r=home'));

$DBaccess = new DBaccess();

$existingUsername = ($DBaccess-> getConnection() !== false) ? $DBaccess->getUsernameQuery($username) : false;
$existingMail = ($DBaccess-> getConnection() !== false) ? $DBaccess->getMailQuery($mail) : false;

if(!$existingUsername && !$existingMail && $password == $rePassword && $mail != "Fatal error"){

    $insertResult = $DBaccess-> insertUser($username, $mail, $name, $surname, hash('sha512', $password));
    $DBaccess->closeConnection();
    if($insertResult){
        $_SESSION['username'] = $username;
        $SESSION['admin'] = false;

    }else{

        header("Location: /?r=singup");
    }
    header("location: $toRedirect");

}else{

    $DBaccess->closeConnection();
    header("location: /?r=signup");
}


