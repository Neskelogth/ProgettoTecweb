<?php

require_once '../libs/DBaccess.php';
require_once "../libs/helper.php";

session_start();

var_dump($_POST);

$DBaccess = new DBaccess();

$username = $_POST['username'];
$name = $_POST['name'];
$surname = $_POST['surname'];
$mail = $_POST['mail'];
$password = $_POST['password'];
$rePassword = $_POST['rePassword'];
$toRedirect = urldecode($_POST['redirect'] ?? urlencode('/?r=home'));

$existingUsername = ($DBaccess-> getConnection() !== false) ? $DBaccess->getUsernameQuery($username) : false;
$existingMail = ($DBaccess-> getConnection() !== false) ? $DBaccess->getMailQuery($username) : false;

if(!$existingUsername && !$existingMail && $password == $rePassword){

    $insertResult = $DBaccess-> insertUser($username, $mail, $name, $surname, hash('sha512', $password));
    if($insertResult){
        $_SESSION['username'] = $username;
        $SESSION['admin'] = false;

    }else{
        echo "Qualcosa non è andato";
        header("Location: /?r=singup");
    }
    var_dump($toRedirect);
    header("location: $toRedirect");

}else{

    $DBaccess->closeConnection();
    header("location: /?r=signup");
}


