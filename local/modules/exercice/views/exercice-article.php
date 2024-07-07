<link rel="stylesheet" href="<?= WEBSITE_URL ?>/public/css/exercice.css">
<div class="body-content">
    <div class="container">
        Titre de l'article : <?= $this->view['posts']['title'] ?>
        <br>
        Texte de l'article : <?= $this->view['posts']['content'] ?>
        <br>
        Auteur de l'article : <?= $this->view['posts']['author']['first_name'] . ' ' . $this->view['posts']['author']['last_name'] ?>

        <br/><br/>
        <h3>Ajouter les commentaires ci-dessous :</h3>
    </div>
</div>





