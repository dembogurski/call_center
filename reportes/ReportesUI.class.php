<?php

/**
 * Description of Reportes
 * @author Ing.Douglas
 * @date 02/03/2017
 */

require_once("../Y_Template.class.php");
require_once("../Y_DB_MySQL.class.php");
//require_once("../Y_DB_MSSQL.class.php");

$proto = "http";
if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") { 
    $proto = "https";
} 
 
define('path',"$proto://".$_SERVER['SERVER_NAME'].":".$_SERVER['SERVER_PORT']."/call_center"); 
 

class ReportesUI {
    
   function __construct() {
        $action = $_REQUEST['action']; 
        if (function_exists($action)) {            
            call_user_func($action);
        } else {            
            $this->main();
        }
    }
    function main() {
        $t = new Y_Template("ReportesUI.html");
        $random  = rand(0,1000000);       
        $t->Set("srand",$random);
        $t->Show("header");
        $t->Show("filters");
         
        // Clases posibles:   ventas caja empaque funcionarios    gerencia rrhh stock administracion 
            
        //Ejemplo nomas borrar despues
        createReportButton("10.1", $t, "Comunicaciones del Call Center", "call_center gerencia administracion");

        createReportButton("10.2", $t, "Cumplea&ntilde;os", "call_center gerencia administracion");
           
          
         
        $t->Show("footer");
    }
}

function cumpleanios(){
   $t = new Y_Template("ReportesUI.html");         
   $usuario = $_POST['usuario']; 
   $t->Set("titulo_filtro","Reporte de Cumplea&ntilde;os");
   $t->Set("action",path."/reportes/Cumpleanios.class.php");
   $t->Show("filter_header");
   trFechaDesdeHasta($t);  
   botonGenerarReporte($t);         
   $t->Show("filter_footer"); 
}

function comunicaciones_del_call_center(){
   $t = new Y_Template("ReportesUI.html");         
   $usuario = $_POST['usuario']; 
   $suc = $_POST['suc']; 
   $sucursales = getSucursales("","suc asc",true); //getInsituciones
   
   $entidades = getEntidades();
           
   $instituciones = getInsituciones();
   
   $tipo_niveles = array("%"=>"* - Todos","Bajo"=>"Bajo","Medio"=>"Medio","Urgente"=>"Urgente","Trivial"=>"Trivial");
   $niveles = createSelect($tipo_niveles, "nivel");
   
   $tipo_estados = array("%"=>"* - Todos","Pendiente"=>"Pendiente","En Proceso"=>"En Proceso","Cerrado"=>"Cerrado");
   $estados = createSelect($tipo_estados, "estados");
   
   $t->Set("titulo_filtro","Reporte del Call Center");
   $t->Set("action",path."/reportes/CallCenterRep.class.php");
   $t->Show("filter_header");
   
   showHtml($t,"<tr><td colspan='4'><input type='hidden' id='suc' value='$suc' ><input type='hidden' id='usuario' value='$usuario' ></td></tr>");
   //$tipo = createSelect(array("*","M.C.","D.FP.","D.F."),"tipo");
   showHtml($t,"<tr><td>Empresa:</td><td>$sucursales</td><td>Entidades:</td><td>$entidades</td> <td></td></tr>");
   
   showHtml($t,"<tr><td>Instituciones:</td><td colspan='3'>$instituciones</td> <td></td></tr>");
   
   showHtml($t,"<tr><td>Nivel:</td><td>$niveles</td><td>Estado:</td><td>$estados</td></tr>");
   
   showHtml($t,"<tr><td  >Obs:</td><td colspan='3'><input type='text' id='obs_per' size='60'></td></tr>");
    
   showHtml($t,"<script>initRepCallCenter();</script>");
   
   trFechaDesdeHasta($t);  
   botonGenerarReporte($t);         
   $t->Show("filter_footer"); 
}
 




/** Macros */
function getResultArray($sql) {
    $db = new My();
    $array = array();
    $db->Query($sql);
    while ($db->NextRecord()) {
        array_push($array, $db->Record);
    }
    $db->Close();
    return $array;
}
/**
 * Metodo generico para devolver un array en MSSQL
 * @param type $sql
 * @return array
 */
