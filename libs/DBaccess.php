<?php

class DBaccess{

    private const HOST_DB = "127.0.0.1:3307";
    private const USERNAME = "mtesser";
    private const PASSWORD = "ikee4Doongaem7ju";
    private const DATABASE_NAME = "mtesser";

    private $connection;

    public function __construct(){}

    public function getConnection(){//ritorna un oggetto o false

        return $this-> connection;
    }

    public function openDBConnection():bool{

        $this-> connection = new mysqli(DBaccess::HOST_DB, DBaccess::USERNAME,
            DBaccess::PASSWORD, DBaccess::DATABASE_NAME);

        if(!$this->connection-> connect_error){

            return true;
        }
        return false;
    }

    public function closeConnection(): void{

        $this-> connection-> close();
    }

    //affected rows è una variabile
    public function getRecipeQuery(){

        $querySelect = "SELECT ID, Nome, Descrizione, NomeImmagine, AltImmagine FROM ALIMENTAZIONE ORDER BY ID ASC";
        $queryResult = $this-> connection-> query($querySelect);

        if($queryResult-> num_rows == 0){

            return null;
        }else{

            $listaRicette = array();
            while($riga = $queryResult-> fetch_assoc()){

                $singolaRicetta = array(
                    "ID" => $riga['ID'],
                    "Nome" => base64_decode($riga['Nome']),
                    "Descrizione" => base64_decode($riga['Descrizione']),
                    "NomeImmagine" => base64_decode($riga['NomeImmagine']),
                    "AltImmagine" => base64_decode($riga['AltImmagine'])
                );

                array_push($listaRicette, $singolaRicetta);
            }
            return $listaRicette;
        }

    }


}