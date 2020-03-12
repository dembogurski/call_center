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
        $hoy = date("Y-m-d"); 
        $t->Set("hoy",$hoy);
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
    echo json_encode($f->getResultArray("SELECT cod_per,cod_inst,ci_ruc,nombre,tel,ocupacion FROM personas WHERE  estado = 'Activo' and $criterio '$valor'"));
} 
function buscarEntidades(){
    $criterio = $_POST['criterio'];  
    $valor = $_POST['valor'];  
     
    $f = new Functions();
    echo json_encode($f->getResultArray("SELECT DISTINCT e.cod_ent,e.nombre FROM instituciones i , entidades e WHERE i.cod_ent = e.cod_ent AND i.suc like '$valor'"));
} 

function registrar(){
    $cod_per = $_POST['cod_per'];  
    $obs_per = $_POST['obs_per'];   
    $obs_user = $_POST['obs_user'];  
    $nivel = $_POST['nivel'];  
    $estado = $_POST['estado']; 
    $usuario = $_POST['usuario']; 
    $ins = "INSERT INTO call_center.comunicaciones ( cod_per, usuario, fecha, obs_per, obs_usuario, nivel, estado)
    VALUES ('$cod_per', '$usuario', CURRENT_TIMESTAMP, '$obs_per', '$obs_user', '$nivel', '$estado');";
    $db = new My();
    $db->Query($ins);
    $f = new Functions();
    $Qry = "SELECT id_com,c.cod_per,p.cod_inst,c.usuario,DATE_FORMAT(fecha,'%d-%m-%Y') AS fecha, p.nombre AS persona,  i.nombre AS institucion ,d.nombre AS entidad,  
    obs_per, obs_usuario, nivel, c.estado 
    FROM  comunicaciones c,personas p, instituciones i, entidades d
    WHERE c.cod_per = p.cod_per AND p.cod_inst = i.cod_inst 
    AND i.cod_ent = d.cod_ent AND c.cod_per = $cod_per  AND c.usuario = '$usuario' ORDER BY id_com DESC LIMIT 1";
    echo json_encode($f->getResultArray($Qry));
}

function modificar(){
    $editing_comunication_id = $_POST['editing_comunication_id'];  
    $obs_per = $_POST['obs_per'];   
    $obs_user = $_POST['obs_user'];  
    $nivel = $_POST['nivel'];  
    $estado = $_POST['estado']; 
    $usuario = $_POST['usuario']; 
    $update = "UPDATE comunicaciones SET fecha_modif = CURRENT_TIMESTAMP, obs_per = '$obs_per', obs_usuario = '$obs_user',nivel = '$nivel' ,estado = '$estado' WHERE id_com = $editing_comunication_id;";
    $db = new My();
    
    $db->Query($update);
    
    $f = new Functions();
    
    $Qry = "SELECT id_com,c.cod_per,p.cod_inst,c.usuario,DATE_FORMAT(fecha,'%d-%m-%Y') AS fecha, p.nombre AS persona,  i.nombre AS institucion ,d.nombre AS entidad,  
    obs_per, obs_usuario, nivel, c.estado 
    FROM  comunicaciones c,personas p, instituciones i, entidades d
    WHERE  c.cod_per = p.cod_per AND p.cod_inst = i.cod_inst 
    AND i.cod_ent = d.cod_ent AND id_com = $editing_comunication_id  LIMIT 1";
    echo json_encode($f->getResultArray($Qry));
}

function filtrarComunicaciones(){
    $desde = $_POST['desde']; 
    $hasta = $_POST['hasta']; 
    $obs_per = $_POST['obs_per'];
    $nivel = $_POST['nivel'];  
    $estado= $_POST['estado'];  
    $cod_per = $_POST['cod_per'];
    $cod_inst = $_POST['cod_inst']; 
    $limite= $_POST['limite'];
    $f = new Functions();
    $Qry = "SELECT id_com,c.cod_per,p.cod_inst,c.usuario,DATE_FORMAT(fecha,'%d-%m-%Y') AS fecha, p.nombre AS persona,  i.nombre AS institucion ,d.nombre AS entidad,  
    obs_per, obs_usuario, nivel, c.estado 
    FROM  comunicaciones c,personas p, instituciones i, entidades d
    WHERE c.cod_per = p.cod_per AND p.cod_inst = i.cod_inst 
    AND i.cod_ent = d.cod_ent
    AND DATE(fecha) BETWEEN '$desde' AND '$hasta' AND c.estado like '$estado' and c.obs_per like '%$obs_per%' and c.nivel like '$nivel' "
            . "and c.estado like '$estado' and c.cod_per like '$cod_per' AND i.cod_inst like '$cod_inst'" 
            . " limit $limite";
    
     //echo $Qry;
    echo json_encode($f->getResultArray($Qry));
}

new CallCenter();
?>