function getResultArrayMSSQL($sql) {     
    $db = new MS();
    $array = array();
    $db->Query($sql);
    while ($db->NextRecord()) {
        array_push($array, array_map('utf8_encode', $db->Record));
    }
    $db->Close();
    return $array;
}
function getUsuarios(){
    $suc = $_REQUEST['suc']; 
    $usuario = $_REQUEST['usuario']; 
    $my = new My();
    $sql = "SELECT usuario,nombre,apellido,tel,doc,imagen,suc FROM usuarios WHERE suc LIKE '$suc' AND (usuario LIKE '$usuario%' OR nombre LIKE '$usuario%')";         
    echo json_encode(getResultArray($sql));
}

function getCli(){
    $suc = $_REQUEST['suc']; 
    $search = $_REQUEST['search'];
    $filtroFecha = '';
    if(isset($_REQUEST["desde"]) && isset($_REQUEST["desde"])){
        $desde = $_REQUEST["desde"];
        $hasta = $_REQUEST["hasta"];
        $filtroFecha = " AND fecha_cierre BETWEEN '$desde' AND '$hasta'";
    }
    
    $my = new My();
    $sql = "SELECT f.cod_cli,f.tipo_doc,f.ruc_cli,f.cliente,cod_cli,cat from factura_venta f where f.estado ='Cerrada' and (ruc_cli ='$search' or cliente regexp '$search') $filtroFecha group by f.cod_cli";         
    echo json_encode(getResultArray($sql));
}

function getSucursales($filtro = "",$order_by = "suc asc",$include_all=false,$callback="",$id = 'select_suc'){
    $my = new My();
    $sql = "SELECT suc,nombre FROM sucursales $filtro order by  $order_by";
    $my->Query($sql);

    $sucs = "<select id='$id' $callback>";
    if($include_all){
       $sucs.="<option value='%'>* - Todas</option>"; 
    }
    while ($my->NextRecord()) {
        $suc = $my->Record['suc'];
        $nombre = $my->Record['nombre'];
        $sucs.="<option value=" . $suc . ">" . $suc . " - " . $nombre . "</option>";
    }
    $sucs.="</select>"; 
    return $sucs;
}
function getEntidades($id = 'select_entidad',$callback="",$include_all=true){
    $my = new My();
    $sql = "SELECT cod_ent,nombre FROM entidades WHERE estado = 'Activo' ORDER BY  nombre ASC ";
    $my->Query($sql);

    $sucs = "<select id='$id' $callback>";
    if($include_all){
       $sucs.="<option value='%'>* - Todas</option>"; 
    }
    while ($my->NextRecord()) {
        $cod_ent = $my->Record['cod_ent'];
        $nombre = $my->Record['nombre']; 
        $sucs.="<option value=" . $cod_ent . ">$nombre</option>";
    }
    $sucs.="</select>"; 
    return $sucs;
}

function getInsituciones($id = 'select_inst',$callback="",$include_all=true){
    $my = new My();
    $sql = "SELECT cod_inst,i.nombre, di.nombre AS distrito, d.nombre_depar AS departamento
       FROM instituciones i, distritos di, departamentos d WHERE di.cod_depart = d.cod_depart AND di.dist_num = i.dist_num
       AND i.cod_depart = d.cod_depart 
       AND i.estado = 'Activo' ORDER BY i.nombre ASC ";
    $my->Query($sql);

    $sucs = "<select id='$id' $callback>";
    if($include_all){
       $sucs.="<option value='%'>* - Todas</option>"; 
    }
    while ($my->NextRecord()) {
        $cod_inst = $my->Record['cod_inst'];
        $nombre = $my->Record['nombre'];
        $distrito = $my->Record['distrito'];
        $departamento = $my->Record['departamento'];
        $sucs.="<option value=" . $cod_inst . ">$nombre - $distrito - $departamento</option>";
    }
    $sucs.="</select>"; 
    return $sucs;
}
function getProveedores($order_by = "CardName ASC",$include_all=false,$callback=""){
    $ms = new MS();
    $sql = "SELECT h.CardCode, h.CardName FROM OITL h INNER JOIN OCRD c ON h.CardCode = c.CardCode WHERE c.CardType='S' AND LEFT(c.CardCode,1) = 'P' GROUP BY h.CardCode, h.CardName ORDER BY $order_by";
    $ms->Query($sql);

    $proveedores  = "<select id='select_proveedor' $callback>";
    if($include_all){
       $proveedores .="<option value='%'>* - Todas</option>"; 
    }
    while ($ms->NextRecord()) {
        $CardCode = $ms->Record['CardCode'];
        $CardName = utf8_encode($ms->Record['CardName']);
        $proveedores .="<option value=" . $CardCode . ">$CardName</option>";
    }
    $proveedores .="</select>"; 
    return $proveedores ;
}
 

