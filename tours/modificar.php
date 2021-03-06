<?php
  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $id_tour=$_GET['id'];
  $sql="SELECT * FROM tour WHERE tour.id_tour=$id_tour";
  $query=$db->query($sql);
  $array=pg_fetch_array($query);
?>
<!DOCTYPE html>
<html lang="es">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stylish Portfolio - Start Bootstrap Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="../vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/stylish-portfolio.min.css" rel="stylesheet">

  </head>

  <body id="page-top">

    <!-- Navigation -->
    <a class="menu-toggle rounded" href="#">
      <i class="fas fa-bars"></i>
    </a>
    <nav id="sidebar-wrapper">
      <ul class="sidebar-nav">
        <li class="sidebar-brand">
          <a href="/dbrebe">INICIO</a>
        </li>
        <li class="sidebar-nav-item">
          <a href="#">Tours</a>
        </li>
        <li class="sidebar-nav-item">
          <a href="">About</a>
        </li>
        <li class="sidebar-nav-item">
          <a href="">Services</a>
        </li>
        <li class="sidebar-nav-item">
          <a href="">Portfolio</a>
        </li>
        <li class="sidebar-nav-item">
          <a href="">Contact</a>
        </li>
      </ul>
    </nav>

    <!-- Header -->
    <header class="masthead d-flex">
      <div class="container">
        <form method="post" action="../tours/mod.php">
          <input type="hidden" name="id_tour" <?php echo "value='{$id_tour}'"; ?>>
            <div class="form-group">
              <label for="nombre_tour">Rut turista</label>
              <input type="text" class="form-control" name="nombre_tour" id="nombre_tour" <?php echo "value='{$array['nom_tour']}'"; ?>>
            </div>
            <div class="form-group">
              <label for="costo_tourind">Nombre turista</label>
              <input type="text" class="form-control" name="costo_tourind" id="costo_tourind" <?php echo "value='{$array['cost_tourind']}'"; ?>>
            </div>
          <div class="form-group">
            <label for="cost_tourg">Telefono turista</label>
            <input type="text" class="form-control" name="cost_tourg" id="cost_tourg" <?php echo "value='{$array['cost_tourg']}'"; ?>>
          </div>
          <div class="form-group">
            <label for="min_per">Descripcion enfermedad</label>
            <input type="text" class="form-control" name="min_per" id="min_per" <?php echo "value='{$array['min_ptour']}'"; ?>>
          </div>
          <a href="../tours"><button type="button" class="btn btn-primary" name="volver">Volver</button></a>
          <button type="submit" class="btn btn-primary">Modificar</button>
        </form>
      </div>
    </header>

    <!-- Footer -->
    <footer class="footer text-center">
      <div class="container">
        <ul class="list-inline mb-5">
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white mr-3" href="#">
              <i class="icon-social-facebook"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white mr-3" href="#">
              <i class="icon-social-twitter"></i>
            </a>
          </li>
          <li class="list-inline-item">
            <a class="social-link rounded-circle text-white" href="#">
              <i class="icon-social-github"></i>
            </a>
          </li>
        </ul>
        <p class="text-muted small mb-0">Copyright &copy; Your Website 2018</p>
      </div>
    </footer>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="../js/stylish-portfolio.min.js"></script>

  </body>

</html>
