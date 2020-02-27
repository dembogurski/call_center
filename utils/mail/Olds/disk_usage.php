<?php

$dev = '/';
$freespace = disk_free_space($dev);
$totalspace = disk_total_space($dev);


$freespace_gb  = number_format($freespace/1024/1024/1024,2,',','.');  // GB
$totalspace_gb = number_format($totalspace/1024/1024/1024,2,',','.');  // GB

$used_space_gb = number_format($totalspace_gb - $freespace_gb ,2,',','.');

$freespace_percent = number_format((($freespace_gb * 100 ) / $totalspace_gb ) ,2,',','.');

$used_percent = number_format((( $used_space_gb * 100) / $totalspace_gb) ,2,',','.');

//echo $used_percent;
 
$text = "<label style='font-weight:bolder;color:red'>Alerta: El Servidor se Esta quedando Sin Espacio en Disco</label> <br><br>";
$text.= "Espacio Libre en Disco en el Servidor ('$dev')"."<br><br>";
$text.= "Espacio TOTAL:   $totalspace_gb GB<br><br>";
$text.= "Espacio Libre:   $freespace_gb GB<br><br>";
$text.= "Espacio Utilizado: <label style='font-weight:bolder;color:red'> $used_space_gb GB </label><br><br>";
$text.= "Porcentaje Utilizado :$used_percent%<br><br>";
$text.= "Porcentaje Libre:  $freespace_percent% <br><br>";


if($used_percent >= 85) // cuando sea mayor de 85% de uso
{
    $douglas = "dembogurski@gmail.com";
    $cacho = "jackchaman@gmail.com";
    $subject = "Espacio Libre en Disco en el Servidor ('$dev')";
	 
    enviarMail($douglas, $subject, $text, true);  
    enviarMail($cacho, $subject, $text, true);    
    enviarMail('0986393670@mms.tigo.com.py',"Hola Soy el Servidor, se esta llenando el disco",$text,true); 
}

function enviarMail($email,$subject, $message, $isHTML ) {
  
        require_once("phpmailer-gmail/class.phpmailer.php");
        require_once("phpmailer-gmail/class.smtp.php");
  
        $mail = new PHPMailer();
        $mail->IsSMTP();
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = "ssl";
        $mail->Host = "mail.marijoa.com";
        $mail->Port = 465;
        $mail->Username = "sistema@marijoa.com";
        $mail->Password = "rootdba";

        $mail->From = "sistema@marijoa.com";
        $mail->FromName = "ALERTA! Server HD";
        $mail->Subject = "$subject";
        $mail->MsgHTML("$message");
        $mail->AltBody = "$message";
    
        $mail->AddAddress("$email","$email" );
        
        $mail->IsHTML($isHTML);

        if(!$mail->Send()) {
           echo "Error: " . $mail->ErrorInfo;
        } else {
           echo "Mensaje enviado correctamente.../n <br>";
        }

    }

 
?>
