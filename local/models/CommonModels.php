<?php

class CommonModels
{
    public $table;
    public $primaryKey;
    public $cache;

    public function __construct() {
        $this->cache = new Cache();
    }

    public function pdoConnect() {
        try{
            $pdo = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USERNAME, DB_PWD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
        } catch (Exception $ex) {
            echo 'Erreur PDO : '. $ex->getMessage();
            die();
        }
        return $pdo;
    }

    public function insert($table, $datas, $id=false){
        $pdo = $this->pdoConnect();

        $query = "INSERT INTO " . $table . " (";
        $totalDatas = count($datas);
        $i = 1;
        foreach($datas as $key=>$value)
        {
            $query .= "`" . $key . "`";
            if($i < $totalDatas) $query .= ",";
            $i++;
        }
        $query .= ") VALUES (";
        $i = 1;
        foreach($datas as $key=>$value)
        {
            $query .= $pdo->quote($value);
            if($i < $totalDatas) $query .= ",";
            $i++;
        }
        $query .= ");";

        $result = $pdo->prepare($query);
        if($id){
            $result->execute();
            return $pdo->lastInsertId();
        } else {
            return $result->execute();
        }
    }

    public function update($table, $datas, $where = null){
        $pdo = $this->pdoConnect();

        $query = "UPDATE " . $table . " SET";
        $totalDatas = count($datas);
        $i = 1;
        foreach($datas as $key=>$value){
            $query .= " `" . $key . "` = ". $pdo->quote($value);
            if($i < $totalDatas) $query .= ",";
            $i++;
        }
        if(isset($where) && !empty($where))
        {
            $query .= " WHERE " . $where;
        }
        $query .= ";";

        $result = $pdo->prepare($query);
        return $result->execute();
    }

    public function delete($table, $where = null){
        $pdo = $this->pdoConnect();

        $query = "DELETE FROM " . $table;

        if(isset($where) && !empty($where))
        {
            $query .= " WHERE " . $where;
        }
        $query .= ";";

        $result = $pdo->prepare($query);
        return $result->execute();
    }

    /**
     * Bind du paramatre avec detection auto du type de variable
     * 
     * @param   [type]  $result     [reference du resultat d'un prepare]
     * @param   [type]  $parameter  [nom du paramètre ex  :id_user]
     * @param   [type]  $value      [valeur du parametre]
     * @param   [type]  $var_type   [type du parametre]
     */
    public function bind(&$result, $parameter, $value, $var_type = null) {
        if (is_null($var_type)) {
            switch (true) {
                case is_bool($value):
                    $var_type = PDO::PARAM_BOOL;
                    break;
                case is_int($value):
                    $var_type = PDO::PARAM_INT;
                    break;
                case is_null($value):
                    $var_type = PDO::PARAM_NULL;
                    break;
                default:
                    $var_type = PDO::PARAM_STR;
            }
        }
        $result->bindParam($parameter, $value, $var_type);
    }
}
