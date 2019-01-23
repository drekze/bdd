<?php
  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $rut_turista=$_POST['rut_turista'];
  $nombre=$_POST['nom_turist'];
  $tel_tur=$_POST['tel_tur'];
  $id_enfermedad=$_POST['id_enfermedad'];


  $sql="UPDATE turista SET rut_turista='{$rut_turista}', nom_turist='{$nombre}', tel_tur='{$tel_tur}' WHERE rut_turista = '$rut_turista'";
  $query=$db->query($sql);

  $sql2="UPDATE padece SET id_enfermedad={$id_enfermedad} WHERE rut_turista = '$rut_turista'";
  $query2=$db->query($sql2);
  if (!$query) {
    echo "error";
  }else{
    echo "<script type='text/javascript'>alert('turista modificado');window.location.href = '../turista';</script>";
  }
?>
