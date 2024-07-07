<?php

require_once 'CleanerController.php';

class CommonController extends CleanerController {
    public $layout;
    public $module;
    public $view;
    public $formError;
    public $cache;

    public function __construct(){
        parent::__construct();
        $this->layout                = array();
        $this->module                = '';
        $this->view                  = array();
        $this->formError             = array();
        $this->layout['description'] = '';
        $this->view['formDatas']     = '';
        $this->view['showErrorMsg']  = '';
        $this->view['formElError']   = array();
        $this->view['h1']            = true;
        $this->layout['formOk']      = 0;

        require_once 'models/Cache.php';
        $this->cache  = new Cache();
    }

    public function wsResponse($code_retour, $resultat)
    {
        echo json_encode([
            'code_retour' => $code_retour,
            'resultat'    => $resultat ?? []
        ]);
    }

    public function setViewInLayout($view){
            require_once 'layouts/header.php';
            extract($this->view);
            require_once $view;
            require_once 'layouts/footer.php';
    }

    public function pageError($errorType){
        require_once 'modules/common/controllers/ErrorController.php';
        $errorController = new ErrorController();
        $errorController->errorAction($errorType);
    }

    public function formatPost($post){
        $datas = array();
        foreach($post as $key=>$value){
            if(!is_array($value)) $datas[$key] = trim(strip_tags(stripslashes($value)));
        }
        unset($datas['submit_x']);
        unset($datas['submit_y']);

        return $datas;
    }

    public function showErrorPost($errors){
        if(!empty($errors)) {
            $errorStr  = '';
            $errorStr  = '<div class="formError">';
            $errorStr .= '<ul>';
            foreach($errors as $error)
            {
                $errorStr .= '<li>'. $error .'</li>';
            }
            $errorStr .= '<ul>';
            $errorStr .= '</div>';
            return $errorStr;
        }
    }

    public function getIp(){
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        }
        elseif (isset($_SERVER['HTTP_CLIENT_IP'])){
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        }
        else{
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }

