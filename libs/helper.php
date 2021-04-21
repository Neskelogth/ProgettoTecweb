<?php

function cleanInput(string $data): string{

    $prev = '';
    while($prev != $data){

        $prev = $data;
        $data = strip_tags($data);
    }
    var_dump($data);
    return $data;
}
