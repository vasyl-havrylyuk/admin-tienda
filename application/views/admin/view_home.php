<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>

<div class="row">
    <div class="col-12 col-md-6 col-lg-7">
        <div class="mb-5">
            <h5 class="text-center">GANANCIAS <select id="verGanancia">
                <option>Fecha</option>
                <?php
                    for ($i=2015; $i <= 2019; $i++) { 
                        echo "<option value='".$i."'>$i</option>";
                    }
                ?>
            </select></h5>
            
            <div id="gananciasWrapper">
                <canvas id="ganancias"></canvas>
            </div>
        </div>
    </div>

    <div class="col-12 col-md-6 col-lg-5">
        <div>
            <h5 class="text-center">TOP COMPRADORES</h5>
            
            <div>
                <canvas id="topCompradores"></canvas>
            </div>
        </div>
    </div>

</div>



<div class="row">
    <div class="col">
        <h4 class="text-center">STOCKS</h4>

        <div>
            <canvas id="stocks"></canvas>
        </div>
    </div>
</div>