    public function validMail($email){
        $email = trim($email);

        // Liste mail jetable
        $disposable_email = array('jetable', 'yopmail', 'spaml', 'temporaryinbox', 'deadaddress', 'despam', 'mytempemail', 'saynotospams', 'mailinator2', 'sogetthis', 'mailin8r', 'mailinator', 'spamherelots', 'thisisnotmyrealemail', 'eyepaste', 'fornow', 'guerrillamailblock', 'incognitomail', 'beeoh', 'keepmymail', 'mailcatch', 'mailscrap', 'meltmail', 'bsnow', '12minutemail', 'mt2009', 'no-spam', 'sneakemail', 'spamjackal', 'spamavert', 'spambox', 'trashmail', '10x9', 'spamgourmet', '0-mail', 'haltospam', 'link2mail', 'tempinbox', 'explodemail', 'slaskpost', 'spailbox', 'slopsbox', 'realcambio', 'spam.w00ttech', 'watchnode.uni', 'gimme.wa.rez', 'pyramidspel', 'spam.dontassrape', 'slopsbox.osocial', 'freenet6', 'casema', 'hushmail', 'dispostable', '10minutemail', '20minutemail', 'katamail', '*beep*', 'ard', '0815', '0sg', '0wnd', '12hourmail', '1chuan', '1zhuan', '21cn', '2prong', '3126', '3d-painting', '3g', '4warding', '50eo', '6url', '9ox', 'a-bc', 'abwesend', 'addcom', 'agnitumhost', 'alpenjodel', 'alphafrau', 'amorki', 'anonbox', 'anonymbox', 'antichef', 'antispam', 'antispam24', 'autosfromus', 'baldmama', 'baldpapa', 'ballyfinance', 'betriebsdirektor', 'bigmir', 'bin-wieder-da', 'bio-mueslio', 'bio-muesli', 'bk', 'bleib-bei-mir', 'blockfilter', 'bluebottle', 'bodhilita', 'bonbon', 'briefemail', 'brokenvalve', 'bspamfree', 'buerotiger', 'bugmenot', 'bumpymail', 'buy-24h', 'cashette', 'center-mail', 'centermail', 'centermailo', 'cghost-d', 'chongsoft', 'coolnf', 'coole-files', 'cosmorph', 'courrielnf', 'curryworld', 'cust', 'cyber-matrix', 'dandikmail', 'dating4best', 'deadspam', 'despammed', 'dfgh', 'die-besten-bilder', 'die-genossen', 'die-optimisten', 'dieMailbox', 'digital-filestore', 'directbox', 'discardmail', 'discartmail', 'disposeamail', 'docmail', 'dodgeit', 'dodgit', 'dogit', 'dontreg', 'dontsendmespam', 'dontsentmespam', 'download-privat', 'dumpandjunk', 'dumpmail', 'dyndns', 'e-mail', 'e4ward', 'eintagsmail', 'email', 'email4uo', 'emaildienst', 'emailias', 'emailmiser', 'emailtaxi', 'emailto', 'emailwarden', 'example', 'fahr-zur-hoelle', 'fakeinformation', 'falseaddress', 'fantasymail', 'fariflusetlexpire', 'fastacura', 'fastchevy', 'fastchrysler', 'fastkawasaki', 'fastmazda', 'fastmitsubishi', 'fastnissan', 'fastsubaru', 'fastsuzuki', 'fasttoyota', 'fastyamaha', 'feinripptraeger', 'fettabernett', 'filzmail', 'fishfuse', 'forgetmail', 'freemeilaadressforall', 'freudenkinder', 'fromru', 'front14', 'gawab', 'gentlemansclub', 'getonemail', 'ghosttexter', 'gishpuppy', 'gold-profitso', 'goldtoolbox', 'golfillao', 'great-host', 'greensloth', 'guerillamail', 'guerrillamail', 'guerrillamailo', 'h8s', 'hab-verschlafen', 'habmalnefrage', 'hatespam', 'herr-der-mails', 'hidemail', 'home', 'hush', 'i', 'ich-bin-verrueckt-nach-dir', 'ich-will-net', 'imailso', 'imstations', 'inbox', 'inbox2o', 'inboxclean', 'inerted', 'inet', 'inmail24', 'ipoo', 'ist-alleino', 'ist-einmalig', 'ist-ganz-allein', 'ist-willig', 'izmail', 'jetablenf', 'jetfix', 'jetzt-bin-ich-dran', 'jn-club', 'junkmail', 'kaffeeschluerfer', 'kasmail', 'killmail', 'kinglibrary', 'klassmaster', 'kommespaeter', 'krim', 'kuh', 'kulturbetriebo', 'lass-es-geschehen', 'liebt-dicho', 'list', 'listomail', 'litedrop', 'lol', 'lortemail', 'loveyouforever', 'maennerversteherin', 'mail22', 'mailterpinball', 'mailnz', 'mail15', 'mail2rss', 'mail333', 'mail4days', 'mail4uo', 'mailblocks', 'mailbucket', 'maileater', 'mailexpire', 'mailfreeonline', 'mailinater', 'mailinblack', 'mailmoat', 'mailnull', 'mailquack', 'mailshell', 'mailsiphon', 'mailtrash', 'mailueberfall', 'mailzilla', 'makemetheking', 'mamber', 'meine-dateieno', 'meine-diashow', 'meine-fotoso', 'meine-urlaubsfotos', 'meinspamschutz', 'messagebeamer', 'metaping', 'mintemail', 'mns', 'moncourriernf', 'monemailnf', 'monmailnf','monmail', 'mufmail', 'muskelshirt', 'mx0new', 'my-mail', 'myadulto', 'mycleaninbox', 'mymail-in', 'mytop-in', 'mytrashmail', 'mytrashmailpookmail', 'nervmich', 'nervtmich', 'netmails', 'netterchef', 'netzidiot', 'neue-dateien', 'neverbox', 'nm', 'nobulk', 'nomail2me', 'nospam4', 'nospamfor', 'nospammail', 'nowmymail', 'nullboxo', 'nur-fuer-spam', 'nurfuerspam', 'nybella', 'office-dateien', 'oikrach', 'oneoffemail', 'oopi', 'open', 'orangatango', 'partybombe', 'partyheld', 'phreaker', 'pisem', 'pleasedontsendmespam', 'polizisten-duzer', 'poofy', 'pookmail', 'pornobilder-mal-gratis', 'portsaid', 'postfach', 'privacy', 'prydirecto', 'pryworldo', 'public-files', 'punkass', 'put2', 'quantentunnel', 'qv7o', 'ralib', 'raubtierbaendiger', 'recode', 'record', 'recursor', 'rejectmail', 'rootprompt', 'saeuferleber', 'safe-mail', 'safersignup', 'sags-per-mail', 'sandelf', 'satka', 'schmusemail', 'schreib-doch-mal-wieder', 'senseless-entertainment', 'shared-files', 'shieldedmail', 'shinedyoureyes', 'shortmail', 'sibmail', 'siria', 'skeefmail', 'sms', 'sofort-mail', 'sofortmail', 'sonnenkinder', 'soodonims', 'spam', 'spambob', 'spambog', 'spamcannon', 'spamcon', 'spamcorptastic', 'spamcowboy', 'spamday', 'spameater', 'spamex', 'spamfree24', 'spamfree24o', 'spamgrube', 'spamhole', 'spamify', 'spaminator', 'spammote', 'spammotel', 'spammuffel', 'spamoff', 'spamreturn', 'spamspot', 'spamtrail', 'sperke', 'sriaus', 'streber24', 'super-auswahl', 'sweetville', 'tagesmail', 'teewars', 'temp-mail', 'tempe-mail', 'tempemail', 'tempomail', 'temporarily', 'temporaryforwarding', 'terminverpennt', 'test', 'thepryamo', 'topmail-files', 'tortenboxer', 'totalmail', 'trash-mail', 'trashbox', 'trashdevil', 'trashymail', 'trimix', 'turboprinz', 'turboprinzessin', 'tut', 'twinmail', 'ua', 'uk2', 'ukr', 'unterderbruecke', 'verlass-mich-nicht', 'vinbazar', 'vollbio', 'volloeko', 'vorsicht-bissig', 'vorsicht-scharf', 'walala', 'war-im-urlaub', 'wbb3', 'webmail4u', 'wegwerfadresse', 'wegwerfemail', 'weibsvolk', 'weinenvorglueck', 'wh4f', 'whopy', 'will-hier-weg', 'willhackforfood', 'wir-haben-nachwuchs', 'wir-sind-cool', 'wirsindcool', 'wolke7', 'women-at-work', 'wormseo', 'wronghead', 'wuzup', 'xents', 'xmail', 'xmaily', 'xoxy', 'xsecurity', 'yesey', 'yopweb', 'youmailr', 'ystea', 'yzbid', 'zoemail', 'zweb', '675hosting', '75hosting', 'ajaxapp', 'amiri', 'amiriindustries', 'anonymail', 'buyusedlibrarybooks', 'etranquil', 'gowikibooks', 'gowikicampus', 'gowikicars', 'gowikifilms', 'gowikigames', 'gowikimusic', 'gowikinetwork', 'gowikitravel', 'gowikitv', 'ichimail', 'mailslapping', 'myspaceinc', 'myspacepimpedup', 'noclickemail', 'oneoffmail', 'ourklips', 'pimpedupmyspace', 'recyclemail', 'rklips', 'turual', 'upliftnow', 'uplipht', 'viditag', 'viewcastmedia', 'wetrainbayarea', 'willselfdestruct', 'wilemail', 'xagloo', 'thankyou2010', 'f.mintemail', 'fakemail', 'tilien', 'maboard', 'tempmail', 'f.mintemail');

        $whitelist = array("email", "hush", "adfinitas", "hotmail", "live", "yahoo", "gmail", "voila", "laposte", "wanadoo", "orange", "sfr", "lagencetorich", "torich", "nordnet", "numericable", "aol", "neuf", "msn", "comcast", "ntlworld", "clubinternet", "verizon", "wokine", "lautremedia", "cox", "earthlink", "free", "sfr", "boulanger", "gmx", "touteslespetitions");

        // On verifie la validité de l'adresse mail
        if(preg_match('`^[[:alnum:]]([-_.+]?[[:alnum:]])+_?@[[:alnum:]]([-.]?[[:alnum:]])+\.[a-z]{2,6}$`', $email)){

            // On verifie si elle n'est pas dans la liste des emails jetables
            $aEmail = explode('@', $email);
            $aDomain = explode('.', $aEmail[1]);
            $domain = $aDomain[0];

            if(in_array($domain, $whitelist)){
                return 1;
            }
            else{
                if(in_array($domain, $disposable_email)){             // On verifie si l'email n'est pas un email jetable
                    return 0;
                } else{
                    $explode = explode("@",$email);
                    $end = end($explode);
                    // On verifie si le nom de domaine existe
                    if(checkdnsrr($end,"MX")){
                        return 1;
                    } else{
                        return 0;
                    }
                }
            }

        } else{
            return 0;
        }
    }

