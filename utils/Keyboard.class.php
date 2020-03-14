<?php

/**
 * Description of Keyboard
 * @author Ing.Douglas
 * @date 14/09/2016
 */

require_once($_SERVER['DOCUMENT_ROOT']."/call_center/Y_Template.class.php");


class Keyboard {
   function __construct() {}
   
   function show(){
       
       $protocol = "http";   
       
       if(isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == "on") { 
           $protocol = "https";   
       } 
       
       $path = "$protocol://".$_SERVER['SERVER_NAME'].":".$_SERVER['SERVER_PORT']."/call_center";   
       chdir($_SERVER['DOCUMENT_ROOT']."/call_center");        
       $k = new Y_Template("utils/Keyboard.html");  
       $k->Set("path",$path);                
       $k->Show("headerk");
       $k->Show("keyboard");
   }  
}

?>
