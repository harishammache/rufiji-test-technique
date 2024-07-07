<?php

// Fichier de configuration
require_once 'config/config.php';

$foldersList = array(
    'exercice',
    'common',
    'home'
);

$folder = $_GET['f'] ?? 'home';
$action = $_GET['a'] ?? 'index';

// Le dossier et le controller sont autorisés et l'action spécifiée
    if(in_array($folder, $foldersList))
    {
        if(!isset($_GET['c']))
        {
            $_GET['c'] = 'Index';
        }
        else
        {
            $_GET['c'] = ucfirst($_GET['c']);
        }

        $controllerName = $_GET['c'] . 'Controller';
        require_once 'modules/' . $folder . '/controllers/' . $controllerName . '.php';

        // Instanciation du controller
        $controller = new $controllerName();

        // L'action existe bien, on l'appelle
        $action = $action . 'Action';
        if (method_exists($controller, $action))
        {
            $controller->$action();
        }
        else
        {
            // Erreur 404
            $commonController = new CommonController();
            $commonController->pageError('404');
        }
    }
    else
    {
        // Erreur 404
        $commonController = new CommonController();
        $commonController->pageError('404');
    }
