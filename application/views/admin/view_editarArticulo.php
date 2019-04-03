<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>



<form action="<?php echo base_url().'articulos/actualizar/'.$detalles['k']; ?>" method="post">
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
        <label for="descripcion" class="col-sm-2 col-form-label">Descripcion</label>
        
        <div class="col-sm-10">
            <textarea class="form-control" id="descripcion" name="descripcion" rows=15>
                <?php echo $detalles['sDescripcion']; ?>
            </textarea>
        </div>
    </div>


    <div class="form-group row">
        <label for="stock" class="col-sm-2 col-form-label">Stock</label>
        
        <div class="col-sm-2">
            <input type="number" min=0 value="<?php echo $detalles['iStock']; ?>" name="stock" class="form-control" id="stock">
        </div>
    </div>


    <div class="form-group row">
        <label for="categoria" class="col-sm-2 col-form-label">Categoria</label>
        
        <div class="col-sm-2">
            <select class="form-control" name="categoria" id="categoria">
                <?php
                    foreach($categorias as $row) {
                        if ($row['sNombre'] == $detalles['categoria']) {
                            echo "<option value='".$row['k']."' selected='selected'>".$row['sNombre']."</option>";
                        } else {
                            echo "<option value='".$row['k']."'>".$row['sNombre']."</option>";
                        }
                    }    
                ?>
            </select>
        </div>
    </div>


    <div class="form-group row">
        <label for="marca" class="col-sm-2 col-form-label">Marca</label>
        
        <div class="col-sm-2">
            <select class="form-control" name="marca" id="marca">
                <?php
                    foreach($marcas as $row) {
                        if ($row['sNombre'] == $detalles['marca']) {
                            echo "<option value='".$row['k']."' selected='selected'>".$row['sNombre']."</option>";
                        } else {
                            echo "<option value='".$row['k']."'>".$row['sNombre']."</option>";
                        }
                    }    
                ?>
            </select>
        </div>
    </div>

    <div class="form-group row">
        <label for="precio" class="col-sm-2 col-form-label">Precio (€)</label>
        
        <div class="col-sm-2">
            <input type="text" value="<?php echo $detalles['dPrecio']; ?>" name="precio" class="form-control" id="precio">
        </div>
    </div>

    <div class="form-group row">
        <div class="col-sm-10 offset-sm-2">
            <button type="submit" class="btn btn-outline-primary">Actualizar</button>
        </div>
    </div>

</form>