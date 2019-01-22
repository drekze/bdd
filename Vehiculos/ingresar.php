<?php
  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $no=1;
  $query=$db->query("SELECT tour.id_tour,tour.nom_tour FROM tour");
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
          <a href="../">INICIO</a>
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
          <a href="#">Vehiculos</a>
        </li>
      </ul>
    </nav>

    <!-- Header -->
    <div class="container">
      <h2>Ingresar vehiculo</h2>
    </div>
      <div class="container">
        <form method="post" action="../Vehiculos/ing.php">
            <div class="form-group">
              <label for="patente">Patente</label>
              <input type="text" class="form-control" name="patente" id="patente" value="">
            </div>
            <div class="form-group">
              <label for="tour">Tours</label>
              <select class="form-control" name="tour" id="tour">
                <option value=''>-</option>
                <?php
                  while ($array=pg_fetch_array($query))
                    echo "<option value='{$array['id_tour']}'>{$array['nom_tour']}</option>";
                ?>
              </select>
            </div>
            <div class="form-group">
              <label for="rut_arren">Rut Arrendetario</label>
              <input type="text" class="form-control" name="rut_arren" id="rut_arren" value="">
            </div>
            <div class="form-group">
              <label for="nombre_arren">Nombre Arrendetario</label>
              <input type="text" class="form-control" name="nombre_arren" id="nombre_arren" value="">
            </div>
            <div class="form-group">
              <label for="contacto_arren">Contacto Arrendetario</label>
              <input type="text" class="form-control" name="contacto_arren" id="contacto_arren" value="">
            </div>
            <div class="form-group">
              <label for="telefono_arren">Telefono Arrendetario</label>
              <input type="text" class="form-control" name="telefono_arren" id="telefono_arren" value="">
            </div>
            <div class="form-group">
              <label for="marca">Marca</label>
              <input type="text" class="form-control" name="marca" id="marca" value="">
            </div>
          <div class="form-group">
            <label for="ano">Año del vehiculo</label>
            <input type="text" class="form-control" name="ano" id="ano" value="">
          </div>
          <div class="form-group">
            <label for="chofer">Nombre chofer</label>
            <input type="text" class="form-control" name="chofer" id="chofer" value="">
          </div>
          <div class="form-group">
            <label for="capacidad">Capacidad vehiculo</label>
            <input type="text" class="form-control" name="capacidad" id="capacidad" value="">
          </div>
          <div class="form-group">
            <label for="fecha">Capacidad vehiculo</label>
            <input type="date" class="form-control" name="fecha" id="fecha" value="">
          </div>
          <div class="form-group">
            <label for="arriendo">Precio arriendo</label>
            <input type="text" class="form-control" name="arriendo" id="arriendo" value="">
          </div>
          <a href="../Vehiculos"><button type="button" class="btn btn-primary" name="volver">Volver</button></a>
          <button type="submit" class="btn btn-primary">Ingresar</button>
        </form>
      </div>

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
