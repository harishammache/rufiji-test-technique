<?php
class CleanerController{
    
    private $badWords = [
        'abruti',
        'abrutti',
        ' baise',
        ' baisé',
        ' baisez',
        'batar',
        'battar',
        ' bico',
        ' bite',
        'bitte',
        'bougnoul',
        'bounioul',
        ' con ',
        ' con.',
        ' con!',
        ' cons ',
        ' cone',
        ' cones',
        ' conne',
        ' connes',
        'conar',
        'connar',
        'connard',
        'conasse',
        'connasse',
        'couille',
        ' cul ',
        'degueullasse',
        'degueulasse',
        'degeulasse',
        'degeullasse',  
        'ducon',
        'encul',
        'encoulé',
        'fdp',
        'fils de pute',
        'fil de pute',
        'hitler',
        'merde',
        ' niquer',
        ' niqué',
        ' niquez',
        ' nique',
        ' nique ta mère',
        'nique les arabes',
        'nique les noirs',
        'ntm ',
        ' pd ',
        ' pd.',
        ' pede ',
        ' pedes ',
        ' pédé ',
        ' pédés ',
        'pedophil',
        'pédophil',
        'petasse',
        'pétasse',
        'poufiasse',
        'pouffiasse',
        'putain',
        ' pute',
        'bande de putes',
        'sale put',
        'salle put',
        'salaud',
        'salop',
        'sorciére',
        'sorcière',
        'sorciere',
        'ta gueul',
        'ta geul',
        'ta race',
        'tarlouse',
        'tarlouze',
        ' tg',
        'trou du cul',
        'trous du cul',
        'va te faire',
        'viagra',
        'www',
        '@',
        'fuck',
        'pussy',
        'bitch',
        'bastard',
        'shit'
    ];

    public function __construct() {

    }

    /**
     * Filtre une chaine de caractère en supprimant les ";"  "\r"  "\n"  et les espaces multiples au sein de la chaine
     * retourne la chaine filtrée en supprimant les espaces présents en début et fin de chaine
     * 
     * @author Sam
     * @param  string
     * @return string
     */
    public function sanitizeAddress($value)
    {
        $sanitized = preg_replace(array('/;/', '#(\\\r|\\\r\\\n|\\\n)#', '!\s+!'), ' ', $value);
        return trim($sanitized);
    }

    /**
     * Nettoie les numeros de telephone
     * O -> 0
     * o -> 0
     * supprime les lettres et autres caractères non numérique
     * 
     * @author Sam
     * @param  string
     * @return string
     */
    public function sanitizePhone($value)
    {
        $sanitized = str_replace('O', '0', $value);
        $sanitized = str_replace('o', '0', $sanitized);
        $sanitized = preg_replace('/[^0-9]/', '', $sanitized);
        $sanitized = preg_replace(array('/;/', '#(\\\r|\\\r\\\n|\\\n)#', '!\s+!'), ' ', $sanitized);
        return trim($sanitized);
    }

    /**
     * Vérifie les numeros de telephone
     * 
     * @author Nekfeu
     * @param  string
     * @return string
     */
    public function verifPhone($value)
    {
        if( strlen($value) != 10 ){
            return false;
        }
        elseif( substr($value, 0, 1) != 0 ){
            return false;
        }
        elseif( substr($value, 1, 1) == 0 ){
            return false;
        }
        elseif( substr($value, 1, 1) == 8 ){
            return false;
        }

        return true;
    }

    /**
     * Filtre les commentaires en live
     * 
     * @author Sam
     * @param  string
     * @return bool
     */
    public function filterBadWords($text)
    {
        foreach ($this->badWords as $word) {
            if (stripos($text, $word) !== false || mb_strtolower($text) == mb_strtolower(trim($word))) {
                return true;
            }
        } 
        return false;
    }

