<?php

require_once 'DBaccess.php';
require_once __DIR__ . "/../vendor/autoload.php";
use \Gobie\Regex\Wrappers\Pcre\PcreRegex;

//check if type is one of the existent types
function validateType(string $type): bool{

    $DBaccess = new DBAccess();
    $types = array();
    if($DBaccess-> getConnection()){

        $types = $DBaccess-> getNewsTypesList();
    }

    return in_array($type, $types);
}

function validateLink(string $link): bool{

    return filter_var($link, FILTER_VALIDATE_URL);
}

function validateText(string $text, array $options =null): bool{

    if($options['checkForFormat'] ?? false){

        $pos = strpos($text, '.');
        if($pos == false || $pos == strlen($text) - 1){

            return false;
        }
    }

    if($options['checkOnlyName'] ?? false){

        if(!strpos($text, '/')){

            return false;
        }
    }

    return strlen($text) > 0;
}

function cleanFromTags(string $text): string{

    $prev = '';
    while($prev != $text){

        $prev = $text;
        $text = strip_tags($text);
    }
    return $text;
}

function cleanInput(string $data, bool $testForMail =false): string{

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

    //strip tags and prevent tags inside tags
    //for example <scr<span>ipt> </scr</span>ipt> with a single pass of strip_tags would become <script></script>
    //because the function removes the tag span
    $prev = '';
    while($prev != $data){

        $prev = $data;
        $data = strip_tags($data);
    }

    //clean for SQL injection
    //even if it was unneccessary due to the use of base64
    //To perform a sql injection one MUST close the string so has to use either ' or "
    //So if ' or " is present we just ignore it and what comes after it
    $testForPrematureClosureOfQuery = "/'/";
    $testForPrematureClosureOfQueryDouble = '/"/';

    $closing = PcreRegex::match($testForPrematureClosureOfQuery, $data);
    $closingDouble = PcreRegex::match($testForPrematureClosureOfQueryDouble, $data);

    return $data;
}
