<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>

<form action="<?php echo base_url(); ?>login/auth" method="post">
    <h5 class="text-center mb-3">Login</h5>

    <div class="form-group">
        <input type="text" name="usuario" placeholder="Usuario" class="form-control">
    </div>

    <div class="form-group">
        <input type="password" name="password" placeholder="Contraseña" class="form-control">
    </div>
    
    <div class="form-group text-center">
        <input type="submit" name="login" value="Login" class="btn btn-primary">
    </div>
    
    <?php
        if (isset($mensaje)) {
    ?>
            <div class="alert <?php echo $alert; ?> error" role="alert">
                Contraseña y/o password incorrecto/s
            </div>
    <?php
        }
    ?>

</form>