<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>



<form class="registro" action="<?php echo base_url().'articulos/insertar'; ?>" method="post" enctype="multipart/form-data">
<div class="form-group row">
        <label for="imagen" class="col-sm-10 offset-2">
            <img for="imagen" id="imagenSrc" src="<?php echo base_url().'assets/img/imagen.jpg'; ?>">
        </label>
    </div>

    <div class="form-group row">

        <div class="col-sm-10 offset-2 mb-4">
            <i>(Subir imagen con ratio 1:1, ej:. 250x250)</i>
            <input type="file" name="imagen" class="form-control" id="imagen" onchange="leerRuta(this)">
        </div>
    </div>

    <div class="form-group row">
        <label for="nombre" class="col-sm-2 col-form-label">Nombre</label>
        
        <div class="col-sm-10">
            <input type="text" name="nombre" class="form-control" id="nombre">
        </div>
    </div>

    

    <div class="form-group row">
        <label for="descripcion" class="col-sm-2 col-form-label">Descripcion</label>
        
        <div class="col-sm-10">
            <textarea class="form-control" id="descripcion" name="descripcion" rows=15></textarea>
        </div>
    </div>

    <div class="form-group row">
        <label for="stock" class="col-sm-2 col-form-label">Stock</label>
        
        <div class="col-sm-2">
            <input type="number" min=0 name="stock" class="form-control" id="stock">
        </div>
    </div>


    <div class="form-group row">
        <label for="categoria" class="col-sm-2 col-form-label">Categoria</label>
        
        <div class="col-sm-2">
            <select class="form-control" name="categoria" id="categoria">
                <option value="Seleccionar">Seleccionar</option>
                
                <?php
                    foreach($categorias as $row) {
                        echo "<option value='".$row['k']."'>".$row['sNombre']."</option>";
                    }
                ?>
            </select>
        </div>
    </div>


    <div class="form-group row">
        <label for="marca" class="col-sm-2 col-form-label">Marca</label>
        
        <div class="col-sm-2">
            <select class="form-control" name="marca" id="marca">
                <option value="Seleccionar">Seleccionar</option>

                <?php
                    foreach($marcas as $row) {
                        echo "<option value='".$row['k']."'>".$row['sNombre']."</option>";
                    }
                ?>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="precio" class="col-sm-2 col-form-label">Precio (€)</label>
        
        <div class="col-sm-2">
            <input type="text" name="precio" class="form-control" id="precio">
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-outline-primary">Crear</button>
        </div>
    </div>

</form>