function canModSuc($user){
    $my = new My();
    $my->Query("SELECT count(*) as permiso from usuarios u inner join usuarios_x_grupo g using(usuario) inner join permisos_x_grupo p using(id_grupo) where u.usuario = '$user' AND  p.id_permiso = '3.8.1'");
    $my->NextRecord();
    
    $permiso = $my->Record['permiso'];
    
    if( $permiso > 0){
        return true;
    }else{
        return false;
    }
    
}
function canModUser($user){
    $my = new My();
    $my->Query("SELECT count(*) as permiso from usuarios u inner join usuarios_x_grupo g using(usuario) inner join permisos_x_grupo p using(id_grupo) where u.usuario = '$user' AND  p.id_permiso = '10.0.1'");
    $my->NextRecord();
    if((int)$my->Record['permiso'] > 0){
        return true;
    }
    return false;
}
  
function showHtml($t,$html){
    $t->Set("html",$html);
    $t->Show("html");  
}
function text($id,$value="",$placeholder="",$size=10){
   return "<input  id='$id' type='text' value='$value' size='$size' placeholder='$placeholder'>";    
}
function createSelect($values,$id){
    $s = "<select id='$id' >";
    foreach ($values as $key => $value) {
       if(is_numeric($key)){ // Si no se envia key=>val  toma key como val
          $key = $value;
       }
       $s.="<option value='" . $key . "'>" . $value. "</option>";
    }    
    $s.="</select>"; 
    return $s;
}
function trFechaDesdeHasta($t,$incluir_boton_hoy=true){
   showHtml($t,"<tr>");   
   $t->Set("label_fecha","Desde");
   $t->Set("id_fecha","desde");
   $t->Show("fecha");  
   
   $t->Set("label_fecha","Hasta");
   $t->Set("id_fecha","hasta");
   if($incluir_boton_hoy){
       $t->Set("display_set_now","inline");
   }else{
       $t->Set("display_set_now","none");
   }
   $t->Show("fecha");  
   showHtml($t,"</tr>");
}

function botonGenerarReporte($t){
   showHtml($t,"<tr><td colspan='4' style='text-align:center'>");   
   $t->Set("call_func","sendForm()");
   $t->Set("value","Generar Reporte");
   $t->Show("button");   
   showHtml($t,"</td></tr>");
}


function createReportButton($perm_id, $template, $name, $clases){
    $usuario = $_POST['usuario'];  
    $db = new My();

    $sql_permiso = "SELECT u.nombre AS usu,ug.usuario,g.nombre,p.id_permiso AS id_permiso,descripcion,trustee 
        FROM  usuarios u,grupos g, usuarios_x_grupo ug, permisos_x_grupo p, permisos pr 
        WHERE u.usuario = ug.usuario AND ug.id_grupo = p.id_grupo AND g.id_grupo = ug.id_grupo AND p.id_permiso = pr.id_permiso  AND ug.usuario = '$usuario'
        AND  p.id_permiso = '$perm_id'";

    $db->Query($sql_permiso);

    if($db->NumRows() > 0){
        $template->Set("classes",$clases);
        $template->Set("nombre",$name);        
        $template->Show("button_factory");
    }        
}
/**End Macros */ 
 


 
 

new ReportesUI();
?>
   