    //Permet d'envoyer un email via la class PhpMailer
    //Paramètres : sender->@ émettrice, alias->nom de l'emetteur, email->chemin de l'email à envoyer, text->chemin de la version texte de l'email(mettre à false si pas de version texte)
    //variables->tableau avec le nom de variables, data->tableau avec le contenu des variables
    public function envoiEmail($sender, $alias, $sujet, $email, $text, $recieverMail, $recieverName, $variables, $data){
        require_once 'lib/phpmailer/class.phpmailer.php';

        //Config du mail
        $mail = new PHPMailer();
        $mail->IsHTML(true);
        $mail->CharSet = "utf-8";
        $mail->SetFrom($sender, $alias);
        $mail->Subject = $sujet;
        $mail->AddAddress($recieverMail, $recieverName);
        //Version Texte
        if($text){
            $mail->AltBody = file_get_contents($text);
        }
        //Version Html
        $body = file_get_contents($email);
        //Variables
        $vars = $variables;
        $values = $data;
        $body = str_replace($vars,$values,$body);
        //html
        $mail->MsgHTML($body);
        //Envoi
        $mail->Send();
    }

    public function charFormat($string, $case = 'ucfirst'){
        $lower_char = array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "à", "á", "â", "ã", "ä", "å", "æ", "ç", "è", "é", "ê", "ë", "ì", "í", "î", "ï", "ð", "ñ", "ò", "ó", "ô", "õ", "ö", "ø", "ù", "ú", "û", "ü", "ý", "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я");

