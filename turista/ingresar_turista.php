<?php
  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $rut_turista=$_POST['rut_turista'];
  $nombre_turista=$_POST['nombre_turista'];
  $tel_turista=$_POST['tel_turista'];
  $fecha_nacimiento=$_POST['fecha_nacimiento'];
  $id_descuento=$_POST['id_descuento'];
  $id_enfermedad=$_POST['id_enfermedad'];


  $sql_ingresar="INSERT INTO turista(rut_turista,id_descuento,nom_turist,nom_tur_cont, tel_tur, fecha_nacimiento)
                      VALUES('$rut_turista',$id_descuento,'$nombre_turista','', $tel_turista,'2019-01-13')";
  $query=$db->query($sql_ingresar);
  if (!$query) {
    echo"asd";
  }else{
    $sql=" INSERT INTO padece(rut_turista, id_enfermedad)
            VALUES('$rut_turista','$id_enfermedad')";
    $query=$db->query($sql);

    if (!$query) {
      echo"asd";
    }else{
      echo "<script type='text/javascript'>alert('Turista ingresado');window.location.href = '../turista ';</script>";
    }
  }
?>
