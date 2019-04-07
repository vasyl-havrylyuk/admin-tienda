<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>



<form action="<?php echo base_url().'usuarios/insertar'; ?>" method="post">
    <div class="form-group row">
        <label for="usuario" class="col-sm-2 col-form-label">Usuario</label>
        
        <div class="col-sm-3">
            <input type="text" name="usuario" class="form-control" id="usuario">
        </div>
    </div>

    <div class="form-group row">
        <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
        
        <div class="col-sm-3">
            <input type="text" name="nombre" class="form-control" id="nombre">
        </div>
    </div>

    <div class="form-group row">
        <label for="apellido" class="col-sm-2 col-form-label">Apellidos</label>
        
        <div class="col-sm-4">
            <input type="text" name="apellido" class="form-control" id="apellido">
        </div>
    </div>

    <div class="form-group row">
        <label for="dni" class="col-sm-2 col-form-label">NIE / DNI</label>
        
        <div class="col-sm-2">
            <input type="text" name="dni" class="form-control" id="dni">
        </div>
    </div>

    <div class="form-group row">
        <label for="direccion" class="col-sm-2 col-form-label">Dirección</label>
        
        <div class="col-sm-4">
            <input type="text" name="direccion" class="form-control" id="direccion">
        </div>
    </div>

    <div class="form-group row">
        <label for="email" class="col-sm-2 col-form-label">Email</label>
        
        <div class="col-sm-4">
            <input type="email" name="email" class="form-control" id="email">
        </div>
    </div>

    <div class="form-group row">
        <label for="password" class="col-sm-2 col-form-label">Contraseña</label>
        
        <div class="col-sm-4">
            <input type="password" name="password" class="form-control" id="password">
        </div>
    </div>

    <div class="form-group row">
        <label for="rol" class="col-sm-2 col-form-label">Rol de usuario</label>
        
        <div class="col-sm-2">
            <select name="rol" id="rol" class="form-control">
                <option value="0">Cliente</option>
                <option value="1">Administrador</option>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-outline-primary">Crear</button>
        </div>
    </div>

</form>