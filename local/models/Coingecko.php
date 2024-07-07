<?php

class Coingecko extends CommonModels
{
	private $apiUrl = COINGECKO_API_URL;

    public function __construct(){   
        parent::__construct();
    }
}