<?php

require_once __DIR__ . "/../vendor/autoload.php";
use \Gobie\Regex\Wrappers\Pcre\PcreRegex;

function handleClosureOfQuery(string $data): string{

    $pos = strpos($data, "'");
    $data = substr($data, 0, $pos);

    return $data;
}
/*
function handleCommenting(stirng $data):string{

    return $data;
}

function handleInjection(string $data, bool $withoutNumbers): string{



    return $data;
}*/

function cleanInput(string $data, bool $testForMail =false): string{

    //strip tags and prevent tags inside tags
    $prev = '';
    while($prev != $data){

        $prev = $data;
        $data = strip_tags($data);
    }

    $sanitazable = true;

    //clean mail if necessary
    //TO BE MOVED IN DEDICATED PLACE
    if($testForMail && !filter_var($data, FILTER_VALIDATE_EMAIL)){


        $data = filter_var($data, FILTER_SANITIZE_EMAIL);
        $at = PcreRegex::match("/@/", $data);
        $dot = PcreRegex::match("/./", $data);
        if(!$at || $dot){

            $sanitazable = false;
        }
    }

    /*
    if(!$sanitazable){

        return "Fatal error";
    }
    */

    //clean for SQL injection
    //even if it was unneccessary due to the use of base64
    /*$testForSQLInjectionNumbers = "/(?i)OR \d+=\d+/";
    $testForSQLInjection = "/(?i)OR '(\w+)?'='(\w+)?'/";
    $testForCommentingSQL = "/--/";*/
    $testForPrematureClosureOfQuery = "/'/";

    /*$commenting = PcreRegex::match($testForCommentingSQL, $data);
    $injecting = PcreRegex::match($testForSQLInjection, $data);
    $injectingNumbers = PcreRegex::match($testForSQLInjectionNumbers, $data);*/
    $closing = PcreRegex::match($testForPrematureClosureOfQuery, $data);

    if($closing){

        $data = handleClosureOfQuery($data);
    }

    /*if($commenting){

        $data = handleCommenting($data);
    }

    if($injecting || $injectingNumbers){

        $data = handleInjection($data, $injecting);
    }*/


    return $data;
}
