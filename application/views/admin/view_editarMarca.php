<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>



<form action="<?php echo base_url().'marcas/actualizar/'.$detalles['k']; ?>" method="post">
    <div class="form-group row">
        <label for="id" class="col-sm-2 col-form-label">ID</label>
        
        <div class="col-sm-1">
            <input type="text" readonly value="<?php echo $detalles['k']; ?>" name="id" class="form-control" id="id">
        </div>
    </div>


    <div class="form-group row">
        <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
        
        <div class="col-sm-10">
            <input type="text" value="<?php echo $detalles['sNombre']; ?>" name="nombre" class="form-control" id="nombre">
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-outline-primary">Actualizar</button>
        </div>
    </div>

</form>