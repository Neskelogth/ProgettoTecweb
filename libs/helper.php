<?php

require_once __DIR__ . "/../vendor/autoload.php";
use \Gobie\Regex\Wrappers\Pcre\PcreRegex;

function handleClosureOfQuery(string $data, bool $withoutDouble): string{

    $pos = $withoutDouble ? strpos($data, "'") : strpos($data, '"');
    $data = substr($data, 0, $pos);

    return $data;
}

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
        if(!$at || !$dot){

            $sanitazable = false;
        }
    }

    if(!$sanitazable){

        return "Fatal error";
    }

    //clean for SQL injection
    //even if it was unneccessary due to the use of base64
    //To perform a sql injection one MUST close the string so has to use either ' or "
    //So if ' or " is present we just ignore it and what comes after it
    $testForPrematureClosureOfQuery = "/'/";
    $testForPrematureClosureOfQueryDouble = '/"/';

    /*$commenting = PcreRegex::match($testForCommentingSQL, $data);
    $injecting = PcreRegex::match($testForSQLInjection, $data);
    $injectingNumbers = PcreRegex::match($testForSQLInjectionNumbers, $data);*/
    $closing = PcreRegex::match($testForPrematureClosureOfQuery, $data);
    $closingDouble = PcreRegex::match($testForPrematureClosureOfQueryDouble, $data);

    if($closing || $closingDouble){

        $data = handleClosureOfQuery($data, $closing);
    }

    return $data;
}