    /**
     * Convertit les codes emoticons pour affichage en html
     * @author Sam
     */
    public function convertEmoticons($text)
    {
        $text = str_replace("\xF0\x9F\x98\x81","&#x1F601;",$text);
        $text = str_replace("\xF0\x9F\x98\x82","&#x1F602;",$text);
        $text = str_replace("\xF0\x9F\x98\x83","&#x1F603;",$text);
        $text = str_replace("\xF0\x9F\x98\x84","&#x1F604;",$text);
        $text = str_replace("\xF0\x9F\x98\x85","&#x1F605;",$text);
        $text = str_replace("\xF0\x9F\x98\x86","&#x1F606;",$text);
        $text = str_replace("\xF0\x9F\x98\x89","&#x1F609;",$text);
        $text = str_replace("\xF0\x9F\x98\x8A","&#x1F60A;",$text);
        $text = str_replace("\xF0\x9F\x98\x8B","&#x1F60B;",$text);
        $text = str_replace("\xF0\x9F\x98\x8C","&#x1F60C;",$text);
        $text = str_replace("\xF0\x9F\x98\x8D","&#x1F60D;",$text);
        $text = str_replace("\xF0\x9F\x98\x8F","&#x1F60F;",$text);
        $text = str_replace("\xF0\x9F\x98\x92","&#x1F612;",$text);
        $text = str_replace("\xF0\x9F\x98\x93","&#x1F613;",$text);
        $text = str_replace("\xF0\x9F\x98\x94","&#x1F614;",$text);
        $text = str_replace("\xF0\x9F\x98\x96","&#x1F616;",$text);
        $text = str_replace("\xF0\x9F\x98\x98","&#x1F618;",$text);
        $text = str_replace("\xF0\x9F\x98\x9A","&#x1F61A;",$text);
        $text = str_replace("\xF0\x9F\x98\x9C","&#x1F61C;",$text);
        $text = str_replace("\xF0\x9F\x98\x9D","&#x1F61D;",$text);
        $text = str_replace("\xF0\x9F\x98\x9E","&#x1F61E;",$text);
        $text = str_replace("\xF0\x9F\x98\xA0","&#x1F620;",$text);
        $text = str_replace("\xF0\x9F\x98\xA1","&#x1F621;",$text);
        $text = str_replace("\xF0\x9F\x98\xA2","&#x1F622;",$text);
        $text = str_replace("\xF0\x9F\x98\xA3","&#x1F623;",$text);
        $text = str_replace("\xF0\x9F\x98\xA4","&#x1F624;",$text);
        $text = str_replace("\xF0\x9F\x98\xA5","&#x1F625;",$text);
        $text = str_replace("\xF0\x9F\x98\xA8","&#x1F628;",$text);
        $text = str_replace("\xF0\x9F\x98\xA9","&#x1F629;",$text);
        $text = str_replace("\xF0\x9F\x98\xAA","&#x1F62A;",$text);
        $text = str_replace("\xF0\x9F\x98\xAB","&#x1F62B;",$text);
        $text = str_replace("\xF0\x9F\x98\xAD","&#x1F62D;",$text);
        $text = str_replace("\xF0\x9F\x98\xB0","&#x1F630;",$text);
        $text = str_replace("\xF0\x9F\x98\xB1","&#x1F631;",$text);
        $text = str_replace("\xF0\x9F\x98\xB2","&#x1F632;",$text);
        $text = str_replace("\xF0\x9F\x98\xB3","&#x1F633;",$text);
        $text = str_replace("\xF0\x9F\x98\xB5","&#x1F635;",$text);
        $text = str_replace("\xF0\x9F\x98\xB7","&#x1F637;",$text);
        $text = str_replace("\xF0\x9F\x98\xB8","&#x1F638;",$text);
        $text = str_replace("\xF0\x9F\x98\xB9","&#x1F639;",$text);
        $text = str_replace("\xF0\x9F\x98\xBA","&#x1F63A;",$text);
        $text = str_replace("\xF0\x9F\x98\xBB","&#x1F63B;",$text);
        $text = str_replace("\xF0\x9F\x98\xBC","&#x1F63C;",$text);
        $text = str_replace("\xF0\x9F\x98\xBD","&#x1F63D;",$text);
        $text = str_replace("\xF0\x9F\x98\xBE","&#x1F63E;",$text);
        $text = str_replace("\xF0\x9F\x98\xBF","&#x1F63F;",$text);
        $text = str_replace("\xF0\x9F\x99\x80","&#x1F640;",$text);
        $text = str_replace("\xF0\x9F\x99\x85","&#x1F645;",$text);
        $text = str_replace("\xF0\x9F\x99\x86","&#x1F646;",$text);
        $text = str_replace("\xF0\x9F\x99\x87","&#x1F647;",$text);
        $text = str_replace("\xF0\x9F\x99\x88","&#x1F648;",$text);
        $text = str_replace("\xF0\x9F\x99\x89","&#x1F649;",$text);
        $text = str_replace("\xF0\x9F\x99\x8A","&#x1F64A;",$text);
        $text = str_replace("\xF0\x9F\x99\x8B","&#x1F64B;",$text);
        $text = str_replace("\xF0\x9F\x99\x8C","&#x1F64C;",$text);
        $text = str_replace("\xF0\x9F\x99\x8D","&#x1F64D;",$text);
        $text = str_replace("\xF0\x9F\x99\x8E","&#x1F64E;",$text);
        $text = str_replace("\xF0\x9F\x99\x8F","&#x1F64F;",$text);
        $text = str_replace("\xE2\x9C\x82","&#x2702;",$text);
        $text = str_replace("\xE2\x9C\x85","&#x2705;",$text);
        $text = str_replace("\xE2\x9C\x88","&#x2708;",$text);
        $text = str_replace("\xE2\x9C\x89","&#x2709;",$text);
        $text = str_replace("\xE2\x9C\x8A","&#x270A;",$text);
        $text = str_replace("\xE2\x9C\x8B","&#x270B;",$text);
        $text = str_replace("\xE2\x9C\x8C","&#x270C;",$text);
        $text = str_replace("\xE2\x9C\x8F","&#x270F;",$text);
        $text = str_replace("\xE2\x9C\x92","&#x2712;",$text);
        $text = str_replace("\xE2\x9C\x94","&#x2714;",$text);
        $text = str_replace("\xE2\x9C\x96","&#x2716;",$text);
        $text = str_replace("\xE2\x9C\xA8","&#x2728;",$text);
        $text = str_replace("\xE2\x9C\xB3","&#x2733;",$text);
        $text = str_replace("\xE2\x9C\xB4","&#x2734;",$text);
        $text = str_replace("\xE2\x9D\x84","&#x2744;",$text);
        $text = str_replace("\xE2\x9D\x87","&#x2747;",$text);
        $text = str_replace("\xE2\x9D\x8C","&#x274C;",$text);
        $text = str_replace("\xE2\x9D\x8E","&#x274E;",$text);
        $text = str_replace("\xE2\x9D\x93","&#x2753;",$text);
        $text = str_replace("\xE2\x9D\x94","&#x2754;",$text);
        $text = str_replace("\xE2\x9D\x95","&#x2755;",$text);
        $text = str_replace("\xE2\x9D\x97","&#x2757;",$text);
        $text = str_replace("\xE2\x9D\xA4","&#x2764;",$text);
        $text = str_replace("\xE2\x9E\x95","&#x2795;",$text);
        $text = str_replace("\xE2\x9E\x96","&#x2796;",$text);
        $text = str_replace("\xE2\x9E\x97","&#x2797;",$text);
        $text = str_replace("\xE2\x9E\xA1","&#x27A1;",$text);
        $text = str_replace("\xE2\x9E\xB0","&#x27B0;",$text);
        $text = str_replace("\xF0\x9F\x9A\x80","&#x1F680;",$text);
        $text = str_replace("\xF0\x9F\x9A\x83","&#x1F683;",$text);
        $text = str_replace("\xF0\x9F\x9A\x84","&#x1F684;",$text);
        $text = str_replace("\xF0\x9F\x9A\x85","&#x1F685;",$text);
        $text = str_replace("\xF0\x9F\x9A\x87","&#x1F687;",$text);
        $text = str_replace("\xF0\x9F\x9A\x89","&#x1F689;",$text);
        $text = str_replace("\xF0\x9F\x9A\x8C","&#x1F68C;",$text);
        $text = str_replace("\xF0\x9F\x9A\x8F","&#x1F68F;",$text);
        $text = str_replace("\xF0\x9F\x9A\x91","&#x1F691;",$text);
        $text = str_replace("\xF0\x9F\x9A\x92","&#x1F692;",$text);
        $text = str_replace("\xF0\x9F\x9A\x93","&#x1F693;",$text);
        $text = str_replace("\xF0\x9F\x9A\x95","&#x1F695;",$text);
        $text = str_replace("\xF0\x9F\x9A\x97","&#x1F697;",$text);
        $text = str_replace("\xF0\x9F\x9A\x99","&#x1F699;",$text);
        $text = str_replace("\xF0\x9F\x9A\x9A","&#x1F69A;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA2","&#x1F6A2;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA4","&#x1F6A4;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA5","&#x1F6A5;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA7","&#x1F6A7;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA8","&#x1F6A8;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA9","&#x1F6A9;",$text);
        $text = str_replace("\xF0\x9F\x9A\xAA","&#x1F6AA;",$text);
        $text = str_replace("\xF0\x9F\x9A\xAB","&#x1F6AB;",$text);
        $text = str_replace("\xF0\x9F\x9A\xAC","&#x1F6AC;",$text);
        $text = str_replace("\xF0\x9F\x9A\xAD","&#x1F6AD;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB2","&#x1F6B2;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB6","&#x1F6B6;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB9","&#x1F6B9;",$text);
        $text = str_replace("\xF0\x9F\x9A\xBA","&#x1F6BA;",$text);
        $text = str_replace("\xF0\x9F\x9A\xBB","&#x1F6BB;",$text);
        $text = str_replace("\xF0\x9F\x9A\xBC","&#x1F6BC;",$text);
        $text = str_replace("\xF0\x9F\x9A\xBD","&#x1F6BD;",$text);
        $text = str_replace("\xF0\x9F\x9A\xBE","&#x1F6BE;",$text);
        $text = str_replace("\xF0\x9F\x9B\x80","&#x1F6C0;",$text);
        $text = str_replace("\xE2\x93\x82","&#x24C2;",$text);
        $text = str_replace("\xF0\x9F\x85\xB0","&#x1F170;",$text);
        $text = str_replace("\xF0\x9F\x85\xB1","&#x1F171;",$text);
        $text = str_replace("\xF0\x9F\x85\xBE","&#x1F17E;",$text);
        $text = str_replace("\xF0\x9F\x85\xBF","&#x1F17F;",$text);
        $text = str_replace("\xF0\x9F\x86\x8E","&#x1F18E;",$text);
        $text = str_replace("\xF0\x9F\x86\x91","&#x1F191;",$text);
        $text = str_replace("\xF0\x9F\x86\x92","&#x1F192;",$text);
        $text = str_replace("\xF0\x9F\x86\x93","&#x1F193;",$text);
        $text = str_replace("\xF0\x9F\x86\x94","&#x1F194;",$text);
        $text = str_replace("\xF0\x9F\x86\x95","&#x1F195;",$text);
        $text = str_replace("\xF0\x9F\x86\x96","&#x1F196;",$text);
        $text = str_replace("\xF0\x9F\x86\x97","&#x1F197;",$text);
        $text = str_replace("\xF0\x9F\x86\x98","&#x1F198;",$text);
        $text = str_replace("\xF0\x9F\x86\x99","&#x1F199;",$text);
        $text = str_replace("\xF0\x9F\x86\x9A","&#x1F19A;",$text);
        $text = str_replace("\xF0\x9F\x87\xA9","&#x1F1E9; &#x1F1EA;",$text);
        $text = str_replace("\xF0\x9F\x87\xAC","&#x1F1EC;",$text);
        $text = str_replace("\xF0\x9F\x87\xA8","&#x1F1E8;",$text);
        $text = str_replace("\xF0\x9F\x87\xAF","&#x1F1EF;",$text);
        $text = str_replace("\xF0\x9F\x87\xB0","&#x1F1F0;",$text);
        $text = str_replace("\xF0\x9F\x87\xAB","&#x1F1EB;",$text);
        $text = str_replace("\xF0\x9F\x87\xAA","&#x1F1EA;",$text);
        $text = str_replace("\xF0\x9F\x87\xAE","&#x1F1EE;",$text);
        $text = str_replace("\xF0\x9F\x87\xBA","&#x1F1FA;",$text);
        $text = str_replace("\xF0\x9F\x87\xB7","&#x1F1F7;",$text);
        $text = str_replace("\xF0\x9F\x88\x81","&#x1F201;",$text);
        $text = str_replace("\xF0\x9F\x88\x82","&#x1F202;",$text);
        $text = str_replace("\xF0\x9F\x88\x9A","&#x1F21A;",$text);
        $text = str_replace("\xF0\x9F\x88\xAF","&#x1F22F;",$text);
        $text = str_replace("\xF0\x9F\x88\xB2","&#x1F232;",$text);
        $text = str_replace("\xF0\x9F\x88\xB3","&#x1F233;",$text);
        $text = str_replace("\xF0\x9F\x88\xB4","&#x1F234;",$text);
        $text = str_replace("\xF0\x9F\x88\xB5","&#x1F235;",$text);
        $text = str_replace("\xF0\x9F\x88\xB6","&#x1F236;",$text);
        $text = str_replace("\xF0\x9F\x88\xB7","&#x1F237;",$text);
        $text = str_replace("\xF0\x9F\x88\xB8","&#x1F238;",$text);
        $text = str_replace("\xF0\x9F\x88\xB9","&#x1F239;",$text);
        $text = str_replace("\xF0\x9F\x88\xBA","&#x1F23A;",$text);
        $text = str_replace("\xF0\x9F\x89\x90","&#x1F250;",$text);
        $text = str_replace("\xF0\x9F\x89\x91","&#x1F251;",$text);
        $text = str_replace("\xC2\xA9","&#x00A9;",$text);
        $text = str_replace("\xC2\xAE","&#x00AE;",$text);
        $text = str_replace("\xE2\x80\xBC","&#x203C;",$text);
        $text = str_replace("\xE2\x81\x89","&#x2049;",$text);
        $text = str_replace("\x38\xE2\x83\xA3","&#x0038; &#x20E3;",$text);
        $text = str_replace("\x39\xE2\x83\xA3","&#x0039; &#x20E3;",$text);
        $text = str_replace("\x37\xE2\x83\xA3","&#x0037; &#x20E3;",$text);
        $text = str_replace("\x36\xE2\x83\xA3","&#x0036; &#x20E3;",$text);
        $text = str_replace("\x31\xE2\x83\xA3","&#x0031; &#x20E3;",$text);
        $text = str_replace("\x30\xE2\x83\xA3","&#x0030; &#x20E3;",$text);
        $text = str_replace("\x32\xE2\x83\xA3","&#x0032; &#x20E3;",$text);
        $text = str_replace("\x33\xE2\x83\xA3","&#x0033; &#x20E3;",$text);
        $text = str_replace("\x35\xE2\x83\xA3","&#x0035; &#x20E3;",$text);
        $text = str_replace("\x34\xE2\x83\xA3","&#x0034; &#x20E3;",$text);
        $text = str_replace("\x23\xE2\x83\xA3","&#x0023; &#x20E3;",$text);
        $text = str_replace("\xE2\x84\xA2","&#x2122;",$text);
        $text = str_replace("\xE2\x84\xB9","&#x2139;",$text);
        $text = str_replace("\xE2\x86\x94","&#x2194;",$text);
        $text = str_replace("\xE2\x86\x95","&#x2195;",$text);
        $text = str_replace("\xE2\x86\x96","&#x2196;",$text);
        $text = str_replace("\xE2\x86\x97","&#x2197;",$text);
        $text = str_replace("\xE2\x86\x98","&#x2198;",$text);
        $text = str_replace("\xE2\x86\x99","&#x2199;",$text);
        $text = str_replace("\xE2\x86\xA9","&#x21A9;",$text);
        $text = str_replace("\xE2\x86\xAA","&#x21AA;",$text);
        $text = str_replace("\xE2\x8C\x9A","&#x231A;",$text);
        $text = str_replace("\xE2\x8C\x9B","&#x231B;",$text);
        $text = str_replace("\xE2\x8F\xA9","&#x23E9;",$text);
        $text = str_replace("\xE2\x8F\xAA","&#x23EA;",$text);
        $text = str_replace("\xE2\x8F\xAB","&#x23EB;",$text);
        $text = str_replace("\xE2\x8F\xAC","&#x23EC;",$text);
        $text = str_replace("\xE2\x8F\xB0","&#x23F0;",$text);
        $text = str_replace("\xE2\x8F\xB3","&#x23F3;",$text);
        $text = str_replace("\xE2\x96\xAA","&#x25AA;",$text);
        $text = str_replace("\xE2\x96\xAB","&#x25AB;",$text);
        $text = str_replace("\xE2\x96\xB6","&#x25B6;",$text);
        $text = str_replace("\xE2\x97\x80","&#x25C0;",$text);
        $text = str_replace("\xE2\x97\xBB","&#x25FB;",$text);
        $text = str_replace("\xE2\x97\xBC","&#x25FC;",$text);
        $text = str_replace("\xE2\x97\xBD","&#x25FD;",$text);
        $text = str_replace("\xE2\x97\xBE","&#x25FE;",$text);
        $text = str_replace("\xE2\x98\x80","&#x2600;",$text);
        $text = str_replace("\xE2\x98\x81","&#x2601;",$text);
        $text = str_replace("\xE2\x98\x8E","&#x260E;",$text);
        $text = str_replace("\xE2\x98\x91","&#x2611;",$text);
        $text = str_replace("\xE2\x98\x94","&#x2614;",$text);
        $text = str_replace("\xE2\x98\x95","&#x2615;",$text);
        $text = str_replace("\xE2\x98\x9D","&#x261D;",$text);
        $text = str_replace("\xE2\x98\xBA","&#x263A;",$text);
        $text = str_replace("\xE2\x99\x88","&#x2648;",$text);
        $text = str_replace("\xE2\x99\x89","&#x2649;",$text);
        $text = str_replace("\xE2\x99\x8A","&#x264A;",$text);
        $text = str_replace("\xE2\x99\x8B","&#x264B;",$text);
        $text = str_replace("\xE2\x99\x8C","&#x264C;",$text);
        $text = str_replace("\xE2\x99\x8D","&#x264D;",$text);
        $text = str_replace("\xE2\x99\x8E","&#x264E;",$text);
        $text = str_replace("\xE2\x99\x8F","&#x264F;",$text);
        $text = str_replace("\xE2\x99\x90","&#x2650;",$text);
        $text = str_replace("\xE2\x99\x91","&#x2651;",$text);
        $text = str_replace("\xE2\x99\x92","&#x2652;",$text);
        $text = str_replace("\xE2\x99\x93","&#x2653;",$text);
        $text = str_replace("\xE2\x99\xA0","&#x2660;",$text);
        $text = str_replace("\xE2\x99\xA3","&#x2663;",$text);
        $text = str_replace("\xE2\x99\xA5","&#x2665;",$text);
        $text = str_replace("\xE2\x99\xA6","&#x2666;",$text);
        $text = str_replace("\xE2\x99\xA8","&#x2668;",$text);
        $text = str_replace("\xE2\x99\xBB","&#x267B;",$text);
        $text = str_replace("\xE2\x99\xBF","&#x267F;",$text);
        $text = str_replace("\xE2\x9A\x93","&#x2693;",$text);
        $text = str_replace("\xE2\x9A\xA0","&#x26A0;",$text);
        $text = str_replace("\xE2\x9A\xA1","&#x26A1;",$text);
        $text = str_replace("\xE2\x9A\xAA","&#x26AA;",$text);
        $text = str_replace("\xE2\x9A\xAB","&#x26AB;",$text);
        $text = str_replace("\xE2\x9A\xBD","&#x26BD;",$text);
        $text = str_replace("\xE2\x9A\xBE","&#x26BE;",$text);
        $text = str_replace("\xE2\x9B\x84","&#x26C4;",$text);
        $text = str_replace("\xE2\x9B\x85","&#x26C5;",$text);
        $text = str_replace("\xE2\x9B\x8E","&#x26CE;",$text);
        $text = str_replace("\xE2\x9B\x94","&#x26D4;",$text);
        $text = str_replace("\xE2\x9B\xAA","&#x26EA;",$text);
        $text = str_replace("\xE2\x9B\xB2","&#x26F2;",$text);
        $text = str_replace("\xE2\x9B\xB3","&#x26F3;",$text);
        $text = str_replace("\xE2\x9B\xB5","&#x26F5;",$text);
        $text = str_replace("\xE2\x9B\xBA","&#x26FA;",$text);
        $text = str_replace("\xE2\x9B\xBD","&#x26FD;",$text);
        $text = str_replace("\xE2\xA4\xB4","&#x2934;",$text);
        $text = str_replace("\xE2\xA4\xB5","&#x2935;",$text);
        $text = str_replace("\xE2\xAC\x85","&#x2B05;",$text);
        $text = str_replace("\xE2\xAC\x86","&#x2B06;",$text);
        $text = str_replace("\xE2\xAC\x87","&#x2B07;",$text);
        $text = str_replace("\xE2\xAC\x9B","&#x2B1B;",$text);
        $text = str_replace("\xE2\xAC\x9C","&#x2B1C;",$text);
        $text = str_replace("\xE2\xAD\x90","&#x2B50;",$text);
        $text = str_replace("\xE2\xAD\x95","&#x2B55;",$text);
        $text = str_replace("\xE3\x80\xB0","&#x3030;",$text);
        $text = str_replace("\xE3\x80\xBD","&#x303D;",$text);
        $text = str_replace("\xE3\x8A\x97","&#x3297;",$text);
        $text = str_replace("\xE3\x8A\x99","&#x3299;",$text);
        $text = str_replace("\xF0\x9F\x80\x84","&#x1F004;",$text);
        $text = str_replace("\xF0\x9F\x83\x8F","&#x1F0CF;",$text);
        $text = str_replace("\xF0\x9F\x8C\x80","&#x1F300;",$text);
        $text = str_replace("\xF0\x9F\x8C\x81","&#x1F301;",$text);
        $text = str_replace("\xF0\x9F\x8C\x82","&#x1F302;",$text);
        $text = str_replace("\xF0\x9F\x8C\x83","&#x1F303;",$text);
        $text = str_replace("\xF0\x9F\x8C\x84","&#x1F304;",$text);
        $text = str_replace("\xF0\x9F\x8C\x85","&#x1F305;",$text);
        $text = str_replace("\xF0\x9F\x8C\x86","&#x1F306;",$text);
        $text = str_replace("\xF0\x9F\x8C\x87","&#x1F307;",$text);
        $text = str_replace("\xF0\x9F\x8C\x88","&#x1F308;",$text);
        $text = str_replace("\xF0\x9F\x8C\x89","&#x1F309;",$text);
        $text = str_replace("\xF0\x9F\x8C\x8A","&#x1F30A;",$text);
        $text = str_replace("\xF0\x9F\x8C\x8B","&#x1F30B;",$text);
        $text = str_replace("\xF0\x9F\x8C\x8C","&#x1F30C;",$text);
        $text = str_replace("\xF0\x9F\x8C\x8F","&#x1F30F;",$text);
        $text = str_replace("\xF0\x9F\x8C\x91","&#x1F311;",$text);
        $text = str_replace("\xF0\x9F\x8C\x93","&#x1F313;",$text);
        $text = str_replace("\xF0\x9F\x8C\x94","&#x1F314;",$text);
        $text = str_replace("\xF0\x9F\x8C\x95","&#x1F315;",$text);
        $text = str_replace("\xF0\x9F\x8C\x99","&#x1F319;",$text);
        $text = str_replace("\xF0\x9F\x8C\x9B","&#x1F31B;",$text);
        $text = str_replace("\xF0\x9F\x8C\x9F","&#x1F31F;",$text);
        $text = str_replace("\xF0\x9F\x8C\xA0","&#x1F320;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB0","&#x1F330;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB1","&#x1F331;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB4","&#x1F334;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB5","&#x1F335;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB7","&#x1F337;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB8","&#x1F338;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB9","&#x1F339;",$text);
        $text = str_replace("\xF0\x9F\x8C\xBA","&#x1F33A;",$text);
        $text = str_replace("\xF0\x9F\x8C\xBB","&#x1F33B;",$text);
        $text = str_replace("\xF0\x9F\x8C\xBC","&#x1F33C;",$text);
        $text = str_replace("\xF0\x9F\x8C\xBD","&#x1F33D;",$text);
        $text = str_replace("\xF0\x9F\x8C\xBE","&#x1F33E;",$text);
        $text = str_replace("\xF0\x9F\x8C\xBF","&#x1F33F;",$text);
        $text = str_replace("\xF0\x9F\x8D\x80","&#x1F340;",$text);
        $text = str_replace("\xF0\x9F\x8D\x81","&#x1F341;",$text);
        $text = str_replace("\xF0\x9F\x8D\x82","&#x1F342;",$text);
        $text = str_replace("\xF0\x9F\x8D\x83","&#x1F343;",$text);
        $text = str_replace("\xF0\x9F\x8D\x84","&#x1F344;",$text);
        $text = str_replace("\xF0\x9F\x8D\x85","&#x1F345;",$text);
        $text = str_replace("\xF0\x9F\x8D\x86","&#x1F346;",$text);
        $text = str_replace("\xF0\x9F\x8D\x87","&#x1F347;",$text);
        $text = str_replace("\xF0\x9F\x8D\x88","&#x1F348;",$text);
        $text = str_replace("\xF0\x9F\x8D\x89","&#x1F349;",$text);
        $text = str_replace("\xF0\x9F\x8D\x8A","&#x1F34A;",$text);
        $text = str_replace("\xF0\x9F\x8D\x8C","&#x1F34C;",$text);
        $text = str_replace("\xF0\x9F\x8D\x8D","&#x1F34D;",$text);
        $text = str_replace("\xF0\x9F\x8D\x8E","&#x1F34E;",$text);
        $text = str_replace("\xF0\x9F\x8D\x8F","&#x1F34F;",$text);
        $text = str_replace("\xF0\x9F\x8D\x91","&#x1F351;",$text);
        $text = str_replace("\xF0\x9F\x8D\x92","&#x1F352;",$text);
        $text = str_replace("\xF0\x9F\x8D\x93","&#x1F353;",$text);
        $text = str_replace("\xF0\x9F\x8D\x94","&#x1F354;",$text);
        $text = str_replace("\xF0\x9F\x8D\x95","&#x1F355;",$text);
        $text = str_replace("\xF0\x9F\x8D\x96","&#x1F356;",$text);
        $text = str_replace("\xF0\x9F\x8D\x97","&#x1F357;",$text);
        $text = str_replace("\xF0\x9F\x8D\x98","&#x1F358;",$text);
        $text = str_replace("\xF0\x9F\x8D\x99","&#x1F359;",$text);
        $text = str_replace("\xF0\x9F\x8D\x9A","&#x1F35A;",$text);
        $text = str_replace("\xF0\x9F\x8D\x9B","&#x1F35B;",$text);
        $text = str_replace("\xF0\x9F\x8D\x9C","&#x1F35C;",$text);
        $text = str_replace("\xF0\x9F\x8D\x9D","&#x1F35D;",$text);
        $text = str_replace("\xF0\x9F\x8D\x9E","&#x1F35E;",$text);
        $text = str_replace("\xF0\x9F\x8D\x9F","&#x1F35F;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA0","&#x1F360;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA1","&#x1F361;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA2","&#x1F362;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA3","&#x1F363;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA4","&#x1F364;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA5","&#x1F365;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA6","&#x1F366;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA7","&#x1F367;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA8","&#x1F368;",$text);
        $text = str_replace("\xF0\x9F\x8D\xA9","&#x1F369;",$text);
        $text = str_replace("\xF0\x9F\x8D\xAA","&#x1F36A;",$text);
        $text = str_replace("\xF0\x9F\x8D\xAB","&#x1F36B;",$text);
        $text = str_replace("\xF0\x9F\x8D\xAC","&#x1F36C;",$text);
        $text = str_replace("\xF0\x9F\x8D\xAD","&#x1F36D;",$text);
        $text = str_replace("\xF0\x9F\x8D\xAE","&#x1F36E;",$text);
        $text = str_replace("\xF0\x9F\x8D\xAF","&#x1F36F;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB0","&#x1F370;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB1","&#x1F371;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB2","&#x1F372;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB3","&#x1F373;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB4","&#x1F374;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB5","&#x1F375;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB6","&#x1F376;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB7","&#x1F377;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB8","&#x1F378;",$text);
        $text = str_replace("\xF0\x9F\x8D\xB9","&#x1F379;",$text);
        $text = str_replace("\xF0\x9F\x8D\xBA","&#x1F37A;",$text);
        $text = str_replace("\xF0\x9F\x8D\xBB","&#x1F37B;",$text);
        $text = str_replace("\xF0\x9F\x8E\x80","&#x1F380;",$text);
        $text = str_replace("\xF0\x9F\x8E\x81","&#x1F381;",$text);
        $text = str_replace("\xF0\x9F\x8E\x82","&#x1F382;",$text);
        $text = str_replace("\xF0\x9F\x8E\x83","&#x1F383;",$text);
        $text = str_replace("\xF0\x9F\x8E\x84","&#x1F384;",$text);
        $text = str_replace("\xF0\x9F\x8E\x85","&#x1F385;",$text);
        $text = str_replace("\xF0\x9F\x8E\x86","&#x1F386;",$text);
        $text = str_replace("\xF0\x9F\x8E\x87","&#x1F387;",$text);
        $text = str_replace("\xF0\x9F\x8E\x88","&#x1F388;",$text);
        $text = str_replace("\xF0\x9F\x8E\x89","&#x1F389;",$text);
        $text = str_replace("\xF0\x9F\x8E\x8A","&#x1F38A;",$text);
        $text = str_replace("\xF0\x9F\x8E\x8B","&#x1F38B;",$text);
        $text = str_replace("\xF0\x9F\x8E\x8C","&#x1F38C;",$text);
        $text = str_replace("\xF0\x9F\x8E\x8D","&#x1F38D;",$text);
        $text = str_replace("\xF0\x9F\x8E\x8E","&#x1F38E;",$text);
        $text = str_replace("\xF0\x9F\x8E\x8F","&#x1F38F;",$text);
        $text = str_replace("\xF0\x9F\x8E\x90","&#x1F390;",$text);
        $text = str_replace("\xF0\x9F\x8E\x91","&#x1F391;",$text);
        $text = str_replace("\xF0\x9F\x8E\x92","&#x1F392;",$text);
        $text = str_replace("\xF0\x9F\x8E\x93","&#x1F393;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA0","&#x1F3A0;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA1","&#x1F3A1;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA2","&#x1F3A2;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA3","&#x1F3A3;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA4","&#x1F3A4;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA5","&#x1F3A5;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA6","&#x1F3A6;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA7","&#x1F3A7;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA8","&#x1F3A8;",$text);
        $text = str_replace("\xF0\x9F\x8E\xA9","&#x1F3A9;",$text);
        $text = str_replace("\xF0\x9F\x8E\xAA","&#x1F3AA;",$text);
        $text = str_replace("\xF0\x9F\x8E\xAB","&#x1F3AB;",$text);
        $text = str_replace("\xF0\x9F\x8E\xAC","&#x1F3AC;",$text);
        $text = str_replace("\xF0\x9F\x8E\xAD","&#x1F3AD;",$text);
        $text = str_replace("\xF0\x9F\x8E\xAE","&#x1F3AE;",$text);
        $text = str_replace("\xF0\x9F\x8E\xAF","&#x1F3AF;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB0","&#x1F3B0;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB1","&#x1F3B1;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB2","&#x1F3B2;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB3","&#x1F3B3;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB4","&#x1F3B4;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB5","&#x1F3B5;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB6","&#x1F3B6;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB7","&#x1F3B7;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB8","&#x1F3B8;",$text);
        $text = str_replace("\xF0\x9F\x8E\xB9","&#x1F3B9;",$text);
        $text = str_replace("\xF0\x9F\x8E\xBA","&#x1F3BA;",$text);
        $text = str_replace("\xF0\x9F\x8E\xBB","&#x1F3BB;",$text);
        $text = str_replace("\xF0\x9F\x8E\xBC","&#x1F3BC;",$text);
        $text = str_replace("\xF0\x9F\x8E\xBD","&#x1F3BD;",$text);
        $text = str_replace("\xF0\x9F\x8E\xBE","&#x1F3BE;",$text);
        $text = str_replace("\xF0\x9F\x8E\xBF","&#x1F3BF;",$text);
        $text = str_replace("\xF0\x9F\x8F\x80","&#x1F3C0;",$text);
        $text = str_replace("\xF0\x9F\x8F\x81","&#x1F3C1;",$text);
        $text = str_replace("\xF0\x9F\x8F\x82","&#x1F3C2;",$text);
        $text = str_replace("\xF0\x9F\x8F\x83","&#x1F3C3;",$text);
        $text = str_replace("\xF0\x9F\x8F\x84","&#x1F3C4;",$text);
        $text = str_replace("\xF0\x9F\x8F\x86","&#x1F3C6;",$text);
        $text = str_replace("\xF0\x9F\x8F\x88","&#x1F3C8;",$text);
        $text = str_replace("\xF0\x9F\x8F\x8A","&#x1F3CA;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA0","&#x1F3E0;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA1","&#x1F3E1;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA2","&#x1F3E2;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA3","&#x1F3E3;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA5","&#x1F3E5;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA6","&#x1F3E6;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA7","&#x1F3E7;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA8","&#x1F3E8;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA9","&#x1F3E9;",$text);
        $text = str_replace("\xF0\x9F\x8F\xAA","&#x1F3EA;",$text);
        $text = str_replace("\xF0\x9F\x8F\xAB","&#x1F3EB;",$text);
        $text = str_replace("\xF0\x9F\x8F\xAC","&#x1F3EC;",$text);
        $text = str_replace("\xF0\x9F\x8F\xAD","&#x1F3ED;",$text);
        $text = str_replace("\xF0\x9F\x8F\xAE","&#x1F3EE;",$text);
        $text = str_replace("\xF0\x9F\x8F\xAF","&#x1F3EF;",$text);
        $text = str_replace("\xF0\x9F\x8F\xB0","&#x1F3F0;",$text);
        $text = str_replace("\xF0\x9F\x90\x8C","&#x1F40C;",$text);
        $text = str_replace("\xF0\x9F\x90\x8D","&#x1F40D;",$text);
        $text = str_replace("\xF0\x9F\x90\x8E","&#x1F40E;",$text);
        $text = str_replace("\xF0\x9F\x90\x91","&#x1F411;",$text);
        $text = str_replace("\xF0\x9F\x90\x92","&#x1F412;",$text);
        $text = str_replace("\xF0\x9F\x90\x94","&#x1F414;",$text);
        $text = str_replace("\xF0\x9F\x90\x97","&#x1F417;",$text);
        $text = str_replace("\xF0\x9F\x90\x98","&#x1F418;",$text);
        $text = str_replace("\xF0\x9F\x90\x99","&#x1F419;",$text);
        $text = str_replace("\xF0\x9F\x90\x9A","&#x1F41A;",$text);
        $text = str_replace("\xF0\x9F\x90\x9B","&#x1F41B;",$text);
        $text = str_replace("\xF0\x9F\x90\x9C","&#x1F41C;",$text);
        $text = str_replace("\xF0\x9F\x90\x9D","&#x1F41D;",$text);
        $text = str_replace("\xF0\x9F\x90\x9E","&#x1F41E;",$text);
        $text = str_replace("\xF0\x9F\x90\x9F","&#x1F41F;",$text);
        $text = str_replace("\xF0\x9F\x90\xA0","&#x1F420;",$text);
        $text = str_replace("\xF0\x9F\x90\xA1","&#x1F421;",$text);
        $text = str_replace("\xF0\x9F\x90\xA2","&#x1F422;",$text);
        $text = str_replace("\xF0\x9F\x90\xA3","&#x1F423;",$text);
        $text = str_replace("\xF0\x9F\x90\xA4","&#x1F424;",$text);
        $text = str_replace("\xF0\x9F\x90\xA5","&#x1F425;",$text);
        $text = str_replace("\xF0\x9F\x90\xA6","&#x1F426;",$text);
        $text = str_replace("\xF0\x9F\x90\xA7","&#x1F427;",$text);
        $text = str_replace("\xF0\x9F\x90\xA8","&#x1F428;",$text);
        $text = str_replace("\xF0\x9F\x90\xA9","&#x1F429;",$text);
        $text = str_replace("\xF0\x9F\x90\xAB","&#x1F42B;",$text);
        $text = str_replace("\xF0\x9F\x90\xAC","&#x1F42C;",$text);
        $text = str_replace("\xF0\x9F\x90\xAD","&#x1F42D;",$text);
        $text = str_replace("\xF0\x9F\x90\xAE","&#x1F42E;",$text);
        $text = str_replace("\xF0\x9F\x90\xAF","&#x1F42F;",$text);
        $text = str_replace("\xF0\x9F\x90\xB0","&#x1F430;",$text);
        $text = str_replace("\xF0\x9F\x90\xB1","&#x1F431;",$text);
        $text = str_replace("\xF0\x9F\x90\xB2","&#x1F432;",$text);
        $text = str_replace("\xF0\x9F\x90\xB3","&#x1F433;",$text);
        $text = str_replace("\xF0\x9F\x90\xB4","&#x1F434;",$text);
        $text = str_replace("\xF0\x9F\x90\xB5","&#x1F435;",$text);
        $text = str_replace("\xF0\x9F\x90\xB6","&#x1F436;",$text);
        $text = str_replace("\xF0\x9F\x90\xB7","&#x1F437;",$text);
        $text = str_replace("\xF0\x9F\x90\xB8","&#x1F438;",$text);
        $text = str_replace("\xF0\x9F\x90\xB9","&#x1F439;",$text);
        $text = str_replace("\xF0\x9F\x90\xBA","&#x1F43A;",$text);
        $text = str_replace("\xF0\x9F\x90\xBB","&#x1F43B;",$text);
        $text = str_replace("\xF0\x9F\x90\xBC","&#x1F43C;",$text);
        $text = str_replace("\xF0\x9F\x90\xBD","&#x1F43D;",$text);
        $text = str_replace("\xF0\x9F\x90\xBE","&#x1F43E;",$text);
        $text = str_replace("\xF0\x9F\x91\x80","&#x1F440;",$text);
        $text = str_replace("\xF0\x9F\x91\x82","&#x1F442;",$text);
        $text = str_replace("\xF0\x9F\x91\x83","&#x1F443;",$text);
        $text = str_replace("\xF0\x9F\x91\x84","&#x1F444;",$text);
        $text = str_replace("\xF0\x9F\x91\x85","&#x1F445;",$text);
        $text = str_replace("\xF0\x9F\x91\x86","&#x1F446;",$text);
        $text = str_replace("\xF0\x9F\x91\x87","&#x1F447;",$text);
        $text = str_replace("\xF0\x9F\x91\x88","&#x1F448;",$text);
        $text = str_replace("\xF0\x9F\x91\x89","&#x1F449;",$text);
        $text = str_replace("\xF0\x9F\x91\x8A","&#x1F44A;",$text);
        $text = str_replace("\xF0\x9F\x91\x8B","&#x1F44B;",$text);
        $text = str_replace("\xF0\x9F\x91\x8C","&#x1F44C;",$text);
        $text = str_replace("\xF0\x9F\x91\x8D","&#x1F44D;",$text);
        $text = str_replace("\xF0\x9F\x91\x8E","&#x1F44E;",$text);
        $text = str_replace("\xF0\x9F\x91\x8F","&#x1F44F;",$text);
        $text = str_replace("\xF0\x9F\x91\x90","&#x1F450;",$text);
        $text = str_replace("\xF0\x9F\x91\x91","&#x1F451;",$text);
        $text = str_replace("\xF0\x9F\x91\x92","&#x1F452;",$text);
        $text = str_replace("\xF0\x9F\x91\x93","&#x1F453;",$text);
        $text = str_replace("\xF0\x9F\x91\x94","&#x1F454;",$text);
        $text = str_replace("\xF0\x9F\x91\x95","&#x1F455;",$text);
        $text = str_replace("\xF0\x9F\x91\x96","&#x1F456;",$text);
        $text = str_replace("\xF0\x9F\x91\x97","&#x1F457;",$text);
        $text = str_replace("\xF0\x9F\x91\x98","&#x1F458;",$text);
        $text = str_replace("\xF0\x9F\x91\x99","&#x1F459;",$text);
        $text = str_replace("\xF0\x9F\x91\x9A","&#x1F45A;",$text);
        $text = str_replace("\xF0\x9F\x91\x9B","&#x1F45B;",$text);
        $text = str_replace("\xF0\x9F\x91\x9C","&#x1F45C;",$text);
        $text = str_replace("\xF0\x9F\x91\x9D","&#x1F45D;",$text);
        $text = str_replace("\xF0\x9F\x91\x9E","&#x1F45E;",$text);
        $text = str_replace("\xF0\x9F\x91\x9F","&#x1F45F;",$text);
        $text = str_replace("\xF0\x9F\x91\xA0","&#x1F460;",$text);
        $text = str_replace("\xF0\x9F\x91\xA1","&#x1F461;",$text);
        $text = str_replace("\xF0\x9F\x91\xA2","&#x1F462;",$text);
        $text = str_replace("\xF0\x9F\x91\xA3","&#x1F463;",$text);
        $text = str_replace("\xF0\x9F\x91\xA4","&#x1F464;",$text);
        $text = str_replace("\xF0\x9F\x91\xA6","&#x1F466;",$text);
        $text = str_replace("\xF0\x9F\x91\xA7","&#x1F467;",$text);
        $text = str_replace("\xF0\x9F\x91\xA8","&#x1F468;",$text);
        $text = str_replace("\xF0\x9F\x91\xA9","&#x1F469;",$text);
        $text = str_replace("\xF0\x9F\x91\xAA","&#x1F46A;",$text);
        $text = str_replace("\xF0\x9F\x91\xAB","&#x1F46B;",$text);
        $text = str_replace("\xF0\x9F\x91\xAE","&#x1F46E;",$text);
        $text = str_replace("\xF0\x9F\x91\xAF","&#x1F46F;",$text);
        $text = str_replace("\xF0\x9F\x91\xB0","&#x1F470;",$text);
        $text = str_replace("\xF0\x9F\x91\xB1","&#x1F471;",$text);
        $text = str_replace("\xF0\x9F\x91\xB2","&#x1F472;",$text);
        $text = str_replace("\xF0\x9F\x91\xB3","&#x1F473;",$text);
        $text = str_replace("\xF0\x9F\x91\xB4","&#x1F474;",$text);
        $text = str_replace("\xF0\x9F\x91\xB5","&#x1F475;",$text);
        $text = str_replace("\xF0\x9F\x91\xB6","&#x1F476;",$text);
        $text = str_replace("\xF0\x9F\x91\xB7","&#x1F477;",$text);
        $text = str_replace("\xF0\x9F\x91\xB8","&#x1F478;",$text);
        $text = str_replace("\xF0\x9F\x91\xB9","&#x1F479;",$text);
        $text = str_replace("\xF0\x9F\x91\xBA","&#x1F47A;",$text);
        $text = str_replace("\xF0\x9F\x91\xBB","&#x1F47B;",$text);
        $text = str_replace("\xF0\x9F\x91\xBC","&#x1F47C;",$text);
        $text = str_replace("\xF0\x9F\x91\xBD","&#x1F47D;",$text);
        $text = str_replace("\xF0\x9F\x91\xBE","&#x1F47E;",$text);
        $text = str_replace("\xF0\x9F\x91\xBF","&#x1F47F;",$text);
        $text = str_replace("\xF0\x9F\x92\x80","&#x1F480;",$text);
        $text = str_replace("\xF0\x9F\x92\x81","&#x1F481;",$text);
        $text = str_replace("\xF0\x9F\x92\x82","&#x1F482;",$text);
        $text = str_replace("\xF0\x9F\x92\x83","&#x1F483;",$text);
        $text = str_replace("\xF0\x9F\x92\x84","&#x1F484;",$text);
        $text = str_replace("\xF0\x9F\x92\x85","&#x1F485;",$text);
        $text = str_replace("\xF0\x9F\x92\x86","&#x1F486;",$text);
        $text = str_replace("\xF0\x9F\x92\x87","&#x1F487;",$text);
        $text = str_replace("\xF0\x9F\x92\x88","&#x1F488;",$text);
        $text = str_replace("\xF0\x9F\x92\x89","&#x1F489;",$text);
        $text = str_replace("\xF0\x9F\x92\x8A","&#x1F48A;",$text);
        $text = str_replace("\xF0\x9F\x92\x8B","&#x1F48B;",$text);
        $text = str_replace("\xF0\x9F\x92\x8C","&#x1F48C;",$text);
        $text = str_replace("\xF0\x9F\x92\x8D","&#x1F48D;",$text);
        $text = str_replace("\xF0\x9F\x92\x8E","&#x1F48E;",$text);
        $text = str_replace("\xF0\x9F\x92\x8F","&#x1F48F;",$text);
        $text = str_replace("\xF0\x9F\x92\x90","&#x1F490;",$text);
        $text = str_replace("\xF0\x9F\x92\x91","&#x1F491;",$text);
        $text = str_replace("\xF0\x9F\x92\x92","&#x1F492;",$text);
        $text = str_replace("\xF0\x9F\x92\x93","&#x1F493;",$text);
        $text = str_replace("\xF0\x9F\x92\x94","&#x1F494;",$text);
        $text = str_replace("\xF0\x9F\x92\x95","&#x1F495;",$text);
        $text = str_replace("\xF0\x9F\x92\x96","&#x1F496;",$text);
        $text = str_replace("\xF0\x9F\x92\x97","&#x1F497;",$text);
        $text = str_replace("\xF0\x9F\x92\x98","&#x1F498;",$text);
        $text = str_replace("\xF0\x9F\x92\x99","&#x1F499;",$text);
        $text = str_replace("\xF0\x9F\x92\x9A","&#x1F49A;",$text);
        $text = str_replace("\xF0\x9F\x92\x9B","&#x1F49B;",$text);
        $text = str_replace("\xF0\x9F\x92\x9C","&#x1F49C;",$text);
        $text = str_replace("\xF0\x9F\x92\x9D","&#x1F49D;",$text);
        $text = str_replace("\xF0\x9F\x92\x9E","&#x1F49E;",$text);
        $text = str_replace("\xF0\x9F\x92\x9F","&#x1F49F;",$text);
        $text = str_replace("\xF0\x9F\x92\xA0","&#x1F4A0;",$text);
        $text = str_replace("\xF0\x9F\x92\xA1","&#x1F4A1;",$text);
        $text = str_replace("\xF0\x9F\x92\xA2","&#x1F4A2;",$text);
        $text = str_replace("\xF0\x9F\x92\xA3","&#x1F4A3;",$text);
        $text = str_replace("\xF0\x9F\x92\xA4","&#x1F4A4;",$text);
        $text = str_replace("\xF0\x9F\x92\xA5","&#x1F4A5;",$text);
        $text = str_replace("\xF0\x9F\x92\xA6","&#x1F4A6;",$text);
        $text = str_replace("\xF0\x9F\x92\xA7","&#x1F4A7;",$text);
        $text = str_replace("\xF0\x9F\x92\xA8","&#x1F4A8;",$text);
        $text = str_replace("\xF0\x9F\x92\xA9","&#x1F4A9;",$text);
        $text = str_replace("\xF0\x9F\x92\xAA","&#x1F4AA;",$text);
        $text = str_replace("\xF0\x9F\x92\xAB","&#x1F4AB;",$text);
        $text = str_replace("\xF0\x9F\x92\xAC","&#x1F4AC;",$text);
        $text = str_replace("\xF0\x9F\x92\xAE","&#x1F4AE;",$text);
        $text = str_replace("\xF0\x9F\x92\xAF","&#x1F4AF;",$text);
        $text = str_replace("\xF0\x9F\x92\xB0","&#x1F4B0;",$text);
        $text = str_replace("\xF0\x9F\x92\xB1","&#x1F4B1;",$text);
        $text = str_replace("\xF0\x9F\x92\xB2","&#x1F4B2;",$text);
        $text = str_replace("\xF0\x9F\x92\xB3","&#x1F4B3;",$text);
        $text = str_replace("\xF0\x9F\x92\xB4","&#x1F4B4;",$text);
        $text = str_replace("\xF0\x9F\x92\xB5","&#x1F4B5;",$text);
        $text = str_replace("\xF0\x9F\x92\xB8","&#x1F4B8;",$text);
        $text = str_replace("\xF0\x9F\x92\xB9","&#x1F4B9;",$text);
        $text = str_replace("\xF0\x9F\x92\xBA","&#x1F4BA;",$text);
        $text = str_replace("\xF0\x9F\x92\xBB","&#x1F4BB;",$text);
        $text = str_replace("\xF0\x9F\x92\xBC","&#x1F4BC;",$text);
        $text = str_replace("\xF0\x9F\x92\xBD","&#x1F4BD;",$text);
        $text = str_replace("\xF0\x9F\x92\xBE","&#x1F4BE;",$text);
        $text = str_replace("\xF0\x9F\x92\xBF","&#x1F4BF;",$text);
        $text = str_replace("\xF0\x9F\x93\x80","&#x1F4C0;",$text);
        $text = str_replace("\xF0\x9F\x93\x81","&#x1F4C1;",$text);
        $text = str_replace("\xF0\x9F\x93\x82","&#x1F4C2;",$text);
        $text = str_replace("\xF0\x9F\x93\x83","&#x1F4C3;",$text);
        $text = str_replace("\xF0\x9F\x93\x84","&#x1F4C4;",$text);
        $text = str_replace("\xF0\x9F\x93\x85","&#x1F4C5;",$text);
        $text = str_replace("\xF0\x9F\x93\x86","&#x1F4C6;",$text);
        $text = str_replace("\xF0\x9F\x93\x87","&#x1F4C7;",$text);
        $text = str_replace("\xF0\x9F\x93\x88","&#x1F4C8;",$text);
        $text = str_replace("\xF0\x9F\x93\x89","&#x1F4C9;",$text);
        $text = str_replace("\xF0\x9F\x93\x8A","&#x1F4CA;",$text);
        $text = str_replace("\xF0\x9F\x93\x8B","&#x1F4CB;",$text);
        $text = str_replace("\xF0\x9F\x93\x8C","&#x1F4CC;",$text);
        $text = str_replace("\xF0\x9F\x93\x8D","&#x1F4CD;",$text);
        $text = str_replace("\xF0\x9F\x93\x8E","&#x1F4CE;",$text);
        $text = str_replace("\xF0\x9F\x93\x8F","&#x1F4CF;",$text);
        $text = str_replace("\xF0\x9F\x93\x90","&#x1F4D0;",$text);
        $text = str_replace("\xF0\x9F\x93\x91","&#x1F4D1;",$text);
        $text = str_replace("\xF0\x9F\x93\x92","&#x1F4D2;",$text);
        $text = str_replace("\xF0\x9F\x93\x93","&#x1F4D3;",$text);
        $text = str_replace("\xF0\x9F\x93\x94","&#x1F4D4;",$text);
        $text = str_replace("\xF0\x9F\x93\x95","&#x1F4D5;",$text);
        $text = str_replace("\xF0\x9F\x93\x96","&#x1F4D6;",$text);
        $text = str_replace("\xF0\x9F\x93\x97","&#x1F4D7;",$text);
        $text = str_replace("\xF0\x9F\x93\x98","&#x1F4D8;",$text);
        $text = str_replace("\xF0\x9F\x93\x99","&#x1F4D9;",$text);
        $text = str_replace("\xF0\x9F\x93\x9A","&#x1F4DA;",$text);
        $text = str_replace("\xF0\x9F\x93\x9B","&#x1F4DB;",$text);
        $text = str_replace("\xF0\x9F\x93\x9C","&#x1F4DC;",$text);
        $text = str_replace("\xF0\x9F\x93\x9D","&#x1F4DD;",$text);
        $text = str_replace("\xF0\x9F\x93\x9E","&#x1F4DE;",$text);
        $text = str_replace("\xF0\x9F\x93\x9F","&#x1F4DF;",$text);
        $text = str_replace("\xF0\x9F\x93\xA0","&#x1F4E0;",$text);
        $text = str_replace("\xF0\x9F\x93\xA1","&#x1F4E1;",$text);
        $text = str_replace("\xF0\x9F\x93\xA2","&#x1F4E2;",$text);
        $text = str_replace("\xF0\x9F\x93\xA3","&#x1F4E3;",$text);
        $text = str_replace("\xF0\x9F\x93\xA4","&#x1F4E4;",$text);
        $text = str_replace("\xF0\x9F\x93\xA5","&#x1F4E5;",$text);
        $text = str_replace("\xF0\x9F\x93\xA6","&#x1F4E6;",$text);
        $text = str_replace("\xF0\x9F\x93\xA7","&#x1F4E7;",$text);
        $text = str_replace("\xF0\x9F\x93\xA8","&#x1F4E8;",$text);
        $text = str_replace("\xF0\x9F\x93\xA9","&#x1F4E9;",$text);
        $text = str_replace("\xF0\x9F\x93\xAA","&#x1F4EA;",$text);
        $text = str_replace("\xF0\x9F\x93\xAB","&#x1F4EB;",$text);
        $text = str_replace("\xF0\x9F\x93\xAE","&#x1F4EE;",$text);
        $text = str_replace("\xF0\x9F\x93\xB0","&#x1F4F0;",$text);
        $text = str_replace("\xF0\x9F\x93\xB1","&#x1F4F1;",$text);
        $text = str_replace("\xF0\x9F\x93\xB2","&#x1F4F2;",$text);
        $text = str_replace("\xF0\x9F\x93\xB3","&#x1F4F3;",$text);
        $text = str_replace("\xF0\x9F\x93\xB4","&#x1F4F4;",$text);
        $text = str_replace("\xF0\x9F\x93\xB6","&#x1F4F6;",$text);
        $text = str_replace("\xF0\x9F\x93\xB7","&#x1F4F7;",$text);
        $text = str_replace("\xF0\x9F\x93\xB9","&#x1F4F9;",$text);
        $text = str_replace("\xF0\x9F\x93\xBA","&#x1F4FA;",$text);
        $text = str_replace("\xF0\x9F\x93\xBB","&#x1F4FB;",$text);
        $text = str_replace("\xF0\x9F\x93\xBC","&#x1F4FC;",$text);
        $text = str_replace("\xF0\x9F\x94\x83","&#x1F503;",$text);
        $text = str_replace("\xF0\x9F\x94\x8A","&#x1F50A;",$text);
        $text = str_replace("\xF0\x9F\x94\x8B","&#x1F50B;",$text);
        $text = str_replace("\xF0\x9F\x94\x8C","&#x1F50C;",$text);
        $text = str_replace("\xF0\x9F\x94\x8D","&#x1F50D;",$text);
        $text = str_replace("\xF0\x9F\x94\x8E","&#x1F50E;",$text);
        $text = str_replace("\xF0\x9F\x94\x8F","&#x1F50F;",$text);
        $text = str_replace("\xF0\x9F\x94\x90","&#x1F510;",$text);
        $text = str_replace("\xF0\x9F\x94\x91","&#x1F511;",$text);
        $text = str_replace("\xF0\x9F\x94\x92","&#x1F512;",$text);
        $text = str_replace("\xF0\x9F\x94\x93","&#x1F513;",$text);
        $text = str_replace("\xF0\x9F\x94\x94","&#x1F514;",$text);
        $text = str_replace("\xF0\x9F\x94\x96","&#x1F516;",$text);
        $text = str_replace("\xF0\x9F\x94\x97","&#x1F517;",$text);
        $text = str_replace("\xF0\x9F\x94\x98","&#x1F518;",$text);
        $text = str_replace("\xF0\x9F\x94\x99","&#x1F519;",$text);
        $text = str_replace("\xF0\x9F\x94\x9A","&#x1F51A;",$text);
        $text = str_replace("\xF0\x9F\x94\x9B","&#x1F51B;",$text);
        $text = str_replace("\xF0\x9F\x94\x9C","&#x1F51C;",$text);
        $text = str_replace("\xF0\x9F\x94\x9D","&#x1F51D;",$text);
        $text = str_replace("\xF0\x9F\x94\x9E","&#x1F51E;",$text);
        $text = str_replace("\xF0\x9F\x94\x9F","&#x1F51F;",$text);
        $text = str_replace("\xF0\x9F\x94\xA0","&#x1F520;",$text);
        $text = str_replace("\xF0\x9F\x94\xA1","&#x1F521;",$text);
        $text = str_replace("\xF0\x9F\x94\xA2","&#x1F522;",$text);
        $text = str_replace("\xF0\x9F\x94\xA3","&#x1F523;",$text);
        $text = str_replace("\xF0\x9F\x94\xA4","&#x1F524;",$text);
        $text = str_replace("\xF0\x9F\x94\xA5","&#x1F525;",$text);
        $text = str_replace("\xF0\x9F\x94\xA6","&#x1F526;",$text);
        $text = str_replace("\xF0\x9F\x94\xA7","&#x1F527;",$text);
        $text = str_replace("\xF0\x9F\x94\xA8","&#x1F528;",$text);
        $text = str_replace("\xF0\x9F\x94\xA9","&#x1F529;",$text);
        $text = str_replace("\xF0\x9F\x94\xAA","&#x1F52A;",$text);
        $text = str_replace("\xF0\x9F\x94\xAB","&#x1F52B;",$text);
        $text = str_replace("\xF0\x9F\x94\xAE","&#x1F52E;",$text);
        $text = str_replace("\xF0\x9F\x94\xAF","&#x1F52F;",$text);
        $text = str_replace("\xF0\x9F\x94\xB0","&#x1F530;",$text);
        $text = str_replace("\xF0\x9F\x94\xB1","&#x1F531;",$text);
        $text = str_replace("\xF0\x9F\x94\xB2","&#x1F532;",$text);
        $text = str_replace("\xF0\x9F\x94\xB3","&#x1F533;",$text);
        $text = str_replace("\xF0\x9F\x94\xB4","&#x1F534;",$text);
        $text = str_replace("\xF0\x9F\x94\xB5","&#x1F535;",$text);
        $text = str_replace("\xF0\x9F\x94\xB6","&#x1F536;",$text);
        $text = str_replace("\xF0\x9F\x94\xB7","&#x1F537;",$text);
        $text = str_replace("\xF0\x9F\x94\xB8","&#x1F538;",$text);
        $text = str_replace("\xF0\x9F\x94\xB9","&#x1F539;",$text);
        $text = str_replace("\xF0\x9F\x94\xBA","&#x1F53A;",$text);
        $text = str_replace("\xF0\x9F\x94\xBB","&#x1F53B;",$text);
        $text = str_replace("\xF0\x9F\x94\xBC","&#x1F53C;",$text);
        $text = str_replace("\xF0\x9F\x94\xBD","&#x1F53D;",$text);
        $text = str_replace("\xF0\x9F\x95\x90","&#x1F550;",$text);
        $text = str_replace("\xF0\x9F\x95\x91","&#x1F551;",$text);
        $text = str_replace("\xF0\x9F\x95\x92","&#x1F552;",$text);
        $text = str_replace("\xF0\x9F\x95\x93","&#x1F553;",$text);
        $text = str_replace("\xF0\x9F\x95\x94","&#x1F554;",$text);
        $text = str_replace("\xF0\x9F\x95\x95","&#x1F555;",$text);
        $text = str_replace("\xF0\x9F\x95\x96","&#x1F556;",$text);
        $text = str_replace("\xF0\x9F\x95\x97","&#x1F557;",$text);
        $text = str_replace("\xF0\x9F\x95\x98","&#x1F558;",$text);
        $text = str_replace("\xF0\x9F\x95\x99","&#x1F559;",$text);
        $text = str_replace("\xF0\x9F\x95\x9A","&#x1F55A;",$text);
        $text = str_replace("\xF0\x9F\x95\x9B","&#x1F55B;",$text);
        $text = str_replace("\xF0\x9F\x97\xBB","&#x1F5FB;",$text);
        $text = str_replace("\xF0\x9F\x97\xBC","&#x1F5FC;",$text);
        $text = str_replace("\xF0\x9F\x97\xBD","&#x1F5FD;",$text);
        $text = str_replace("\xF0\x9F\x97\xBE","&#x1F5FE;",$text);
        $text = str_replace("\xF0\x9F\x97\xBF","&#x1F5FF;",$text);
        $text = str_replace("\xF0\x9F\x98\x80","&#x1F600;",$text);
        $text = str_replace("\xF0\x9F\x98\x87","&#x1F607;",$text);
        $text = str_replace("\xF0\x9F\x98\x88","&#x1F608;",$text);
        $text = str_replace("\xF0\x9F\x98\x8E","&#x1F60E;",$text);
        $text = str_replace("\xF0\x9F\x98\x90","&#x1F610;",$text);
        $text = str_replace("\xF0\x9F\x98\x91","&#x1F611;",$text);
        $text = str_replace("\xF0\x9F\x98\x95","&#x1F615;",$text);
        $text = str_replace("\xF0\x9F\x98\x97","&#x1F617;",$text);
        $text = str_replace("\xF0\x9F\x98\x99","&#x1F619;",$text);
        $text = str_replace("\xF0\x9F\x98\x9B","&#x1F61B;",$text);
        $text = str_replace("\xF0\x9F\x98\x9F","&#x1F61F;",$text);
        $text = str_replace("\xF0\x9F\x98\xA6","&#x1F626;",$text);
        $text = str_replace("\xF0\x9F\x98\xA7","&#x1F627;",$text);
        $text = str_replace("\xF0\x9F\x98\xAC","&#x1F62C;",$text);
        $text = str_replace("\xF0\x9F\x98\xAE","&#x1F62E;",$text);
        $text = str_replace("\xF0\x9F\x98\xAF","&#x1F62F;",$text);
        $text = str_replace("\xF0\x9F\x98\xB4","&#x1F634;",$text);
        $text = str_replace("\xF0\x9F\x98\xB6","&#x1F636;",$text);
        $text = str_replace("\xF0\x9F\x9A\x81","&#x1F681;",$text);
        $text = str_replace("\xF0\x9F\x9A\x82","&#x1F682;",$text);
        $text = str_replace("\xF0\x9F\x9A\x86","&#x1F686;",$text);
        $text = str_replace("\xF0\x9F\x9A\x88","&#x1F688;",$text);
        $text = str_replace("\xF0\x9F\x9A\x8A","&#x1F68A;",$text);
        $text = str_replace("\xF0\x9F\x9A\x8D","&#x1F68D;",$text);
        $text = str_replace("\xF0\x9F\x9A\x8E","&#x1F68E;",$text);
        $text = str_replace("\xF0\x9F\x9A\x90","&#x1F690;",$text);
        $text = str_replace("\xF0\x9F\x9A\x94","&#x1F694;",$text);
        $text = str_replace("\xF0\x9F\x9A\x96","&#x1F696;",$text);
        $text = str_replace("\xF0\x9F\x9A\x98","&#x1F698;",$text);
        $text = str_replace("\xF0\x9F\x9A\x9B","&#x1F69B;",$text);
        $text = str_replace("\xF0\x9F\x9A\x9C","&#x1F69C;",$text);
        $text = str_replace("\xF0\x9F\x9A\x9D","&#x1F69D;",$text);
        $text = str_replace("\xF0\x9F\x9A\x9E","&#x1F69E;",$text);
        $text = str_replace("\xF0\x9F\x9A\x9F","&#x1F69F;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA0","&#x1F6A0;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA1","&#x1F6A1;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA3","&#x1F6A3;",$text);
        $text = str_replace("\xF0\x9F\x9A\xA6","&#x1F6A6;",$text);
        $text = str_replace("\xF0\x9F\x9A\xAE","&#x1F6AE;",$text);
        $text = str_replace("\xF0\x9F\x9A\xAF","&#x1F6AF;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB0","&#x1F6B0;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB1","&#x1F6B1;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB3","&#x1F6B3;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB4","&#x1F6B4;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB5","&#x1F6B5;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB7","&#x1F6B7;",$text);
        $text = str_replace("\xF0\x9F\x9A\xB8","&#x1F6B8;",$text);
        $text = str_replace("\xF0\x9F\x9A\xBF","&#x1F6BF;",$text);
        $text = str_replace("\xF0\x9F\x9B\x81","&#x1F6C1;",$text);
        $text = str_replace("\xF0\x9F\x9B\x82","&#x1F6C2;",$text);
        $text = str_replace("\xF0\x9F\x9B\x83","&#x1F6C3;",$text);
        $text = str_replace("\xF0\x9F\x9B\x84","&#x1F6C4;",$text);
        $text = str_replace("\xF0\x9F\x9B\x85","&#x1F6C5;",$text);
        $text = str_replace("\xF0\x9F\x8C\x8D","&#x1F30D;",$text);
        $text = str_replace("\xF0\x9F\x8C\x8E","&#x1F30E;",$text);
        $text = str_replace("\xF0\x9F\x8C\x90","&#x1F310;",$text);
        $text = str_replace("\xF0\x9F\x8C\x92","&#x1F312;",$text);
        $text = str_replace("\xF0\x9F\x8C\x96","&#x1F316;",$text);
        $text = str_replace("\xF0\x9F\x8C\x97","&#x1F317;",$text);
        $text = str_replace("\xF0\x9F\x8C\x98","&#x1F318;",$text);
        $text = str_replace("\xF0\x9F\x8C\x9A","&#x1F31A;",$text);
        $text = str_replace("\xF0\x9F\x8C\x9C","&#x1F31C;",$text);
        $text = str_replace("\xF0\x9F\x8C\x9D","&#x1F31D;",$text);
        $text = str_replace("\xF0\x9F\x8C\x9E","&#x1F31E;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB2","&#x1F332;",$text);
        $text = str_replace("\xF0\x9F\x8C\xB3","&#x1F333;",$text);
        $text = str_replace("\xF0\x9F\x8D\x8B","&#x1F34B;",$text);
        $text = str_replace("\xF0\x9F\x8D\x90","&#x1F350;",$text);
        $text = str_replace("\xF0\x9F\x8D\xBC","&#x1F37C;",$text);
        $text = str_replace("\xF0\x9F\x8F\x87","&#x1F3C7;",$text);
        $text = str_replace("\xF0\x9F\x8F\x89","&#x1F3C9;",$text);
        $text = str_replace("\xF0\x9F\x8F\xA4","&#x1F3E4;",$text);
        $text = str_replace("\xF0\x9F\x90\x80","&#x1F400;",$text);
        $text = str_replace("\xF0\x9F\x90\x81","&#x1F401;",$text);
        $text = str_replace("\xF0\x9F\x90\x82","&#x1F402;",$text);
        $text = str_replace("\xF0\x9F\x90\x83","&#x1F403;",$text);
        $text = str_replace("\xF0\x9F\x90\x84","&#x1F404;",$text);
        $text = str_replace("\xF0\x9F\x90\x85","&#x1F405;",$text);
        $text = str_replace("\xF0\x9F\x90\x86","&#x1F406;",$text);
        $text = str_replace("\xF0\x9F\x90\x87","&#x1F407;",$text);
        $text = str_replace("\xF0\x9F\x90\x88","&#x1F408;",$text);
        $text = str_replace("\xF0\x9F\x90\x89","&#x1F409;",$text);
        $text = str_replace("\xF0\x9F\x90\x8A","&#x1F40A;",$text);
        $text = str_replace("\xF0\x9F\x90\x8B","&#x1F40B;",$text);
        $text = str_replace("\xF0\x9F\x90\x8F","&#x1F40F;",$text);
        $text = str_replace("\xF0\x9F\x90\x90","&#x1F410;",$text);
        $text = str_replace("\xF0\x9F\x90\x93","&#x1F413;",$text);
        $text = str_replace("\xF0\x9F\x90\x95","&#x1F415;",$text);
        $text = str_replace("\xF0\x9F\x90\x96","&#x1F416;",$text);
        $text = str_replace("\xF0\x9F\x90\xAA","&#x1F42A;",$text);
        $text = str_replace("\xF0\x9F\x91\xA5","&#x1F465;",$text);
        $text = str_replace("\xF0\x9F\x91\xAC","&#x1F46C;",$text);
        $text = str_replace("\xF0\x9F\x91\xAD","&#x1F46D;",$text);
        $text = str_replace("\xF0\x9F\x92\xAD","&#x1F4AD;",$text);
        $text = str_replace("\xF0\x9F\x92\xB6","&#x1F4B6;",$text);
        $text = str_replace("\xF0\x9F\x92\xB7","&#x1F4B7;",$text);
        $text = str_replace("\xF0\x9F\x93\xAC","&#x1F4EC;",$text);
        $text = str_replace("\xF0\x9F\x93\xAD","&#x1F4ED;",$text);
        $text = str_replace("\xF0\x9F\x93\xAF","&#x1F4EF;",$text);
        $text = str_replace("\xF0\x9F\x93\xB5","&#x1F4F5;",$text);
        $text = str_replace("\xF0\x9F\x94\x80","&#x1F500;",$text);
        $text = str_replace("\xF0\x9F\x94\x81","&#x1F501;",$text);
        $text = str_replace("\xF0\x9F\x94\x82","&#x1F502;",$text);
        $text = str_replace("\xF0\x9F\x94\x84","&#x1F504;",$text);
        $text = str_replace("\xF0\x9F\x94\x85","&#x1F505;",$text);
        $text = str_replace("\xF0\x9F\x94\x86","&#x1F506;",$text);
        $text = str_replace("\xF0\x9F\x94\x87","&#x1F507;",$text);
        $text = str_replace("\xF0\x9F\x94\x89","&#x1F509;",$text);
        $text = str_replace("\xF0\x9F\x94\x95","&#x1F515;",$text);
        $text = str_replace("\xF0\x9F\x94\xAC","&#x1F52C;",$text);
        $text = str_replace("\xF0\x9F\x94\xAD","&#x1F52D;",$text);
        $text = str_replace("\xF0\x9F\x95\x9C","&#x1F55C;",$text);
        $text = str_replace("\xF0\x9F\x95\x9D","&#x1F55D;",$text);
        $text = str_replace("\xF0\x9F\x95\x9E","&#x1F55E;",$text);
        $text = str_replace("\xF0\x9F\x95\x9F","&#x1F55F;",$text);
        $text = str_replace("\xF0\x9F\x95\xA0","&#x1F560;",$text);
        $text = str_replace("\xF0\x9F\x95\xA1","&#x1F561;",$text);
        $text = str_replace("\xF0\x9F\x95\xA2","&#x1F562;",$text);
        $text = str_replace("\xF0\x9F\x95\xA3","&#x1F563;",$text);
        $text = str_replace("\xF0\x9F\x95\xA4","&#x1F564;",$text);
        $text = str_replace("\xF0\x9F\x95\xA5","&#x1F565;",$text);
        $text = str_replace("\xF0\x9F\x95\xA6","&#x1F566;",$text);
        $text = str_replace("\xF0\x9F\x95\xA7","&#x1F567",$text);

        return $text;
    }
}