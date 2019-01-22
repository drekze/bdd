<?php
  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $id=$_POST['id_tour'];
  $nombre=$_POST['nombre_tour'];
  $cost_tourg=$_POST['cost_tourg'];
  $cost_tourind=$_POST['costo_tourind'];
  $min_per=$_POST['min_per'];
  $sql="UPDATE tour SET nom_tour='{$nombre}', cost_tourg='{$cost_tourg}', cost_tourind='{$cost_tourind}', min_ptour='{$min_per}' WHERE id_tour = $id";
  $query=$db->query($sql);
  if (!$query) {
    echo "error";
  }else{
    echo "<script type='text/javascript'>alert('tour modificado');window.location.href = '../tours';</script>";
  }
?>
