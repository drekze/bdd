<?php
  include '../Class/dbClass.php';
  require '../config.php';
  $db=new dbClass;
  $db->connect($config);
  $rut_turista=$_GET['rut_turista'];
  $sql="              SELECT *
                      FROM turista left join padece using (rut_turista)
                      left join enfermedades using(id_enfermedad)
                      where rut_turista='$rut_turista';";
  $query=$db->query($sql);
  $array=pg_fetch_array($query);

  $query2=$db->query("SELECT * FROM enfermedades");

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
    <!-- Header -->
    <header class="masthead d-flex">
      <div class="container">
        <form method="post" action="../turista/mod.php">
            <div class="form-group">
              <label for="rut_turista">Rut turista</label>
              <input type="text" class="form-control" name="rut_turista" id="rut_turista" <?php echo "value='{$array['rut_turista']}'"; ?>>
            </div>
            <div class="form-group">
              <label for="nom_turist">Nombre turista</label>
              <input type="text" class="form-control" name="nom_turist" id="nom_turist" <?php echo "value='{$array['nom_turist']}'"; ?>>
            </div>
          <div class="form-group">
            <label for="tel_tur">Telefono turista</label>
            <input type="text" class="form-control" name="tel_tur" id="tel_tur" <?php echo "value='{$array['tel_tur']}'"; ?>>
          </div>
          <div class="form-group">
            <label for="desc_enfermedad">Descripcion enfermedad</label>
            <input type="text" class="form-control" disabled name="desc_enfermedad" id="desc_enfermedad" <?php echo "value='{$array['desc_enfermedad']}'"; ?>>
          </div>
          <div class="form-group">
            <label for="tour">Descripcion enfermedad a cambiar</label>
            <select class="form-control" name="id_enfermedad" id="id_enfermedad">
              <option value=''>-</option>
              <?php
                while ($array=pg_fetch_array($query2))
                  echo "<option value='{$array['id_enfermedad']}'>{$array['desc_enfermedad']}</option>";
              ?>
            </select>
          </div>
          <a href="../turista"><button type="button" class="btn btn-primary" name="volver">Volver</button></a>
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
