<?php
    include '../Class/dbClass.php';
    require '../config.php';
    $db=new dbClass;
    $db->connect($config);
    $rut_recuperado= $_GET["rut"];

    $no=1;
    $query=$db->query( "DELETE FROM turista WHERE rut_turista = '$rut_recuperado';");

    if(!$query){
    //Falta siguiente tabla
    }else{
    header('Location: index.php');
    }


 ?>
