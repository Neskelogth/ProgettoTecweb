<?php

require_once __DIR__ . '/../libs/DBaccess.php';
require_once __DIR__ . "/../libs/helper.php";

session_start();

$response = array();

//$input = json_decode(file_get_contents("php://input"), true);


$userName = $_POST['username'];
$password = $_POST['password'];

$validuserName = validateCredentials($userName);
$validpassword = validateCredentials($password);
$sqlinjectiontry = sqlInjectionTry($userName);


if($validuserName && $validpassword && !$sqlinjectiontry){

    $DBaccess = new DBaccess();

    $existingUsername = ($DBaccess->getConnection() !== false) ? $DBaccess->getUsernameQuery($userName) : false;
    $correctPasswordForUser = ($DBaccess->getConnection() !== false) ? $DBaccess->getCorrectPasswordQuery($userName, hash("sha512", $password)) : false;

    if($existingUsername && $correctPasswordForUser){

        $response['ok'] = true;
        $userData = $DBaccess->getUserData($userName);
        
        

        $_SESSION['username'] = $userData['IDUtente'];
        $_SESSION['admin'] = $userData['Admin'];
        $_SESSION['banned'] = $userData['Bannato'];
        
        $response['red'] = '/?r=home';

    }else{
    
        $elements = array(
            'r' => 'login'
        );

        if(!$existingUsername){

            $elements['eusne'] = 'error';
        }

        if(!$existingPassword){
            
            $elements['epane'] = 'error';
        }

        $response['ok']= false;
        $redirect = '/?' . http_build_query($elements);
        $response['red'] = $redirect;
        $DBaccess->closeConnection();        
    }

}else{

    $response['ok']= false;

    $elements = array(
        'r' => 'login'
    );

    if(!$validuserName){

        $elements['eusnv'] = 'error';
    }
    if(!$validpassword){

        $elements['epanv'] = 'error';
    }
    if($sqlinjectiontry){
        $elements['sqlit'] = 'error';
    }
    
    $redirect = '/?' . http_build_query($elements);

    $response['red'] = $redirect;
}

$toRedirect = $response['red'];


header("location: $toRedirect");