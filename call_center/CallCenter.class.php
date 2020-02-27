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
 

 

new CallCenter();
?>
