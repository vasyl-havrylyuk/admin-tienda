<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    if (!isset($_SESSION['adminAutenticado'])) {
        header('Location: '.base_url().'login');
        exit;
    }

    $nombreAdmin = $this->BackModel->getNombreAdmin($_SESSION['id']);
?>
    
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="<?php echo base_url().'favicon.ico'; ?>" type="image/ico">
    <title><?php echo $titulo; ?></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    
    <link rel="stylesheet" href="<?php echo base_url()."assets/css/_admin.css"; ?>">
    
    <?php 
        if (!empty($style)) {
            echo "<link rel='stylesheet' href='" . base_url().'assets/css/'.$style . ".css'>";
        } 
    ?>

</head>
<body>
    
    <header class="mb-4">
        <nav class="py-2">
            <div class="container d-flex justify-content-between align-items-center">
                
                <div class="menu-items">
                    <a href="<?php echo base_url(); ?>" class="fas fa-home btn btn-outline-dark"></a>
            

                    <div class="dropdown">
                        <a class="dropbtn btn" href="<?php echo base_url().'articulos'; ?>">Artículos</a>
                        <div class="dropdown-content">
                            <a class="fas fa-plus" href="<?php echo base_url().'articulos/nuevo' ?>" title="Crear nuevo artículo"></a>
                        </div>
                    </div>

                    <div class="dropdown">
                        <a class="dropbtn btn" href="<?php echo base_url().'categorias'; ?>">Categorias</a>
                        <div class="dropdown-content">
                            <a class="fas fa-plus" href="<?php echo base_url().'categorias/nuevo' ?>" title="Crear nueva categoria"></a>
                        </div>
                    </div> 


                    <div class="dropdown">
                        <a class="dropbtn btn" href="<?php echo base_url().'marcas'; ?>">Marcas</a>
                        <div class="dropdown-content">
                            <a class="fas fa-plus" href="<?php echo base_url().'marcas/nuevo' ?>" title="Crear nueva marca"></a>
                        </div>
                    </div> 




                    <div class="dropdown">
                        <a class="dropbtn btn" href="<?php echo base_url().'usuarios'; ?>">Usuarios</a>
                        <div class="dropdown-content">
                            <a class="fas fa-plus" href="<?php echo base_url().'usuarios/nuevo' ?>" title="Crear nuevo usuario"></a>
                        </div>
                    </div> 
                    

                    
                </div>
        
                

                <div class="btn-group">
                    <div id="notificacionWrapper" class="d-flex align-items-center">
                        <i class="far fa-bell text-danger campana"></i>
                        <span class="badget number">2</span>
                    </div>


                    <button type="button" class="btn dropdown-toggle pr-0" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Bienvenido: <?php echo $nombreAdmin; ?>
                    </button>
        
                    <div class="dropdown-menu">
                        <a href="<?php echo base_url().'login/logout'; ?>" class="dropdown-item">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </nav>    
    </header>    

    

    <section>
        <div class="container">
            <h1 class="lead display-4 mb-4"><?php echo $titulo; ?></h1>
            
            <hr>

            <?php
                echo $contenido;
            ?>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.4.0.js" integrity="sha256-DYZMCC8HTC+QDr5QNaIcfR7VSPtcISykd+6eSmBW5qo=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
    <script src="<?php echo base_url()."assets/js/_admin.js"; ?>"></script>

    <?php 
        if (!empty($js)) {
            echo "<script src='" . base_url().'assets/js/'.$js . ".js'></script>";
        } 
    ?>
</body>
</html>