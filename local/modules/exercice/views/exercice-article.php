<link rel="stylesheet" href="<?= WEBSITE_URL ?>/public/css/exercice.css">
<div class="body-content">
    <div class="container">
        Titre de l'article : <?= $this->view['posts']['title'] ?>
        <br>
        Texte de l'article : <?= $this->view['posts']['content'] ?>
        <br>
        Auteur de l'article : <?= $this->view['posts']['author']['firstname'] . ' ' . $this->view['posts']['author']['lastname'] ?>

        <br/><br/>
        <h3>Ajouter les commentaires ci-dessous :</h3>
    </div>
</div>
