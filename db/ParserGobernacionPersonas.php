<?php

require_once("../Y_DB_MySQL.class.php");

$txt_file    = file_get_contents('GOBERNACION.csv');
$rows        = explode("\n", $txt_file);
array_shift($rows);

$numeros = array();

foreach($rows as $row => $data)
{
    //get row data
    $row_data = explode(';', $data);

    $info[$row]['cod_ent']           = $row_data[0];
    $info[$row]['suc']         = $row_data[1];
    $info[$row]['dir']         = $row_data[2];
    $info[$row]['cod_dist']  = $row_data[3];
    $info[$row]['num_esc']       = $row_data[4];
    $info[$row]['nombre_inst']       = $row_data[5];
    
    $info[$row]['tipo']       = $row_data[6];
    $info[$row]['nombre_per']       = $row_data[7];
    $info[$row]['ci']       = $row_data[8];
    $info[$row]['nac']       = $row_data[9];
    $info[$row]['tel']       = $row_data[10];


    //display data
    
    $cod_ent =   trim(   $info[$row]['cod_ent'])   ;
    $suc = trim($info[$row]['suc'])  ;    
    $cod_dist = trim($info[$row]['cod_dist']) ;
    $num_esc = trim($info[$row]['num_esc'])  ;
    $nombre_inst = trim($info[$row]['nombre_inst'])  ;
    $dir = trim($info[$row]['dir'])  ;   
    
    $ocupacion = strtolower(trim($info[$row]['tipo']))  ;  
    $nombre_per = strtoupper( trim($info[$row]['nombre_per']))  ;  
    $ci = trim($info[$row]['ci'])  ;  
    $nac = trim($info[$row]['nac'])  ;  
    $tel = trim($info[$row]['tel'])  ;  
    
    if($ocupacion == "cocinera"){
        $ocupacion = "Cocinero/a";
    }

    $hash = md5($cod_dist."-".$nombre_inst);
    
    if(in_array($hash, $numeros)){
        echo "Duplicado $cod_dist  $nombre_inst<br>";
    }else{
        if($nombre_per != ""){
            $cod_inst = 0;
          if($num_esc != "*"){   
             $db = new My();
             $db->Query("SELECT cod_inst FROM instituciones WHERE nombre LIKE '$num_esc%'");   
             $db->NextRecord();
             $cod_inst = $db->Record['cod_inst'];
          }else{
              $cod_inst = 37;
          }
          //array_push($numeros, $hash);  
          $db->Query("INSERT INTO call_center.personas ( cod_inst, tipo_doc, ci_ruc, nombre, tel, email, fecha_nac, estado, ciudad, dir, geoloc, ocupacion, tipo, usuario, fecha_reg)
         VALUES (  '$cod_inst', 'CI', '$ci', '$nombre_per', '$tel', '', '$nac', 'Activo', '', '$dir', '', '$ocupacion', '', 'douglas', CURRENT_DATE);");
          
          echo "Esc:$num_esc Numero Inst.: $cod_inst  Nombre: $nombre_per  ocupacion:$ocupacion   $nac       $tel<br />";
        }
        
        //37 ESC  AGRICOLA
    }
}

?>

