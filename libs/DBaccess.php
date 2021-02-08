<?php

class DBaccess{

    private const HOST_DB = "127.0.0.1:3307";
    private const USERNAME = "mtesser";
    private const PASSWORD = "ikee4Doongaem7ju";
    private const DATABASE_NAME = "mtesser";

    private $connection;

    public function __construct(){

        $this->openDBConnection();
    }

    public function __destruct(){

        $this->closeConnection();
    }

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

            $recipeList = array();
            while($row = $queryResult-> fetch_assoc()){

                $singleRecipe = array(
                    "ID" => $row['ID'],
                    "Nome" => base64_decode($row['Nome']),
                    "Descrizione" => base64_decode($row['Descrizione']),
                    "NomeImmagine" => base64_decode($row['NomeImmagine']),
                    "AltImmagine" => base64_decode($row['AltImmagine'])
                );

                array_push($recipeList, $singleRecipe);
            }
            return $recipeList;
        }

    }

    public function getSingleRecipeQuery($id){

        $querySelect = "SELECT * FROM alimentazione WHERE ID = " . intval($id);

        $queryResult = $this-> connection-> query($querySelect);

        if($queryResult-> num_rows == 0){

            return null;
        }else{

            $row = $queryResult-> fetch_assoc();

            $singolaRicetta = array(
                "Nome" => base64_decode($row['Nome']),
                //"Descrizione" =>base64_decode( $row['Descrizione']),
                "NomeImmagine" => base64_decode($row['NomeImmagine']),
                "AltImmagine" => base64_decode($row['AltImmagine']),
                "Persone" => base64_decode($row['Persone']),
                "Ingredienti" => base64_decode($row['Ingredienti']),
                "Procedimento" => base64_decode($row['Procedimento']),
                "Consigli" => base64_decode($row['Consigli'])
            );

            return $singolaRicetta;
        }
    }

}