        $upper_char = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "À", "Á", "Â", "Ã", "Ä", "Å", "Æ", "Ç", "È", "É", "Ê", "Ë", "Ì", "Í", "Î", "Ï", "Ð", "Ñ", "Ò", "Ó", "Ô", "Õ", "Ö", "Ø", "Ù", "Ú", "Û", "Ü", "Ý", "А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж", "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ъ", "Ь", "Э", "Ю", "Я");

        $special = array("à", "á", "â", "ã", "ä", "å", "æ", "ç", "è", "é", "ê", "ë", "ì", "í", "î", "ï", "ð", "ñ", "ò", "ó", "ô", "õ", "ö", "ø", "ù", "ú", "û", "ü", "ý", "а", "б", "в", "г", "д", "е", "ё", "ж", "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я");

        switch ($case){
            case "upper" :
                return str_replace($lower_char, $upper_char, $string);
                break;

            case "lower" :
                return str_replace($upper_char, $lower_char, $string);
                break;

            case "ucfirst" :
            default:
                if (in_array(substr($string, 0, 2), $special)){
                    $length = 2;
                }
                else{
                    $length = 1;
                }
                return (str_replace($lower_char, $upper_char, substr($string, 0, $length)) . str_replace($upper_char, $lower_char, substr($string, $length, strlen($string) - 1)));
                break;
        }
    }

    public function getCurlPage($url){
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $tmp = curl_exec ($ch);
        curl_close ($ch);
        return $tmp;
    }

    public function dateStr($date, $type = 'date'){
        $date = strtotime($date);

        switch($type){
            case 'full':
            // DAY
            $weekDays = array(_SUNDAY,_MONDAY,_TUESDAY,_WEDNESDAY,_THURSDAY,_FRIDAY,_SATURDAY);
            $nDay = date('w', $date);
            $weekday = $weekDays[$nDay];

            // MONTH
            $months = array(' ',_JANUARY,_FEBRUARY,_MARCH,_APRIL,_MAY,_JUNE,_JULY,_AUGUST,_SEPTEMBER,_OCTOBER,_NOVEMBER,_DECEMBER);
            $nMonth = date("n", $date);
            $month = $months[$nMonth];

            if(LANG == 'fr') $return = $weekday . ' ' . date('d', $date) . ' ' . $month . ' ' . date('Y', $date);
            elseif(LANG == 'en') $return = $weekday . ', ' . $month . date('d', $date) . ', ' . date('Y', $date);
            break;

            case 'short':
            if(LANG == 'fr') $return = date('d', $date) . ' ' . $month . ' ' . date('Y', $date);
            elseif(LANG == 'en') $return = $month . date('d', $date) . ', ' . date('Y', $date);
            break;

            case 'date':
            if(LANG == 'fr') $return = date('d', $date) . '/' . date("m", $date) . '/' . date('Y', $date);
            elseif(LANG == 'en') $return = date('Y', $date) . '/' . date("m", $date) . '/' . date('d', $date);
            break;

            case 'dateHourDate':
            if(LANG == 'fr') $return = date('d', $date) . '/' . date("m", $date) . '/' . date('Y', $date) . ' ';
            elseif(LANG == 'en') $return = date('Y', $date) . '/' . date("m", $date) . '/' . date('d', $date) . ' ';
            $return .= date('H', $date) . ':' . date('i', $date) . ':' . date('s', $date);
            break;

            case 'dateHour':
            if(LANG == 'fr') $return = 'Le ' . date('d', $date) . '/' . date("m", $date) . '/' . date('Y', $date) . ' à ';
            elseif(LANG == 'en') $return = 'The ' . date('Y', $date) . '/' . date("m", $date) . '/' . date('d', $date) . ' at ';
            $return .= date('H', $date) . ':' . date('i', $date) . ':' . date('s', $date);
            break;
        }

        return $return;
    }

    public function redirect($url){
        header("location: $url");
        exit();
    }

    public function formatForUrl($var){
        $modif = str_replace(
            array(
                'à', 'â', 'ä', 'á', 'ã', 'å',
                'î', 'ï', 'ì', 'í',
                'ô', 'ö', 'ò', 'ó', 'õ', 'ø',
                'ù', 'û', 'ü', 'ú',
                'é', 'è', 'ê', 'ë',
                'ç', 'ÿ', 'ñ',
                'À', 'Â', 'Ä', 'Á', 'Ã', 'Å',
                'Î', 'Ï', 'Ì', 'Í',
                'Ô', 'Ö', 'Ò', 'Ó', 'Õ', 'Ø',
                'Ù', 'Û', 'Ü', 'Ú',
                'É', 'È', 'Ê', 'Ë',
                'Ç', 'Ÿ', 'Ñ'
            ),
            array(
                'a', 'a', 'a', 'a', 'a', 'a',
                'i', 'i', 'i', 'i',
                'o', 'o', 'o', 'o', 'o', 'o',
                'u', 'u', 'u', 'u',
                'e', 'e', 'e', 'e',
                'c', 'y', 'n',
                'A', 'A', 'A', 'A', 'A', 'A',
                'I', 'I', 'I', 'I',
                'O', 'O', 'O', 'O', 'O', 'O',
                'U', 'U', 'U', 'U',
                'E', 'E', 'E', 'E',
                'C', 'Y', 'N'
            ),
            $var
        );

        $var = $modif;
        $var = str_replace('?', '', $var);
        $var = strtolower($var);
        $espaceArray = explode(' ', $var);
        if(count($espaceArray) > 1) $var = $this->removeCommonWords($var);
        $var = preg_replace('/^\[.*?\]/', '', $var);
        $var = trim($var);
        $var = str_replace(' ', '-', $var);
        $var = str_replace('...', '', $var);
        $var = preg_replace('#([^a-z0-9-_])#', '-', $var);
        $var = preg_replace('#([-]+)#', '-', $var);
        if(substr($var, 0, 1) == '-') $var = substr($var, 1, strlen($var));
        if(substr($var, -1) == '-')   $var = substr($var, 0, -1);

        $varArray = explode('-', $var);
        if(count($varArray) > 6){
            $var = '';
            for($i = 0; $i <= 5; $i++){
                $var .= $varArray[$i];
                if($i != 5) $var .= '-';
            }
        }
        if(strlen($var) > 100){
            $var    = substr($var, 0, 100);
            $indent = strrpos($var, '-');
            $var    = substr($var, 0, $indent);
        }

        return $var;
    }

    private function removeCommonWords($var){
        $commonWords = array(
            'a','able','about','above','abroad','according','accordingly','across','actually','adj','after','afterwards','again','against','ago','ahead','ain\'t',
            'all','allow','allows','almost','alone','along','alongside','already','also','although','always','am','amid','amidst','among','amongst','an','and','another',
            'any','anybody','anyhow','anyone','anything','anyway','anyways','anywhere','apart','appear','appreciate','appropriate','are','aren\'t','around','as','a\'s',
            'aside','ask','asking','associated','at','available','away','awfully','b','back','backward','backwards','be','became','because','become','becomes','becoming',
            'been','before','beforehand','begin','behind','being','believe','below','beside','besides','best','better','between','beyond','both','brief','but','by','c','came',
            'can','cannot','cant','can\'t','caption','cause','causes','certain','certainly','changes','clearly','c\'mon','co','co.','com','come','comes','concerning',
            'consequently','consider','considering','contain','containing','contains','corresponding','could','couldn\'t','course','c\'s','currently','d','dare','daren\'t',
            'definitely','described','despite','did','didn\'t','different','directly','do','does','doesn\'t','doing','done','don\'t','down','downwards','during','e','each',
            'edu','eg','eight','eighty','either','else','elsewhere','end','ending','enough','entirely','especially','et','etc','even','ever','evermore','every','everybody',
            'everyone','everything','everywhere','ex','exactly','example','except','f','fairly','far','farther','few','fewer','fifth','first','five','followed','following',
            'follows','for','forever','former','formerly','forth','forward','found','four','from','further','furthermore','g','get','gets','getting','given','gives','go','goes',
            'going','gone','got','gotten','greetings','h','had','hadn\'t','half','happens','hardly','has','hasn\'t','have','haven\'t','having','he','he\'d','he\'ll','hello',
            'help','hence','her','here','hereafter','hereby','herein','here\'s','hereupon','hers','herself','he\'s','hi','him','himself','his','hither','hopefully','how',
            'howbeit','however','hundred','i','i\'d','ie','if','ignored','i\'ll','i\'m','immediate','in','inasmuch','inc','inc.','indeed','indicate','indicated','indicates',
            'inner','inside','insofar','instead','into','inward','is','isn\'t','it','it\'d','it\'ll','its','it\'s','itself','i\'ve','j','just','k','keep','keeps','kept','know',
            'known','knows','l','last','lately','later','latter','latterly','least','less','lest','let','let\'s','like','liked','likely','likewise','little','look','looking',
            'looks','low','lower','ltd','m','made','mainly','make','makes','many','may','maybe','mayn\'t','me','mean','meantime','meanwhile','merely','might','mightn\'t',
            'mine','minus','miss','more','moreover','most','mostly','mr','mrs','much','must','mustn\'t','my','myself','n','name','namely','nd','near','nearly','necessary',
            'need','needn\'t','needs','neither','never','neverf','neverless','nevertheless','new','next','nine','ninety','no','nobody','non','none','nonetheless','noone',
            'no-one','nor','normally','not','nothing','notwithstanding','novel','now','nowhere','o','obviously','of','off','often','oh','ok','okay','old','on','once','one',
            'ones','one\'s','only','onto','opposite','or','other','others','otherwise','ought','oughtn\'t','our','ours','ourselves','out','outside','over','overall','own',
            'p','particular','particularly','past','per','perhaps','placed','please','plus','possible','presumably','probably','provided','provides','q','que','quite','qv',
            'r','rather','rd','re','really','reasonably','recent','recently','regarding','regardless','regards','relatively','respectively','right','round','s','said','same',
            'saw','say','saying','says','second','secondly','see','seeing','seem','seemed','seeming','seems','seen','self','selves','sensible','sent','serious','seriously',
            'seven','several','shall','shan\'t','she','she\'d','she\'ll','she\'s','should','shouldn\'t','since','six','so','some','somebody','someday','somehow','someone',
            'something','sometime','sometimes','somewhat','somewhere','soon','sorry','specified','specify','specifying','still','sub','such','sup','sure','t','take','taken',
            'taking','tell','tends','th','than','thank','thanks','thanx','that','that\'ll','thats','that\'s','that\'ve','the','their','theirs','them','themselves','then',
            'thence','there','thereafter','thereby','there\'d','therefore','therein','there\'ll','there\'re','theres','there\'s','thereupon','there\'ve','these','they',
            'they\'d','they\'ll','they\'re','they\'ve','thing','things','think','third','thirty','this','thorough','thoroughly','those','though','three','through',
            'throughout','thru','thus','till','to','together','too','took','toward','towards','tried','tries','truly','try','trying','t\'s','twice','two','u','un','under',
            'underneath','undoing','unfortunately','unless','unlike','unlikely','until','unto','up','upon','upwards','us','use','used','useful','uses','using','usually','v',
            'value','various','versus','very','via','viz','vs','w','want','wants','was','wasn\'t','way','we','we\'d','welcome','well','we\'ll','went','were','we\'re',
            'weren\'t','we\'ve','what','whatever','what\'ll','what\'s','what\'ve','when','whence','whenever','where','whereafter','whereas','whereby','wherein','where\'s',
            'whereupon','wherever','whether','which','whichever','while','whilst','whither','who','who\'d','whoever','whole','who\'ll','whom','whomever','who\'s','whose',
            'why','will','willing','wish','with','within','without','wonder','won\'t','would','wouldn\'t','x','y','yes','yet','you','you\'d','you\'ll','your','you\'re',
            'yours','yourself','yourselves','you\'ve','z','zero',
            'alors','au','aucuns','aussi','autre','avant','avec','avoir','bon','c\'','car','ce','cela','ces','ceux','chaque','ci',
            'comme','comment','ça','ca','chez','cet','cette','d\'','dans','des','du','dedans','dehors','depuis','deux','devrait','doit','donc','dos','droite','de',
            'début','elle','elles','en','encore','essai','est','et','étaient','état','étions','été','être','eu','fait','faites',
            'fois','font','force','haut','hors','ici','il','ils','je','juste','l\'','la','le','les','leur','là','ma','maintenant',
            'mais','mes','mine','moins','mon','mot','même','ni','ne','non','nommés','notre','nous','nouveaux','oui','ou','où','par','parce',
            'parole','pas','personnes','peut','peu','pièce','plupart','pour','pourquoi','quand','que','quel','quelle','quelles',
            'quels','qui','sa','sans','ses','seulement','si','sien','son','sont','sous','soyez','sujet','sur','ta','tandis',
            'tellement','tels','tes','ton','tous','tout','trop','très','tu','un','une','valeur','voie','voient','vont','votre','vous','vu','vos','zero'
        );

        return preg_replace('/\b('.implode('|',$commonWords).')\b/','',$var);
    }

    /**
     * Gestion des roles
     *
     * @author Sam
     */
    public function checkRole($action = null, $style = true) {
        $authorizations = [
            /* Routes */
            // Tableau de bord
                // 'dashboardedito'               => [ROLE_FULL, ROLE_STAGIAIRE], // accès rapide édito
        ];

        if (array_key_exists(strtolower($action ?? $_GET['a']), $authorizations)) {
            if (!in_array($_SESSION['role'], $authorizations[strtolower($action ?? $_GET['a'])])) {
                if ($action) {
                    if ($style) {
                        return 'style="display: none"';
                    } else {
                        return 'display: none';
                    }
                } else {
                    // Cas spécial cms stagiaire
                    if ($_GET['a'] == 'cms' && $_GET['type'] == 'dans-la-presse') {
                        if (!in_array($_SESSION['role'], $authorizations[strtolower('cms?type=dans-la-presse')])) {
                            $this->redirect('/admin');
                        }
                    } else $this->redirect('/admin');
                }
            }
        }
    }

    public static function callAPI($url, $credentials, $json) {
        $json = json_encode($json);

        $curl = curl_init($url);
        curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
        curl_setopt($curl, CURLOPT_USERPWD, $credentials);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_POST, true);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $json);
        // sous docker désactive la verif du certificat ssl
        if (ENVMODE == 'DEV_DOCKER') {
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        }
        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Connection: Keep-Alive','Keep-Alive: 3600','Content-Type:application/json', 'Content-Length: ' . strlen($json)));
        curl_setopt($curl, CURLOPT_CONNECTTIMEOUT ,0);
        curl_setopt($curl, CURLOPT_TIMEOUT, 0); //timeout in seconds
        curl_setopt($curl, CURLOPT_NOSIGNAL, 1);
        set_time_limit(0);
        ignore_user_abort(true);
        $date = time();
        $curl_response = curl_exec($curl);
        curl_close($curl);

        return json_decode($curl_response);
    }

    /*
    * Génère le JSON à partir d'un tableau de données.
    *
    * @param array $arr
    * @return string
    */
    public function jsonize($arr = null){
        if(empty($arr)) return "";

        $str = "";
        $count = 0;
        if(!$this->isAssoc($arr)) {
            $str .= "[";
            foreach($arr as $val) {
                $count++;
                $str .= is_array($val)
                ? $this->jsonize($val)
                : '"' . $this->replace($val) . '"';
                if($count != sizeof($arr)) $str .= ",";
            }
            $str .= "]";
        } else {
            $str .= "{";
            foreach($arr as $key=>$val) {
                $count++;
                $str .= is_array($val)
                ? '"' . $key . '":' . $this->jsonize($val)
                : '"' . $key . '":"' . $this->replace($val) . '"';
                if($count != sizeof($arr)) $str .= ",";
            }
            $str .= "}";
        }
        return $str;
    }

    /*
    * Vérifie si un tableau est de type associatif.
    *
    * @param array $array
    * @return boolean Vrai si le tableau est associatif.
    */
    private function isAssoc($array){
        foreach (array_keys($array) as $k => $v) {
            if ($k !== $v) {
                return true;
            }
        }
        return false;
    }

    /*
    * Ajoute un backslash devant les guillemets doubles
    *
    * @param string string
    * @return string Vrai si le tableau est associatif.
    */
    private function replace($str){
        $str = str_replace('\"', '"', $str);
        $str = str_replace('"', '\"', $str);
        return preg_replace('/\s+/', ' ', $str);
    }

    public function isMobile(){
       require_once 'lib/mobil/Mobile_Detect.php';
       $detect = new Mobile_Detect();

        if($detect->isTablet()){
            $mobil = 0;
            return $mobil;
        }
        if($detect->isMobile()){
           $mobil = 1;
           return $mobil;
        }
    }
}
