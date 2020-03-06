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
        $random  = rand(0,1000000); 
        $t->Set("srand",$random);
        $t->Show("headers");
        $t->Show("body"); 
         
    } 
}
function buscarInstituciones(){
       $valor = $_POST['valor'];  
       $criterio = $_POST['criterio'];
       if($criterio == "i.nombre LIKE"){
           $valor = "%$valor%";
       }
       $f = new Functions();
       echo json_encode($f->getResultArray("SELECT cod_inst,i.nombre, di.nombre AS distrito, d.nombre_depar AS departamento
       FROM instituciones i, distritos di, departamentos d WHERE di.cod_depart = d.cod_depart AND di.dist_num = i.dist_num
       AND i.cod_depart = d.cod_depart 
       AND $criterio '$valor'"));
}

function buscarPersonas(){
    $criterio = $_POST['criterio'];  
    $valor = $_POST['valor'];  
    if($criterio == "nombre LIKE"){
           $valor = "%$valor%";
    }
    $f = new Functions();
    echo json_encode($f->getResultArray("SELECT cod_per,cod_inst,ci_ruc,nombre,tel,ocupacion FROM personas WHERE  $criterio '$valor'"));
} 
 /**
  * var cod_per = $("#personas").val();
    var obs_per = $("#obs_per").val();
    var obs_user = $("#obs_user").val();
    var nivel = $("#nivel").val();
    var estado = $("#estado").val();
  */

function registrar(){
    $cod_per = $_POST['cod_per'];  
    $obs_per = $_POST['obs_per'];  
    $obs_user = $_POST['obs_user'];  
    $nivel = $_POST['nivel'];  
    $estado = $_POST['estado']; 
    $usuario = $_POST['usuario']; 
    $ins = "INSERT INTO call_center.comunicaciones ( cod_per, usuario, fecha, obs_per, obs_usuario, nivel, estado)
    VALUES ('$cod_per', '$usuario', CURRENT_DATE, '$obs_per', '$obs_user', '$nivel', '$estado');";
    $db = new My();
    $db->Query($ins);
    $f = new Functions();
    echo json_encode($f->getResultArray("SELECT id_com, cod_per, usuario, fecha, obs_per, obs_usuario, nivel, estado FROM  comunicaciones WHERE cod_per = $cod_per AND usuario = '$usuario' ORDER BY id_com DESC LIMIT 1"));
}

new CallCenter();
?>
