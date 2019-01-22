<?php

  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $patente=$_POST['patente'];
  $id_tour=$_POST['tour'];
  $rut_arren=$_POST['rut_arren'];
  $nombre_arren=$_POST['nombre_arren'];
  $contacto_arren=$_POST['contacto_arren'];
  $telefono_arren=$_POST['telefono_arren'];
  $capacidad=$_POST['capacidad'];
  $marca=$_POST['marca'];
  $ano=$_POST['ano'];
  $chofer=$_POST['chofer'];
  $arriendo=$_POST['arriendo'];
  $fecha=$_POST['fecha'];

  $sql_arrendataria="INSERT INTO arrendataria(ar_rut,ar_nombre,ar_contaacto,ar_telefono) VALUES('{$rut_arren}','{$nombre_arren}','{$contacto_arren}',$telefono_arren)";
  $query=$db->query($sql_arrendataria);
  if (!$query) {
    echo"asd";
  }else{
    $sql=" INSERT INTO vehiculo (veh_patente,ar_rut,id_tour,veh_ano,veh_marca,veh_capacidad,nom_chofer,fecha_dev,precio_arriendo)
          VALUES ('{$patente}','{$rut_arren}',$id_tour,$ano,'{$marca}',$capacidad,'{$chofer}','{$fecha}',$arriendo) ";
    $query=$db->query($sql);
    if (!$query) {
      echo"asd";
    }else{
      echo "<script type='text/javascript'>alert('Vehiculo ingresado');window.location.href = '../Vehiculos ';</script>";
    }
  }

?>
