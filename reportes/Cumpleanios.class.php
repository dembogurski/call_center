<?php
/**
 * Description of CallCenter
 *
 * @author Doglas
 */
require_once("../Y_Template.class.php");
require_once("../Y_DB_MySQL.class.php"); 
require_once("../Functions.class.php");


class Cumpleanios {
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
        
        $t = new Y_Template("Cumpleanios.html");
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
        $usuario = $_REQUEST['user'];
         
        $hoy = date("d/m/Y");

        $t->Set('time', date("d-m-Y h:i"));
        $t->Set('user', $usuario);
         
        
        $fn = new Functions();
          
        
        $t->Set('desde', $desde);
        $t->Set('hasta', $hasta);
        $t->Set('suc',$suc);
        
        
        $t->Set('estado',$estado);        
        $t->Set('nivel',$nivel);
        
        $fdesde = $fn->invertirFechaLat($desde);
        $fhasta = $fn->invertirFechaLat($hasta);
        
        $t->Show("head");
        
        
        
        $sql = "SELECT  p.nombre,ocupacion,p.tel,DATE_FORMAT(p.fecha_nac,'%d %M') AS fecha_nac,  i.nombre AS institucion , s.nombre AS empresa , e.nombre AS entidad
        FROM personas p, instituciones i, sucursales s, entidades e 
        WHERE p.cod_inst = i.cod_inst AND i.suc = s.suc AND i.cod_ent = e.cod_ent AND 
        DAYOFYEAR(p.fecha_nac) BETWEEN DAYOFYEAR('$fdesde') AND  DAYOFYEAR('$fhasta') ";
 
         //echo $sql;
        
        $my->Query($sql);
        
        $TOTAL = 0;
        $TOTAL_REF = 0;
         
        
        while($my->NextRecord()){
            $nombre = $my->Record['nombre'];
            $ocupacion = $my->Record['ocupacion'];
            $tel = $my->Record['tel'];
            $fecha_nac = $my->Record['fecha_nac'];
            $institucion = $my->Record['institucion'];
            $empresa = $my->Record['empresa'];
            $entidad = $my->Record['entidad'];
             
                        
            $t->Set("nombre",$nombre);
            $t->Set("tel",$tel);
            $t->Set("ocupacion",$ocupacion);
            $t->Set("fecha_nac",$fecha_nac);            
            $t->Set("institucion",$institucion);
            $t->Set("empresa",$empresa);
            $t->Set("entidad",$entidad);
             
             
            
            $t->Show("data");
        }

        
        $t->Show("foot");
             
    }    
}
 
new Cumpleanios();

?>