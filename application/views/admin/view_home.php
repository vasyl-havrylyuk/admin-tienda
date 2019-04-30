<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>


<div class="modal fade" id="stock" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="url para actualizar" method="post">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Stock</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body"></div>
      </form>
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