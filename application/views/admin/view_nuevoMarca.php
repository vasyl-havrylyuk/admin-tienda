<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>


<form action="<?php echo base_url().'marcas/insertar'; ?>" method="post">
    <div class="form-group row">
        <label for="nombre" class="col-sm-2 col-form-label">Nombre de marca</label>
        
        <div class="col-sm-5">
            <input type="text" name="nombre" class="form-control" id="nombre">
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-outline-primary">Crear</button>
        </div>
    </div>

</form>