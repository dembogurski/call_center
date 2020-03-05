<?php

 

/**
 * Description of CallCenter
 *
 * @author Doglas
 */
 
 

/**
 * Description of Ubicar
 * @author Ing.Douglas
 * @date 10/10/2016
 */
require_once("../Y_Template.class.php"); 
require_once("../Y_DB_MySQL.class.php");
require_once("../Functions.class.php");

class CallCenter {

    function __construct() {
        $action = $_REQUEST['action'];
        if (function_exists($action)) {
            call_user_func($action);
        } else {
            $this->main();
        }
    }

    function main() {

        $t = new Y_Template("CallCenter.html"); 

        $t->Show("headers");
        $t->Show("body"); 
         
    } 
}
 function buscarInstituciones(){
       $criterio = $_POST['criterio'];    
       $f = new Functions();
       echo json_encode($f->getResultArray("SELECT cod_inst,i.nombre, di.nombre AS distrito, d.nombre_depar AS departamento
       FROM instituciones i, distritos di, departamentos d WHERE di.cod_depart = d.cod_depart AND di.dist_num = i.dist_num
       AND i.cod_depart = d.cod_depart 
       AND i.nombre LIKE '%$criterio%'"));
 }

 

new CallCenter();
?>
