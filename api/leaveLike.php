<?php

require_once "../libs/DBaccess.php";

session_start();

$dbaccess = new DBaccess();

$response = array();

//Stream standard
$input = json_decode(file_get_contents("php://input"), true);

$nomeUtente = $_SESSION["username"] ?? "";
$leavingLike = $input["leavingLike"] ?? false;
$idPost = intval($input["idPost"] ?? -1);

//CONTROLLO ERRORI (TROPPO BANALE PER IL PROGETTO!!!!) Devono esserici questi controlli più altri più accurati
// (es nome siano solo caratteri, alemto tot caratteri...non trovare numeri su nome, chiocciole ecc)

if(strlen($nomeUtente) != 0 && is_bool($leavingLike) && $idPost > 0) {
    //inserisco informazioni nel database

    if($dbaccess-> getConnection()){

        $response['ok'] = $dbaccess-> leaveLike($nomeUtente,$leavingLike, $idPost);
    }
}

$dbaccess-> closeConnection();

$response = json_encode($response);

header("Content-Type: application/json; charset=UTF-8");
header("Content-Length: " . strlen($response));

echo $response;