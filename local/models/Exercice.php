<?php
class Exercice extends CommonModels
{    
    public function __construct(){   
        parent::__construct();
    }
    
    // public function getPostById($idPost){
    //     $pdo    = $this->pdoConnect();
    //     $result = $pdo->prepare("SELECT *
    //                             FROM `posts` 
    //                             LEFT JOIN `posts_lang` ON `posts`.`id` = `posts_lang`.`post_id`
    //                             WHERE `id_post` = :idPost");
    //     $this->bind($result,':idPost', $idPost);
    //     $result->execute();
    //     return $result->fetchAll(PDO::FETCH_ASSOC);
    // }
    public function getPostById($idPost){
        $pdo    = $this->pdoConnect();
        $result = $pdo->prepare("SELECT *
                                FROM `posts` 
                                LEFT JOIN `posts_lang` ON `posts`.`id` = `posts_lang`.`post_id`
                                WHERE `id_post` = :idPost");
        $this->bind($result,':idPost', $idPost);
        $result->execute();
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getAuthorByIdUser($idUser) {
        $pdo    = $this->pdoConnect();
        $result = $pdo->prepare("SELECT *
                                FROM `users`
                                WHERE `id_user` = :idUser");
        $this->bind($result,':idUser', $idUser);
        $result->execute();
        return $result->fetch(PDO::FETCH_ASSOC);
    }
}

