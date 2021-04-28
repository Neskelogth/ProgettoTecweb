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

    public function getRecipeQuery(){

        $querySelect = "SELECT ID, Nome, Descrizione, NomeImmagine, AltImmagine FROM ALIMENTAZIONE ORDER BY ID ASC";
        $queryResult = $this-> connection-> query($querySelect);

        if($queryResult-> num_rows == 0){

            return null;
        }

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

    public function getSingleRecipeQuery($id){

        $querySelect = "SELECT * FROM alimentazione WHERE ID = " . intval($id);

        $queryResult = $this-> connection-> query($querySelect);

        if($queryResult-> num_rows == 0){

            return null;
        }

        $row = $queryResult-> fetch_assoc();

        $singolaRicetta = array(
           "Nome" => base64_decode($row['Nome']),
           "NomeImmagine" => base64_decode($row['NomeImmagine']),
           "AltImmagine" => base64_decode($row['AltImmagine']),
           "Persone" => base64_decode($row['Persone']),
           "Ingredienti" => base64_decode($row['Ingredienti']),
           "Procedimento" => base64_decode($row['Procedimento']),
           "Consigli" => base64_decode($row['Consigli'])
        );

        return $singolaRicetta;

    }

    public function getNewsQuery($type){

        $querySelect = "SELECT * FROM news ";
        if($type == "workout" || $type == "alimentazione" || $type == "sito"){

            $querySelect .= "WHERE tipo = '". ucfirst($type) ."'";
        }

        $queryResult = $this->connection->query($querySelect);

        if($queryResult === false || $queryResult->num_rows == 0){

            return null;
        }

        $newsList = array();
        while($row = $queryResult->fetch_assoc()){

            $notice = array(

                'ID' => $row['ID'],
                'Tipo' => $row['Tipo'],
                'Titolo' => base64_decode($row['Titolo']),
                'Testo' => base64_decode($row['Testo']),
                'link' => $row['Link'] ?? ''
            );

            array_push($newsList, $notice);

        }

        return $newsList;
    }

    public function getUsernameQuery(string $userName): bool{

        $querySelect = "SELECT * FROM utente WHERE IDUtente = '".base64_encode($userName)."'";

        $queryResult = $this-> connection-> query($querySelect);

        return $queryResult !== false && $queryResult->num_rows != 0;

    }

    public function getMailQuery(string $mail): bool{

        $querySelect = "SELECT * FROM utente WHERE Email = '".base64_encode($mail)."'";

        $queryResult = $this-> connection-> query($querySelect);

        return $queryResult !== false && $queryResult->num_rows != 0;

    }

    public function getCorrectPasswordQuery(string $userName, string $hashedPssw):bool{

        $querySelect = "SELECT * FROM utente WHERE Password = '". $hashedPssw ."' AND IDUtente = '".base64_encode($userName)."'";
        $queryResult = $this-> connection-> query($querySelect);

        return $queryResult !== false && $queryResult->num_rows != 0;
    }

    public function getUserData(string $userName): array{

        $querySelect = "SELECT IDUtente, Nome, Cognome, Email, Amministratore FROM utente WHERE IDUtente = '" . base64_encode($userName) ."'";
        $queryResult = $this-> connection-> query($querySelect);

        $row = $queryResult-> fetch_assoc();

        return array(
            'IDUtente' => base64_decode($row['IDUtente']),
            'Nome' => base64_decode($row['Nome']),
            'Cognome' => base64_decode($row['Cognome']),
            'Email' => base64_decode($row['Email']),
            'Admin' => $row['Amministratore'] == 1
        );
        
    }

    public function insertUser($username, $mail, $name, $surname, $hashedPassword): bool{

        $username = base64_encode($username);
        $name = base64_encode($name);
        $surname = base64_encode($surname);
        $mail = base64_encode($mail);

        $query = "INSERT INTO utente VALUES('$username','$mail', '$name', '$surname', '$hashedPassword', 0);";

        $queryResult = $this-> connection-> query($query);

        var_dump($queryResult);

        return $queryResult !== false;
    }

    public function getPostList($username =""){

        /*         *
         * Query formattata:
         * SELECT post.IDPost,post.IDUtente, post.Testo, COUNT(likes.IDUtente) AS 'NumeroLike', ABS(ISNULL(MyLikes.IDPost) - 1) AS 'LeftLike'
           FROM (post LEFT JOIN likes
                        ON post.IDPost = likes.IDPost)
                      LEFT JOIN (SELECT IDPost
                                 FROM likes
                                 WHERE IDUtente = '$username') AS MyLikes
                        ON MyLikes.IDPost = likes.IDPost
           GROUP BY post.IDPost
           ORDER BY post.IDPost ASC
         *
         * Prende gli di, i testi e gli id utenti di ogni post, in più conta i like e calcola se l'utente corrente
         * ha lasciato un like. Raggruppa per id del post e ordina i risultati tramite l'id del post.
         *
         * */
        $username = base64_encode($username);

        $querySelect = "SELECT post.IDPost,post.IDUtente, post.Testo, COUNT(likes.IDUtente) AS 'NumeroLike', ABS(ISNULL(MyLikes.IDPost) - 1) AS 'LeftLike' FROM (post LEFT JOIN likes ON post.IDPost = likes.IDPost) LEFT JOIN (SELECT IDPost FROM likes WHERE IDUtente = '".$username."') AS MyLikes ON MyLikes.IDPost = likes.IDPost GROUP BY post.IDPost ORDER BY post.IDPost ASC";

        $queryResult = $this-> connection-> query($querySelect);

        if($queryResult === false || $queryResult->num_rows == 0){

            return null;
        }

        $postList = array();

        while($row = $queryResult-> fetch_assoc()){

            $singlePost = array(

                "IDPost" => $row['IDPost'],
                "IDUtente" => base64_decode($row['IDUtente']),
                "NumeroLike" => $row['NumeroLike'],
                "Testo" => base64_decode($row['Testo']),
                "LeftLike" => $row['LeftLike'] == 1
            );
            array_push($postList, $singlePost);
        }

        //var_dump($postList);
        return $postList;
    }

    public function leaveLike($username, $leftLike, $idPost){

        $query = "";

        $username = base64_encode($username);

        if($leftLike){

            $query = "INSERT IGNORE INTO likes VALUES ( $idPost , '$username')";
        }else{

            $query = "DELETE FROM likes WHERE IDUtente = '".$username."' AND IDPost = ".$idPost;
        }

        $queryResult = $this-> connection-> query($query);

        //$this-> connection-> affected_rows;

        return $queryResult;
    }

    public function insertAnswer($username,$text, $idPost):bool{

        $username = base64_encode($username);
        $text = base64_encode($text);

        $query = "INSERT INTO risposta (IDUtente, Testo, IDPost) VALUES ('$username','$text', $idPost);";

        $queryResult = $this->connection->query($query);

        return $queryResult;
    }

    public function insertPost($username, $text){

        $username = base64_encode($username);
        $text = base64_encode($text);

        $query = "INSERT INTO post (IDUtente, numeroLike, Testo) VALUES ('$username',0,'$text')";

        $queryResult = $this-> connection-> query($query);

        return $queryResult;
    }

    public function getPostAnswer($idPost = 1){

        $idPost = intval($idPost);

        $querySelect = "SELECT * FROM risposta WHERE IDPost = $idPost ORDER BY IDRisposta ASC";


        $queryResult = $this-> connection-> query($querySelect);

        if($queryResult === false || $queryResult-> num_rows == 0){

            return null;
        }
        else{

            $answers = array();
            while($row = mysqli_fetch_assoc($queryResult)){

                $singleAnswer = array(
                    "answerId" => $row['IDRisposta'],
                    "userID" => base64_decode($row['IDutente']),
                    "Text" => base64_decode($row['Testo']),
                    "IDPost" => $row['IDPost']
                );

                array_push($answers, $singleAnswer);
            }
            return $answers;
        }

    }
}

