<?php
/**
 * Description of CallCenter
 *
 * @author Doglas
 */
require_once("../Y_Template.class.php");
require_once("../Y_DB_MySQL.class.php"); 
require_once("../Functions.class.php");


class CallCenterRep {
    function __construct() {
        $action = $_REQUEST['action']; 
         
        if (function_exists($action)) {
            call_user_func($action);
        } else {
            $this->main();
        }        
    }     
    function main(){
        
        //print_r($_REQUEST);
        
        $t = new Y_Template("CallCenterRep.html");
        $t->Show("header");
        $my = new My();
        
        $my->Query("SET lc_time_names = 'es_PY';");
        
        $desde = $_REQUEST['desde'];
        $hasta = $_REQUEST['hasta']; 
        $obs_per = $_REQUEST['obs_per'];  
        $suc = $_REQUEST['select_suc']; 
        $nivel = $_REQUEST['nivel'];
        $cod_inst = $_REQUEST['select_inst'];
        $cod_entidad = $_REQUEST['select_entidad'];
        $estado = $_REQUEST['estados'];
        $usuario = $_REQUEST['usuario'];
        
        $nombre_suc = "%";
        $nombre_ent = "%";
        $nombre_inst = "%";
        
        if($obs_per === ""){
            $obs_per = "%";
        }
        $t->Set('nombre_suc',$nombre_suc);
        $t->Set('institucion',$cod_inst);
        $t->Set('entidad',$nombre_ent);
        
        if($suc != "%"){
           $my->Query("SELECT nombre FROM sucursales WHERE suc = '$suc'");
           $my->NextRecord();
           $nombre_suc = $my->Record['nombre'];
           $t->Set('nombre_suc',$nombre_suc);
        }
        
        if($cod_inst != "%"){
           $my->Query("SELECT nombre FROM instituciones WHERE cod_inst = '$cod_inst'");
           $my->NextRecord();
           $nombre_inst = $my->Record['nombre'];
           $t->Set('institucion',$nombre_inst);
        }
        $nombre_ent = "%";
        if($cod_entidad != "%"){ 
           $my->Query("SELECT nombre FROM entidades WHERE cod_ent = '$cod_entidad'");
           $my->NextRecord();
           $nombre_ent = $my->Record['nombre'];  
           $t->Set('entidad',$nombre_ent);
        }
        
        $hoy = date("d/m/Y");

        $t->Set('time', date("d-m-Y h:i"));
        $t->Set('user', $usuario);
         
        
        $fn = new Functions();
        $permiso = $fn->chequearPermiso("10.9", $usuario);    
        
        $t->Set('desde', $desde);
        $t->Set('hasta', $hasta);
        $t->Set('suc',$suc);
        
        
        $t->Set('estado',$estado);        
        $t->Set('nivel',$nivel);
        
        $fdesde = $fn->invertirFechaLat($desde);
        $fhasta = $fn->invertirFechaLat($hasta);
        
        $t->Show("head");
        
       
        
        $sql = "SELECT c.usuario,  DATE_FORMAT(fecha,'%d-%m-%Y %H:%i') AS fecha,p.ocupacion,p.nombre,i.nombre AS institucion,i.dir,
        c.obs_per,c.obs_usuario,
        nivel,c.estado 

        FROM comunicaciones c 
        INNER JOIN  personas p ON c.cod_per = p.cod_per 
        INNER JOIN instituciones i ON p.cod_inst = i.cod_inst

        WHERE i.suc LIKE '$suc' AND i.cod_inst LIKE '$cod_inst' AND c.nivel LIKE '$nivel' AND c.estado LIKE '$estado' AND c.obs_per LIKE '$obs_per'
        AND i.cod_ent LIKE '$cod_entidad'
        AND DATE(fecha) BETWEEN '$fdesde' AND '$fhasta'";
 
         //echo $sql;
        
        $my->Query($sql);
        
        $TOTAL = 0;
        $TOTAL_REF = 0;
         
        
        while($my->NextRecord()){
            $usuario = $my->Record['usuario'];
            $fecha = $my->Record['fecha'];
            $ocupacion = $my->Record['ocupacion'];
            $nombre = $my->Record['nombre'];
            $institucion = $my->Record['institucion'];
            $dir = $my->Record['dir'];
            $obs_per = $my->Record['obs_per'];
            $obs_usuario = $my->Record['obs_usuario']; 
            $nivelc = $my->Record['nivel'];
            $estado = $my->Record['estado'];
              
                        
            $t->Set("usuario",$usuario);
            $t->Set("fecha",$fecha);
            $t->Set("ocupacion",$ocupacion);
            $t->Set("nombre",$nombre);            
            $t->Set("institucion",$institucion);
            $t->Set("dir",$dir);
            $t->Set("obs_per",$obs_per);
            $t->Set("obs_usuario",$obs_usuario);  
            $t->Set("nivel",$nivelc); 
            $t->Set("estado",$estado); 
             
            
            $t->Show("data");
        }

        
        $t->Show("foot");
             
    }    
}
 
new CallCenterRep();

?>