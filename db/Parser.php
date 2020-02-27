<?php

require_once("../Y_DB_MySQL.class.php");

$txt_file    = file_get_contents('distritos.txt');
$rows        = explode("\n", $txt_file);
array_shift($rows);

foreach($rows as $row => $data)
{
    //get row data
    $row_data = explode(';', $data);

    $info[$row]['dep']           = $row_data[0];
    $info[$row]['dist']         = $row_data[1];
    $info[$row]['cod_dep']  = $row_data[2];
    $info[$row]['cod_dist']       = $row_data[3];

    //display data
    
    $distrito = trim($info[$row]['dist'])  ;
    $cod_dep = trim($info[$row]['cod_dep'])  ;    
    $cod_dist = trim($info[$row]['cod_dist']) ;

    $db = new My();
    $db->Query("INSERT INTO  distritos (dist_num, codigo_pais, cod_depart, nombre)
    VALUES ('$cod_dist', 'PY', '$cod_dep', '$distrito');");    

    echo "$cod_dep  $cod_dist  --> $distrito<br />";
}

?>

