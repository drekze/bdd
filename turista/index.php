<?php
  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $no=1;
  $query=$db->query( "SELECT *
                      FROM turista left join padece using (rut_turista)
                      left join enfermedades using(id_enfermedad);");
?>
<!DOCTYPE html>
<html lang="en">

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
      <div class="container text-center my-auto">
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Rut</th>
              <th scope="col">Nombre turista</th>
              <th scope="col">Descripcion Enfermedad</th>
            </tr>
          </thead>
          <tbody>
            <?php
            while($array = pg_fetch_array($query)) {
              echo"
              <tr>
                <th scope='row'>{$no}</th>
                <td>{$array['rut_turista']}</td>
                <td>{$array['nom_turist']}</td>
                <td>{$array['desc_enfermedad']}</td>
                <td><a href='../turista/modificar.php?rut_turista={$array['rut_turista']}'><button type='button' class='btn btn-primary'>Modificar</button></a><a href='../turista/eliminar.php?rut={$array['rut_turista']}'><button type='button' class='btn btn-danger'>Eliminar</button></a></td>
              </tr>";
              $no++;
            }
             ?>
          </tbody>
        </table>
        <a href='../turista/insertar.php'><button type='button' class='btn btn-primary'>Insertar</button></a>
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
