<?php

require_once "../libs/DBaccess.php.php";
require_once "../libs/contentCreator.php";


session_start();

$dbaccess = new DBaccess();

$result = GetForumPageLogged($dbaccess);
$messaggioPerForm = '';
$nomeUtente = '';
$testo = '';

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

if(array_key_exists('submit', $input)) {
    $nomeUtente = $_SESSION["username"];
    $testo = pulisciInput($input["val"] ?? "");

    //CONTROLLO ERRORI (TROPPO BANALE PER IL PROGETTO!!!!) Devono esserici questi controlli più altri più accurati (es nome siano solo caratteri, alemto tot caratteri...non trovare numeri su nome, chiocciole ecc)
    if(strlen($nomeUtente)!=0 && strlen($testo)>5) {
        //inserisco informazioni nel database
        $openDBconnection = $dbaccess->openDBconnection();
        if($openDBconnection==true){
            $response['ok'] = $dbaccess->inserisciPost($nomeUtente,$testo);
            $dbaccess-> closeDBConnection();

        }
    }
}

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;