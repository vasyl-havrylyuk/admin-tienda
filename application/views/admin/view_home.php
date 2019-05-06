<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>


<div class="modal fade" id="pedidos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog pedidos" role="document">
    <div class="modal-content pedidos">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pedidos en curso</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th class="text-center">#</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Dirección</th>
                    <th class="text-center">Linea de pedido</th>
                    <th class="text-center">Cantidad</th>
                    <th class="text-center">Estado</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td class="text-center">1</td>
                    <td>Vasyl</td>
                    <td>Havrylyuk</td>
                    <td>Carrera 4, 7ªB</td>
                    <td class="text-center" target="_blank"><a href="#">Ver</a></td>
                    <td class="text-center">3</td>
                    <td class="text-center"><i class="fas fa-times text-danger estado"></i></td>
                </tr>
            </tbody>
        </table>
      </div>
    </div>
  </div>
</div>





<div class="modal fade" id="stock" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div>
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Stock</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body"></div>
      </div>
    </div>
  </div>
</div>


<div class="row">
    <div class="col-12 col-md-6 col-lg-7">
        <div class="mb-5">
            <h5 class="text-center">
                <div class="btn border">
                <i class="fas fa-dollar-sign text-success"></i> INGRESOS <select id="verGanancia">
                    <option>Fecha</option>
                    <?php
                        for ($i=2015; $i <= 2019; $i++) { 
                            echo "<option value='".$i."'>$i</option>";
                        }
                    ?>
                    </select>
                </div>
            </h5>
            
            <div id="gananciasWrapper">
            </div>
        </div>
    </div>

    <div class="col-12 col-md-6 col-lg-5">
        <div>
            <h5 class="text-center"><div class="btn border"><i class="fas fa-user-circle text-info"></i> TOP COMPRADORES</div></h5>
            
            <div id="topCompradoresWrapper">
                <canvas id="topCompradores"></canvas>
            </div>
        </div>
    </div>

</div>



<div class="row mb-5">
    <div class="col">
        <h4 class="text-center"><div class="btn border"><i class="fas fa-store text-warning"></i> STOCKS</div></h4>

        <div id="stocksWrapper">
        </div>
    </div>
</div>