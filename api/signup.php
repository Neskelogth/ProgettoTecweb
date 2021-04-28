<?php

require_once '../libs/DBaccess.php';
require_once "../libs/helper.php";

session_start();

$username = $_POST['username'];
$name = $_POST['name'];
$surname = $_POST['surname'];
$mail = cleanInput($_POST['mail'], true);
$password = $_POST['password'];
$rePassword = $_POST['rePassword'];
$toRedirect = urldecode($_POST['redirect'] ?? urlencode('/?r=home'));

$DBaccess = new DBaccess();

$existingUsername = ($DBaccess-> getConnection() !== false) ? $DBaccess->getUsernameQuery($username) : false;
$existingMail = ($DBaccess-> getConnection() !== false) ? $DBaccess->getMailQuery($username) : false;

if(!$existingUsername && !$existingMail && $password == $rePassword){

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


