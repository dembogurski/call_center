<?php

require_once("../Y_DB_MySQL.class.php");

$txt_file    = file_get_contents('MUNICIPIOS.csv');
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


    //display data
    
    $cod_ent = trim($info[$row]['cod_ent'])  ;
    $suc = trim($info[$row]['suc'])  ;    
    $cod_dist = trim($info[$row]['cod_dist']) ;
    $num_esc = trim($info[$row]['num_esc'])  ;
    $nombre_inst = trim($info[$row]['nombre_inst'])  ;
    $dir = trim($info[$row]['dir'])  ;    

    $hash = md5($cod_dist."-".$nombre_inst);
    
    if(in_array($hash, $numeros)){
        echo "Duplicado $cod_dist  $nombre_inst<br>";
    }else{
        if($nombre_inst != ""){
        $db = new My();
        
        $db->Query("INSERT INTO call_center.instituciones
        ( nombre, ci_ruc, tel, email, codigo_pais, cod_depart, dist_num, dir, cod_ent, suc, estado)
        VALUES ( '$num_esc $nombre_inst', '', '', '', 'PY', '07', '$cod_dist', '$dir', $cod_ent, '$suc', 'Activo'); ");    
         array_push($numeros, $hash);  
        echo "$cod_ent  $suc  Dist.: $cod_dist  Nro Esc:$num_esc  Nombre: $nombre_inst Dir:$dir<br />";
        }
    }
}

?>

