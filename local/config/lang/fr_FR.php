<?php
	
	// Référencement
	defined('_URL_PRODUCT_FOLDER') || define('_URL_PRODUCT_FOLDER', 'produits');
	defined('_URL_SHOP')           || define('_URL_SHOP', 'boutique');
	defined('_URL_CART')           || define('_URL_CART', 'panier');
	defined('_URL_CHECKOUT')       || define('_URL_CHECKOUT', 'commander');
	defined('_URL_ORDER_PAID')     || define('_URL_ORDER_PAID', 'commande-recue');
	defined('_URL_LOGIN')          || define('_URL_LOGIN', 'connexion');
	defined('_URL_FORGOT_PASSWORD')|| define('_URL_FORGOT_PASSWORD', 'mdp-oublie');
	defined('_URL_LOGOUT')         || define('_URL_LOGOUT', 'deconnexion');
	defined('_URL_ACCOUNT')        || define('_URL_ACCOUNT', 'mon-compte');
	defined('_URL_MY_ORDERS')      || define('_URL_MY_ORDERS', 'mes-commandes');
	defined('_URL_MY_INVESTMENTS') || define('_URL_MY_INVESTMENTS', 'mes-investissements');
	defined('_URL_ADD_INVESTMENT') || define('_URL_ADD_INVESTMENT', 'ajouter-investissement');
	defined('_URL_MY_DONUTS')      || define('_URL_MY_DONUTS', 'mes-donuts');
	defined('_URL_FAQ')            || define('_URL_FAQ', 'faq');
	defined('_URL_LEARN_MORE')     || define('_URL_LEARN_MORE', 'en-savoir-plus');
	defined('_URL_CONTACT')        || define('_URL_CONTACT', 'contact');
	defined('_URL_LEGAL_NOTICES')  || define('_URL_LEGAL_NOTICES', 'mentions-legales');
	defined('_URL_CGV')            || define('_URL_CGV', 'cgv');
	defined('_URL_CGU')            || define('_URL_CGU', 'cgu');
	defined('_URL_BLOG')           || define('_URL_BLOG', 'blog');
	defined('_URL_TAG')            || define('_URL_TAG', 'tag');
	defined('_URL_DONUT')          || define('_URL_DONUT', 'donuts');
	defined('_URL_ADD')            || define('_URL_ADD', 'ajouter');
	defined('_URL_PROFIL')         || define('_URL_PROFIL', 'profil');
	defined('_URL_WALLETS')        || define('_URL_WALLETS', 'portefeuilles');
	defined('_URL_MY_WALLET')      || define('_URL_MY_WALLET', 'mon-portefeuille');
	defined('_URL_WALLET')         || define('_URL_WALLET', 'wallet');
	defined('_URL_NEWS')           || define('_URL_NEWS', 'crypto-news');
	defined('_URL_FORUM')          || define('_URL_FORUM', 'forum');
	defined('_URL_COINS')          || define('_URL_COINS', 'coins');
	defined('_URL_COMMENTS')       || define('_URL_COMMENTS', 'commentaires');
	defined('_URL_TOOLS')          || define('_URL_TOOLS', 'outils');
	defined('_URL_ABOUT_US')       || define('_URL_ABOUT_US', 'a-propos');
	defined('_URL_COMPETITION')    || define('_URL_COMPETITION', 'competition');
	defined('_URL_DASHBOARD')      || define('_URL_DASHBOARD', 'dashboard');
	defined('_URL_EDIT')           || define('_URL_EDIT', 'modifier');
	defined('_URL_REWARDS')        || define('_URL_REWARDS', 'recompenses');

	// COMMON
	defined('ADD')            || define('ADD', 'Ajouter');
	defined('SEARCH')         || define('SEARCH', 'Rechercher');
	defined('DONE')           || define('DONE', 'Terminer');
	defined('CLOSE')          || define('CLOSE', 'Fermer');
	defined('RESET')          || define('RESET', 'Réinitialiser');
	defined('PAGE_NOT_FOUND') || define('PAGE_NOT_FOUND', 'Page non trouvée');
	defined('LOGOUT')         || define('LOGOUT', 'Déconnexion');
	defined('SAVE')           || define('SAVE', 'Sauvegarder');
	defined('VALIDATE')       || define('VALIDATE', 'Confirmer');
	defined('ACCESS')         || define('ACCESS', 'Accéder');
	defined('CANCEL')         || define('CANCEL', 'Annuler');
	defined('ACCEPT')         || define('ACCEPT', 'Accepter');
	defined('MORE_INFOS')     || define('MORE_INFOS', 'En savoir plus');
	defined('SEE_MORE')       || define('SEE_MORE', 'Voir plus');
	defined('NO_RESULT')      || define('NO_RESULT', 'Aucun résultat');
	defined('_COOKIE_TEXT')   || define('_COOKIE_TEXT', "<b>" . WEBSITE_TITLE . "</b> utilise des cookies pour vous offrir la meilleure expérience possible. En poursuivant votre visite sur notre plateforme, vous acceptez l'utilisation de Cookies. Si vous souhaitez en savoir davantage sur les cookies et la manière dont vous pouvez les gérer, veuillez consulter notre <a href='/"._URL_LEGAL_NOTICES."' target='_BLANK'>politique relative aux cookies.</a>");
	defined('_JANUARY')       || define('_JANUARY', 'Janvier');
	defined('_FEBRUARY')      || define('_FEBRUARY', 'Février');
	defined('_MARCH')         || define('_MARCH', 'Mars');
	defined('_APRIL')         || define('_APRIL', 'Avril');
	defined('_MAY')           || define('_MAY', 'Mai');
	defined('_JUNE')          || define('_JUNE', 'Juin');
	defined('_JULY')          || define('_JULY', 'Juillet');
	defined('_AUGUST')        || define('_AUGUST', 'Août');
	defined('_SEPTEMBER')     || define('_SEPTEMBER', 'Septembre');
	defined('_OCTOBER')       || define('_OCTOBER', 'Octobre');
	defined('_NOVEMBER')      || define('_NOVEMBER', 'Novembre');
	defined('_DECEMBER')      || define('_DECEMBER', 'Décembre');
	defined('SEARCH_COIN')    || define('SEARCH_COIN', 'Rechercher une crypto');
	defined('GO_TO_LIBRARY')  || define('GO_TO_LIBRARY', 'Retourner à la liste des Donuts');
	defined('SINCE')          || define('SINCE', 'Il y a');
	defined('DASHBOARD')      || define('DASHBOARD', 'Tableau de bord');

	// Pages
	defined('HOME')          || define('HOME', 'Donuts');
	defined('PIES')          || define('PIES', 'Donuts');
	defined('FORUM')         || define('FORUM', 'Forum');
	defined('NEWS')          || define('NEWS', 'News crypto');
	defined('NEWS_TITLE')    || define('NEWS_TITLE', 'Actualités des cryptomonnaies');
	defined('BLOG')          || define('BLOG', 'Blog');
	defined('SHOP')          || define('SHOP', 'Boutique');
	defined('LOGIN')         || define('LOGIN', 'Connexion');
	defined('FORGOT_PASSWORD') || define('FORGOT_PASSWORD', 'Mot de passé oublié');
	defined('SIGNUP')        || define('SIGNUP', 'Inscription');
	defined('MY_ACCOUNT')    || define('MY_ACCOUNT', 'Modifier mon compte');
	defined('MY_PROFIL')     || define('MY_PROFIL', 'Mon profil');
	defined('MY_WALLETS')    || define('MY_WALLETS', 'Mes portefeuilles');
	defined('MY_WALLET')     || define('MY_WALLET', 'Mon portefeuille');
	defined('USER_PROFIL')   || define('USER_PROFIL', '');
	defined('MY_ORDERS')     || define('MY_ORDERS', 'Mes commandes');
	defined('MY_DCA')        || define('MY_DCA', 'Mes investissements récurrents');
	defined('MY_REWARDS')    || define('MY_REWARDS', 'Mes récompenses');
	defined('MY_DONUTS')     || define('MY_DONUTS', 'Mes Donuts');
	defined('ORDER')         || define('ORDER', 'Commande');
	defined('CART')          || define('CART', 'Panier');
	defined('CHECKOUT')      || define('CHECKOUT', 'Commander');
	defined('CHECKOUT_PAID') || define('CHECKOUT_PAID', 'Commande reçue');
	defined('CGV')           || define('CGV', 'Conditions Générales de Vente');
	defined('LEGAL_NOTICES') || define('LEGAL_NOTICES', 'Mentions Légales');
	defined('CONTACT_US')    || define('CONTACT_US', 'Nous contacter');
	defined('OUR_TOOLS')     || define('OUR_TOOLS', 'Nos outils');
	defined('ABOUT_US')      || define('ABOUT_US', 'À propos de nous');
	defined('ABOUT')         || define('ABOUT', 'À propos de');
	defined('COMPETITION')   || define('COMPETITION', 'Compétition');

	// Pies
	defined('POPULAR')                  || define('POPULAR', 'Populaires');
	defined('BEST_PERFORMANCE')         || define('BEST_PERFORMANCE', 'Meilleurs');
	defined('RECENT')                   || define('RECENT', 'Récents');
	defined('CREATED')                  || define('CREATED', 'Créés');
	defined('ADD_DONUT')                || define('ADD_DONUT', 'Ajouter mon Donut');
	defined('EDIT_DONUT')               || define('EDIT_DONUT', 'Modifier mon Donut');
	defined('ADD_SLICE')                || define('ADD_SLICE', 'Ajouter une part');
	defined('ADD_SLICES')               || define('ADD_SLICES', 'Ajouter des parts');
	defined('ADD_SLICES_DONUT')         || define('ADD_SLICES_DONUT', 'Ajouter des parts à votre Donut');
	defined('ADD_TO_DONUT')             || define('ADD_TO_DONUT', 'Ajouter au Donut');
	defined('ADD_TO_FAVORITE')          || define('ADD_TO_FAVORITE', 'Ajouter à vos favoris');
	defined('REMOVE_FROM_FAVORITE')     || define('REMOVE_FROM_FAVORITE', 'Ajouté à vos favoris');
	defined('GO_TO_DASHBOARD')          || define('GO_TO_DASHBOARD', 'Tableau de bord');
	defined('_LINK_COPIED_SHARING')     || define('_LINK_COPIED_SHARING', 'Lien copié avec succès');
	defined('_SUCCESS_ADD_FAVORITE')    || define('_SUCCESS_ADD_FAVORITE', 'Ce Donut a été ajouté à vos favoris avec succès');
	defined('_SUCCESS_REMOVE_FAVORITE') || define('_SUCCESS_REMOVE_FAVORITE', 'Ce Donut a été retiré de vos favoris');
	defined('_SUCCESS_ADD_SLICE')       || define('_SUCCESS_ADD_SLICE', 'Part ajoutée à votre Donut avec succès');
	defined('_SUCCESS_REMOVE_SLICE')    || define('_SUCCESS_REMOVE_SLICE', 'Cette part a été retirée de votre Donut');
	defined('_ERROR_ADD_SLICE_LIMIT')   || define('_ERROR_ADD_SLICE_LIMIT', 'Vous ne pouvez pas ajouter plus de 100 parts à votre Donut');
	defined('VIEWS')                    || define('VIEWS', 'Vues');
	defined('FAVORITES')                || define('FAVORITES', 'Favoris');
	defined('HOUR')                     || define('HOUR', 'heure');
	defined('HOURS')                    || define('HOURS', 'heures');
	defined('DAY')                      || define('DAY', 'jour');
	defined('DAYS')                     || define('DAYS', 'jours');
	defined('YEAR')                     || define('YEAR', 'an');
	defined('YEARS')                    || define('YEARS', 'ans');
	defined('LAST_7_DAYS')              || define('LAST_7_DAYS', '7 derniers jours');
	defined('SHARE')                    || define('SHARE', 'Partager');
	defined('CREATED_BY')               || define('CREATED_BY', 'Créé par');
	defined('DESCRIPTION')              || define('DESCRIPTION', 'Description du Donut');
	defined('SLICE')                    || define('SLICE', 'Part');
	defined('SLICES')                   || define('SLICES', 'Parts');
	defined('COIN')                     || define('COIN', 'Coin');
	defined('COINS')                    || define('COINS', 'Coins');
	defined('ANSWER')                   || define('ANSWER', 'réponse');
	defined('ANSWERS')                  || define('ANSWERS', 'réponses');
	defined('ANSWER_TO')                || define('ANSWER_TO', 'Répondre à');
	defined('WEIGHT')                   || define('WEIGHT', 'Répartition');
	defined('DONUT_NOT_AVAILABLE')      || define('DONUT_NOT_AVAILABLE', 'Le Donut que vous recherchez n\'est plus disponible');
	defined('READ_ALL_COMMENTS')        || define('READ_ALL_COMMENTS', 'Lire tous les commentaires');
	defined('FIRST_COMMENT')            || define('FIRST_COMMENT', 'Soyez le premier à ajouter un commentaire à ce Donut');
	defined('WRITE_COMMENT')            || define('WRITE_COMMENT', 'Écrivez votre commentaire...');
	defined('WRITE_ANSWER')             || define('WRITE_ANSWER', 'Écrivez votre réponse...');
	defined('MY_DASHBOARD')             || define('MY_DASHBOARD', 'Mon Tableau de bord');
	defined('PIE_TIP_CREATED')          || define('PIE_TIP_CREATED', '1. Bravo ! Vous avez créé votre Donut. Vous pouvez maintenant le partager à la communauté 🍩');
	defined('PIE_TIP_CREATED_PRIVATE')  || define('PIE_TIP_CREATED_PRIVATE', '1. Bravo ! Vous avez créé votre Donut privé. 🍩');
	defined('PIE_TIP_10_VIEWS')         || define('PIE_TIP_10_VIEWS', '2. Partagez votre Donut à vos amis ou à votre communauté. Une fois les 10 premières vues atteintes, vous aurez accès aux statistiques de votre Donut 📈');
	defined('PIE_TIP_10_VIEWS_PRIVATE') || define('PIE_TIP_10_VIEWS_PRIVATE', '2. Votre Donut est privé. Partagez-le en indiquant votre code afin que vos amis ou votre communauté puisse y accéder. Une fois les 10 premières vues atteintes, vous aurez accès à vos statistiques journalières 📈');
	defined('PIE_TIP_10_FAVORITES')     || define('PIE_TIP_10_FAVORITES', '3. Obtenez '.NB_FAVORITES_DISPLAY_LISTS.' favoris pour apparaître dans les listes et avoir les performances de votre Donut ⭐');
	defined('PIE_TIP_10_FAVORITES_PRIVATE') || define('PIE_TIP_10_FAVORITES_PRIVATE', '3. Obtenez '.NB_FAVORITES_DISPLAY_LISTS.' favoris. 1 favori = 1 personne qui a accès à votre Donut avec le code ⭐');
	defined('PIE_TIP_10_COMMENTS')      || define('PIE_TIP_10_COMMENTS', '4. Si vous avez plus de 10 commentaires, cela montre que la communauté est intéressée par votre Donut 💬');
	defined('PIE_TIP_HODL')             || define('PIE_TIP_HODL', '5. HODL 🔥');
	defined('PIE_TIP_TO_THE_MOON')      || define('PIE_TIP_TO_THE_MOON', '6. TO THE MOON 🚀');

	defined('PRIVATE_DONUT')            || define('PRIVATE_DONUT', 'Ce Donut est privé');
	defined('ENTER_PRIVATE_CODE')       || define('ENTER_PRIVATE_CODE', 'Entrez le code pour accéder à ce Donut');
	defined('ACCESS_PRIVATE_DONUT')     || define('ACCESS_PRIVATE_DONUT', 'Accéder à un Donut privé');
	defined('ENTER_CODE_PRIVATE_DONUT') || define('ENTER_CODE_PRIVATE_DONUT', 'Entrez le code pour débloquer l\'accès à ce Donut* :');
	defined('INCORRECT_CODE')           || define('INCORRECT_CODE', 'Le code est incorrect.');

	// Add Pie
	defined('FORM_DONUT_NAME')                     || define('FORM_DONUT_NAME', 'Donnez un nom à votre Donut* :');
	defined('FORM_DONUT_NAME_PLACEHOLDER')         || define('FORM_DONUT_NAME_PLACEHOLDER', 'Titre de votre Donut*');
	defined('FORM_DONUT_DESCRIPTION')              || define('FORM_DONUT_DESCRIPTION', 'Ajoutez une description à votre Donut* :');
	defined('FORM_DONUT_DESCRIPTION_PLACEHOLDER')  || define('FORM_DONUT_DESCRIPTION_PLACEHOLDER', 'Description de votre Donut*');
	defined('FORM_DONUT_AMOUNT')                   || define('FORM_DONUT_AMOUNT', 'Combien recommanderiez-vous d\'investir dans votre Donut ? (facultatif)');
	defined('FORM_DONUT_AMOUNT_PLACEHOLDER')       || define('FORM_DONUT_AMOUNT_PLACEHOLDER', 'Montant en euros');
	defined('FORM_DONUT_ASK_PRIVACY')              || define('FORM_DONUT_ASK_PRIVACY', 'Est-ce que votre Donut est public ou privé ?*');
	defined('FORM_DONUT_ASK_PRIVACY_TIP')          || define('FORM_DONUT_ASK_PRIVACY_TIP', 'Cela signifie que votre Donut est visible dans les listes ou non. Si vous choisissez privé, votre Donut sera accessible uniquement avec un code');
	defined('FORM_DONUT_PUBLIC')                   || define('FORM_DONUT_PUBLIC', 'Public');
	defined('FORM_DONUT_PRIVATE')                  || define('FORM_DONUT_PRIVATE', 'Privé');
	defined('FORM_DONUT_ASK_ACCESS')               || define('FORM_DONUT_ASK_ACCESS', 'L\'accès à votre Donut est-il gratuit ou payant ?*');
	defined('FORM_DONUT_FREE')                     || define('FORM_DONUT_FREE', 'Gratuit');
	defined('FORM_DONUT_PAID_ONESHOT')             || define('FORM_DONUT_PAID_ONESHOT', 'Accès payant avec un paiement unique (prochainement)');
	defined('FORM_DONUT_PAID_SUBSCRIPTION')        || define('FORM_DONUT_PAID_SUBSCRIPTION', 'Accès payant avec un abonnement (prochainement)');
	defined('FORM_DONUT_PRIVATE_CODE')             || define('FORM_DONUT_PRIVATE_CODE', 'Ajoutez un code privé pour accéder à votre Donut :*');
	defined('FORM_DONUT_PRIVATE_CODE_PLACEHOLDER') || define('FORM_DONUT_PRIVATE_CODE_PLACEHOLDER', 'Code privé');
	defined('FORM_DONUT_IMPORT_ETH_ADDRESS')       || define('FORM_DONUT_IMPORT_ETH_ADDRESS', 'Importez le portefeuille d\'une adresse Ethereum :');
	defined('FORM_DONUT_SEARCH_COIN')              || define('FORM_DONUT_SEARCH_COIN', 'Rechercher une crypto');
	defined('RESET_DONUT')                         || define('RESET_DONUT', 'Réinitialiser le Donut');
	defined('FORM_DONUT_ERROR_NB_SLICES')          || define('FORM_DONUT_ERROR_NB_SLICES', 'Votre Donut doit avoir entre 2 et 100 parts');
	defined('FORM_DONUT_ERROR_TOTAL_WEIGHT')       || define('FORM_DONUT_ERROR_TOTAL_WEIGHT', 'La répartition total doit être de 100%');

	// WALLET
	defined('WALLET_NOT_AVAILABLE')      || define('WALLET_NOT_AVAILABLE', 'Le portefeuille que vous recherchez n\'est pas disponible');

	// PROFIL
	defined('MEMBER_SINCE')             || define('MEMBER_SINCE', 'Membre depuis');
	defined('FOLLOWER')                 || define('FOLLOWER', 'Abonné');
	defined('FOLLOWERS')                || define('FOLLOWERS', 'Abonnés');
	defined('FOLLOW')                   || define('FOLLOW', 'Suivre');
	defined('FOLLOWED')                 || define('FOLLOWED', 'Suivi');
	defined('_SUCCESS_FOLLOW_USER')     || define('_SUCCESS_FOLLOW_USER', 'Vous suivez maintenant ');
	defined('_SUCCESS_UNFOLLOW_USER')   || define('_SUCCESS_UNFOLLOW_USER', ' a été retiré de vos abonnements');

	// NEWS
	defined('_NEWS_DESCR')              || define('_NEWS_DESCR', 'Retrouvez toute l\'actualité sur les cryptomonnaies au même endroit !');

	/****************
	** FORM COMMON **
	****************/
	defined('FORM_REQUIRED_FIELD') || define('FORM_REQUIRED_FIELD', 'Ce champs est requis');
	defined('FORM_EMAIL_FORMAT')   || define('FORM_EMAIL_FORMAT', 'Veuillez entrer une adresse email valide');
	defined('ERROR_OCCURED')       || define('ERROR_OCCURED', 'Une erreur est survenue. Essayez à nouveau ou plus tard');

	/**************
	** SHOP PAGE **
	**************/
	defined('SEE_MORE') || define('SEE_MORE', 'Voir plus');
	
	/***************
	** LOGIN PAGE **
	***************/
	defined('ASK_NO_ACCOUNT')             || define('ASK_NO_ACCOUNT', 'Pas encore de compte ?');
	defined('FORM_EMAIL')                 || define('FORM_EMAIL', 'Email');
	defined('FORM_USERNAME')              || define('FORM_USERNAME', 'Nom d\'utilisateur');
	defined('FORM_TIP_USERNAME')          || define('FORM_TIP_USERNAME', 'Ce nom apparaîtra sur vos Donuts ainsi que sur votre profil public.');
	defined('FORM_ERROR_MIN_USERNAME')    || define('FORM_ERROR_MIN_USERNAME', 'Votre nom d\'utilisateur doit faire au moins 3 caractères');
	defined('FORM_PASSWORD')              || define('FORM_PASSWORD', 'Mot de passe');
	defined('FORM_NEW_PASSWORD')          || define('FORM_NEW_PASSWORD', 'Nouveau mot de passe');
	defined('FORM_PASSWORD_CONFIRMATION') || define('FORM_PASSWORD_CONFIRMATION', 'Confirmer le mot de passe');
	defined('FORM_MIN_PASSWORD')          || define('FORM_MIN_PASSWORD', '6 caractères minimum');
	defined('FORM_FORGOT_PASSWORD')       || define('FORM_FORGOT_PASSWORD', 'Mot de passe oublié ?');
	defined('FORM_OPTIN')                 || define('FORM_OPTIN', 'Je souhaite être informé des nouveautés de Social Donut');
	defined('FORM_WRONG_ID')              || define('FORM_WRONG_ID', 'Identifiants incorrects');
	defined('FORM_ACCOUNT_NOT_EXIST')     || define('FORM_ACCOUNT_NOT_EXIST', 'Aucun compte trouvé pour cette adresse email. Veuillez <span class="c-primary cursor-pointer do-signup">créer un compte.</span>');
	defined('FORM_NOT_VERIFIED')          || define('FORM_NOT_VERIFIED', 'Votre compte n\'a pas été validé. Veuillez vérifier vos emails.');
	defined('FORM_ERROR_SAME_PASSWORD')   || define('FORM_ERROR_SAME_PASSWORD', 'Les mots de passe ne sont pas identiques');
	defined('FORM_ERROR_MIN_PASSWORD')    || define('FORM_ERROR_MIN_PASSWORD', 'Votre mot de passe doit faire 6 caractères minimum');
	defined('FORM_EMAIL_EXISTS')          || define('FORM_EMAIL_EXISTS', 'Cette adresse email est déjà utilisée');
	defined('RESET_PASSWORD')             || define('RESET_PASSWORD', 'Réinitialisation de votre mot de passe');
	defined('FORM_SAME_PASSWORD')         || define('FORM_SAME_PASSWORD', 'Les mots de passe ne sont pas identiques');
	defined('YOUR_EMAIL')                 || define('YOUR_EMAIL', 'Votre adresse email');
	defined('YOUR_EMAIL_OR_USERNAME')     || define('YOUR_EMAIL_OR_USERNAME', 'Votre adresse email ou nom d\'utilisateur');
	defined('ASK_FORGOT_PASSWORD_SUCCESS')|| define('ASK_FORGOT_PASSWORD_SUCCESS', 'Succès : un mail contenant un lien pour réinitialiser votre mot de passe vous sera envoyé rapidement !');

	defined('SIGNUP_SUCCESS')             || define('SIGNUP_SUCCESS', 'Inscription réussie !');
	defined('SIGNUP_SUCCESS_VALID')       || define('SIGNUP_SUCCESS_VALID', 'Inscription réussie. Un email va vous être envoyé avec un lien pour confirmer votre email.');

	/************
	** ACCOUNT **
	************/
	defined('EDIT_ACCOUNT')                 || define('EDIT_ACCOUNT', 'Modifier mon compte');
	defined('PUBLIC_INFOS')                 || define('PUBLIC_INFOS', 'Mes informations publiques');
	defined('EMAIL')                        || define('EMAIL', 'Adresse email');
	defined('EMAIL_PLACEHOLDER')            || define('EMAIL_PLACEHOLDER', 'Votre adresse email');
	defined('FIRSTNAME')                    || define('FIRSTNAME', 'Prénom');
	defined('FIRSTNAME_PLACEHOLDER')        || define('FIRSTNAME_PLACEHOLDER', 'Votre prénom');
	defined('LASTNAME')                     || define('LASTNAME', 'Nom');
	defined('LASTNAME_PLACEHOLDER')         || define('LASTNAME_PLACEHOLDER', 'Votre nom');
	defined('USERNAME')                     || define('USERNAME', 'Nom d\'utilisateur');
	defined('USERNAME_PLACEHOLDER')         || define('USERNAME_PLACEHOLDER', 'Votre nom d\'utilisateur');
	defined('PHONE')                        || define('PHONE', 'Téléphone');
	defined('PHONE_PLACEHOLDER')            || define('PHONE_PLACEHOLDER', 'Votre numéro de téléphone');
	defined('ERROR_SAVE_INFOS')             || define('ERROR_SAVE_INFOS', 'Erreur lors de la modification de vos informations. Veuillez réessayer plus tard.');
	defined('EDIT_PASSWORD')                || define('EDIT_PASSWORD', 'Modifier mon mot de passe');
	defined('OLD_PASSWORD')                 || define('OLD_PASSWORD', 'Ancien mot de passe');
	defined('OLD_PASSWORD_PLACEHOLDER')     || define('OLD_PASSWORD_PLACEHOLDER', 'Votre ancien mot de passe');
	defined('NEW_PASSWORD')                 || define('NEW_PASSWORD', 'Nouveau mot de passe');
	defined('NEW_PASSWORD_PLACEHOLDER')     || define('NEW_PASSWORD_PLACEHOLDER', 'Votre nouveau mot de passe');
	defined('CONFIRM_PASSWORD')             || define('CONFIRM_PASSWORD', 'Confirmer le nouveau mot de passe');
	defined('CONFIRM_PASSWORD_PLACEHOLDER') || define('CONFIRM_PASSWORD_PLACEHOLDER', 'Confirmer votre nouveau mot de passe');
	defined('CHANGE_PASSWORD')              || define('CHANGE_PASSWORD', 'Changer mon mot de passe');
	defined('SUCCESS_CHANGE_PASSWORD')      || define('SUCCESS_CHANGE_PASSWORD', 'Mot de passe changé avec succès !');
	defined('BIO')                          || define('BIO', 'Ajoutez une description pour vous présenter à la communauté');
	defined('BIO_PLACEHOLDER')              || define('BIO_PLACEHOLDER', 'Décrivez vous brièvement');
	defined('FORM_TIP_SOCIAL_LINK')         || define('FORM_TIP_SOCIAL_LINK', 'Votre nom d\'utilisateur ou le lien complet');
	defined('WEBSITE')                      || define('WEBSITE', 'Site internet');
	defined('WEBSITE_PLACEHOLDER')          || define('WEBSITE_PLACEHOLDER', 'https://www.nomdedomaine.com');
	defined('TWITTER')                      || define('TWITTER', 'Twitter');
	defined('TWITTER_PLACEHOLDER')          || define('TWITTER_PLACEHOLDER', 'Ex. : socialdonut_io');
	defined('FACEBOOK')                     || define('FACEBOOK', 'Facebook');
	defined('FACEBOOK_PLACEHOLDER')         || define('FACEBOOK_PLACEHOLDER', 'Ex. : socialdonut.io');
	defined('INSTAGRAM')                    || define('INSTAGRAM', 'Instagram');
	defined('INSTAGRAM_PLACEHOLDER')        || define('INSTAGRAM_PLACEHOLDER', 'Ex. : socialdonut.io');
	defined('DISCORD')                      || define('DISCORD', 'Discord');
	defined('DISCORD_PLACEHOLDER')          || define('DISCORD_PLACEHOLDER', 'Indiquez l\'url de votre serveur Discord');

	/*****************
	** PRODUCT PAGE **
	*****************/
	defined('PRODUCT_OUT_OF_STOCK')  || define('PRODUCT_OUT_OF_STOCK', 'Ce produit est en rupture de stock');
	defined('PRODUCT_NOT_AVAILABLE') || define('PRODUCT_NOT_AVAILABLE', 'Ce produit n\'est plus disponible');
	defined('PRODUCT_NOT_AVAILABLE_VARIATION') || define('PRODUCT_NOT_AVAILABLE_VARIATION', 'Ce produit n\'est plus disponible pour cette variation');
	defined('ADD_TO_CART')           || define('ADD_TO_CART', 'Ajouter au panier');

	/*****************
	** POST PAGE **
	*****************/
	defined('POST_NOT_AVAILABLE') || define('POST_NOT_AVAILABLE', 'Cet article n\'est plus disponible');
	defined('PAGE_NOT_AVAILABLE') || define('PAGE_NOT_AVAILABLE', 'Cette page n\'est plus disponible');

	defined('COMMENT')  || define('COMMENT', 'Commentaire');
	defined('COMMENTS') || define('COMMENTS', 'Commentaires');

	defined('BACK_TO_BLOG')   || define('BACK_TO_BLOG', 'Revenir au blog');

	/**************
	** CART PAGE **
	**************/
	defined('UNIQUE_BUY')     || define('UNIQUE_BUY', 'Achat unique');
	defined('SUBSCRIPTION')   || define('SUBSCRIPTION', 'Abonnement');
	defined('PRODUCT')        || define('PRODUCT', 'Produit');
	defined('PRICE')          || define('PRICE', 'Prix');
	defined('QUANTITY')       || define('QUANTITY', 'Quantité');
	defined('TOTAL')          || define('TOTAL', 'Total');
	defined('APPLY')          || define('APPLY', 'Appliquer');
	defined('UPDATE')         || define('UPDATE', 'Mettre à jour');
	defined('SUBTOTAL')       || define('SUBTOTAL', 'Sous-total');
	defined('SHIPPING')       || define('SHIPPING', 'Livraison 48-72 heures avec suivi');
	defined('COUPON')         || define('COUPON', 'Coupon');
	defined('VALIDATE_ORDER') || define('VALIDATE_ORDER', 'Validation de la commande');
	defined('EMPTY_CART')     || define('EMPTY_CART', 'Votre inventaire est vide.');
	defined('BACK_TO_SHOP')   || define('BACK_TO_SHOP', 'Je retourne dans l\'échoppe');
	defined('BACK_TO_PIES')   || define('BACK_TO_PIES', 'Revenir à la liste des Donuts');

	defined('COUPON_ALREADY_APPLIED')   || define('COUPON_ALREADY_APPLIED', 'Un code promo est déjà utilisé');
	defined('COUPON_NO_EXIST')          || define('COUPON_NO_EXIST', 'Ce coupon n\'existe pas');
	defined('COUPON_USER_LIMIT_REACHED')|| define('COUPON_USER_LIMIT_REACHED', 'Vous avez dépassé le nombre d\'utilisation de ce code promo.');
	defined('COUPON_LIMIT_REACHED')     || define('COUPON_LIMIT_REACHED', 'Ce code promo ne peut plus être utilisé.');
	defined('COUPON_EXPIRED')           || define('COUPON_EXPIRED', 'Ce code promo est expiré et ne peut plus être utilisé.');
	defined('COUPON_REQUIRED')          || define('COUPON_REQUIRED', 'Merci d\'entrer un code promo');
	defined('COUPON_ACTIVATED')         || define('COUPON_ACTIVATED', 'Code promo activé avec succès !');
	defined('ITEM_REMOVED_FROM_CART_1') || define('ITEM_REMOVED_FROM_CART_1', 'L\'article « ');
	defined('ITEM_REMOVED_FROM_CART_2') || define('ITEM_REMOVED_FROM_CART_2', ' » a bien été retiré de votre panier');
	defined('ITEM_REMOVED_FROM_CART_3') || define('ITEM_REMOVED_FROM_CART_3', ' » a été retiré de votre panier car il n\'est plus en stock');

	/******************
	** CHECKOUT PAGE **
	******************/
	defined('_ERROR_REQUIRED_FIELD') || define('_ERROR_REQUIRED_FIELD', 'The champs est requis');
	defined('_SAVE_PAYMENT_METHOD')  || define('_SAVE_PAYMENT_METHOD', 'Sauvegarder cette carte');

	/******************
	** EMAILS **
	******************/
	defined('SUBJECT_CREATE_ACCOUNT_VALID') || define('SUBJECT_CREATE_ACCOUNT_VALID', 'Confirmez votre compte ');
	defined('SUBJECT_CREATE_ACCOUNT')  || define('SUBJECT_CREATE_ACCOUNT', 'Bienvenue sur ');
	defined('SUBJECT_FORGOT_PASSWORD') || define('SUBJECT_FORGOT_PASSWORD', 'Demande de réinitialisation de mot de passe - ');
	defined('SUBJECT_ORDER_PAID')      || define('SUBJECT_ORDER_PAID', '');

	/***********
	** FOOTER **
	***********/
	defined('FOOTER_DESC')   || define('FOOTER_DESC', '<p>Social Donut est le premier réseau social sur les cryptomonnaies. Donnez votre avis sur les Donuts de la communauté, ou créez et partagez le vôtre !</p><p>Notre but est de créer un endroit où l\'on peut apprendre, partager et échanger avec la communauté sur les cryptomonnaies.</p>');
	defined('FOOTER_OUR_SERVICES')   || define('FOOTER_OUR_SERVICES', 'SERVICES');
	defined('FOOTER_CONTACT')        || define('FOOTER_CONTACT', 'Nous contacter');
	defined('FOOTER_RIGHTS')         || define('FOOTER_RIGHTS', 'Copyright');
	defined('FOOTER_FAQ')            || define('FOOTER_FAQ', 'FAQ');
	defined('FOOTER_LEARN_MORE')     || define('FOOTER_LEARN_MORE', 'En savoir plus');
	defined('FOOTER_JOIN_COMMUNITY') || define('FOOTER_JOIN_COMMUNITY', 'Rejoignez la communauté');
	defined('FOOTER_STAY_TUNED')     || define('FOOTER_STAY_TUNED', 'RESTEZ INFORMÉ DES NOUVEAUTÉS');
	defined('FOOTER_NEWSLETTER_TEXT')|| define('FOOTER_NEWSLETTER_TEXT', 'Abonnez-vous à notre Newsletter pour rester au courant des actualités de Social Donut');
	