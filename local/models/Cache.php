<?php

class Cache
{
	private $instance;
	private $host='10.11.28.40';

	public function __construct()
	{
		if (!class_exists('Memcached')) {
			include ("memcached.php");
		}
		if (DEV_MODE == 'server_test') {
			$this->host = 'redis';
		}
		$this->instance=new Redis();
		$this->instance->connect($this->host, 6379);
		define('REDIS_HOST', $this->host);
    	define('REDIS_PORT', 6379);
	}

	public function getFromCache($query)
	{
		// Si preprod, on ne met pas de cache
		if(DEV_MODE == "preprod"){
            return false;
        } else {
            $key = md5(serialize($query));
            return unserialize($this->instance->get($key));
        }
	}

	/**
	* met des requêtes en cache
	* @param <type> $key clé de référence
	* @param <type> $value valeur
	* @param <type> $time :
		*  1_ 'noLimit' =>la variable est enregistrée pour une durée indéterminée
		*  2_ 'timeout_[durée en secondes] =>temps d'enregistrement (ex: 'timeout_3600')
		*  3_ 'time_[heure:minutes]' => heure de fin (ex : 'time_03:15')
	*/
	public function addToCache($key, $value, $time = 'noLimit')
	{
		//Si preprod, on ne met pas de cache
		if(DEV_MODE == "preprod"){
			return false;
		} else {
			//return false;
			$key = md5(serialize($key));

			if(preg_match('/^timeout_[0-9]+$/', $time)){
				$this->instance->set($key,serialize($value),Array('nx', 'ex'=>substr($time,8)));

			} else if(preg_match('/^time_[0-9]{1,2}:[0-9]{2}$/', $time)){
				$time=explode(':',substr($time,5));

				if(date('G')<$time[0]){
					echo $time = Date::getTimeDifference(date('Ymd H:i',mktime($time[0],$time[1],'0',date('m'),date('d'),date('Y'))),date('Ymd H:i'));

				} else {
					$time = Date::getTimeDifference(date('Ymd H:i',mktime($time[0],$time[1],'0',date('m'),date('d')+1,date('Y'))),date('Ymd H:i'));
				}
				$this->instance->set($key,$value,Array('nx', 'ex'=>$time));

			} else {
				$this->instance->set($key,$value);
			}
		}
	}

	public function deleteCache($key)
	{
		$key = md5(serialize($key));
		return $this->instance->delete($key);
	}

	public function emptyCache()
	{
		return $this->instance->flushAll();
	}
}
