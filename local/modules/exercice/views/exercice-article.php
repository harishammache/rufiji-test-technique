<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Article et Commentaires</title>
    <link rel="stylesheet" href="<?= WEBSITE_URL ?>/public/css/exercice-article.css">
</head>
<body>
    <div class="body-content">
        <div class="container">
            <h1><?= $this->view['posts']['title'] ?></h1>
            
            <div class="content">
                <?= $this->view['posts']['content'] ?>
            </div>
            <p class="author">Par <?= $this->view['posts']['author']['firstname'] . ' ' . $this->view['posts']['author']['lastname'] ?></p>
            
            <div class="comments-section">
                <h3>Commentaires :</h3>
                <?php foreach ($this->view['posts']['comments'] as $comment): ?>
                    <div class="comment">
                        <p><strong><?= $comment['firstname'] ?></strong> (<?= date('d/m/Y', strtotime($comment['comment_date'])) ?>)</p>
                        <p><?= $comment['comment_text'] ?></p>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</body>
</html>

