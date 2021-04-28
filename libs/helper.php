<?php

use \Gobie\Regex\Wrappers\Pcre\PcreRegex;

function cleanInput(string $data): string{

    //strip tags and prevent tags inside tags
    $prev = '';
    while($prev != $data){

        $prev = $data;
        $data = strip_tags($data);
    }

    //clean for SQL injection
    //even if it was unneccessary due to the use of base64



    return $data;
}
