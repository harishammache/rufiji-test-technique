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
                                FROM posts_lang
                                WHERE post_id = :idPost");
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

    public function getCommentsByPostId($postId) {
        $pdo    = $this->pdoConnect();
        $result = $pdo->prepare("SELECT 
                                    users.firstname,
                                    posts_comments.comment_date,
                                    posts_comments.comment_text
                                FROM posts_comments
                                INNER JOIN users ON posts_comments.user_id = users.id_user
                                WHERE posts_comments.post_id = :postId
                                ORDER BY posts_comments.comment_date DESC");
        $this->bind($result, ':postId', $postId);
        $result->execute();
        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}
