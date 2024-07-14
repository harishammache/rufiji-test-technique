<?php
ini_set("memory_limit", "50G");
set_time_limit(300);
ini_set("max_execution_time", 300);

chdir(dirname(__FILE__));

require_once('../config/config.php');
require_once('../models/CommonModels.php');

$model = new CommonModels();

$CategoryCrypto = 1;

$pdo = $model->pdoConnect();

$updatePosts = "UPDATE posts SET id_category = :category WHERE id_category != :category";
$stmtUpdatePosts = $pdo->prepare($updatePosts);
$stmtUpdatePosts->execute(['category' => $CategoryCrypto]);

$incrementNbPosts = "UPDATE blog_categories SET nb_posts = nb_posts + 1 WHERE id_category = :category";
$stmtIncrementNbPosts = $pdo->prepare($incrementNbPosts);
$stmtIncrementNbPosts->execute(['category' => $CategoryCrypto]);
?>