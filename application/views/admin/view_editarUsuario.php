<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>



<form action="<?php echo base_url().'usuarios/actualizar/'.$detalles['k']; ?>" method="post">
    <div class="form-group row">
        <label for="id" class="col-sm-2 col-form-label">ID</label>
        
        <div class="col-sm-1">
            <input type="text" readonly value="<?php echo $detalles['k']; ?>" name="id" class="form-control" id="id">
        </div>
    </div>


    <div class="form-group row">
        <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
        
        <div class="col-sm-3">
            <input type="text" value="<?php echo $detalles['sNombre']; ?>" name="nombre" class="form-control" id="nombre">
        </div>
    </div>

    <div class="form-group row">
        <label for="apellido" class="col-sm-2 col-form-label">Apellidos</label>
        
        <div class="col-sm-4">
            <input type="text" value="<?php echo $detalles['sApellido']; ?>" name="apellido" class="form-control" id="apellido">
        </div>
    </div>

    <div class="form-group row">
        <label for="dni" class="col-sm-2 col-form-label">NIE / DNI</label>
        
        <div class="col-sm-2">
            <input type="text" value="<?php echo $detalles['sDni']; ?>" name="dni" class="form-control" id="dni">
        </div>
    </div>

    <div class="form-group row">
        <label for="direccion" class="col-sm-2 col-form-label">Dirección</label>
        
        <div class="col-sm-4">
            <input type="text" value="<?php echo $detalles['sDireccion']; ?>" name="direccion" class="form-control" id="direccion">
        </div>
    </div>

    <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label">Email</label>
        
        <div class="col-sm-4">
            <input type="email" value="<?php echo $detalles['sEmail']; ?>" name="email" class="form-control" id="email">
        </div>
    </div>

    <div class="form-group row">
        <label for="registro" class="col-sm-2 col-form-label">Fecha de registro</label>
        
        <div class="col-sm-2">
            <input type="date" value="<?php echo $detalles['dFechaRegistro']; ?>" name="registro" class="form-control" id="registro">
        </div>
    </div>

    <div class="form-group row">
        <label for="rol" class="col-sm-2 col-form-label">Rol de usuario</label>
        
        <div class="col-sm-2">
            <select name="rol" id="rol" class="form-control">
                <?php
                    if ($detalles['bAdministrador']) {
                        echo "<option value='1' selected='selected'>Administrador</option>";
                        echo "<option value='0'>Cliente</option>";
                    } else {
                        echo "<option value='1'>Administrador</option>";
                        echo "<option value='0' selected='selected'>Cliente</option>";
                    }
                ?>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-outline-primary">Actualizar</button>
        </div>
    </div>

</form>