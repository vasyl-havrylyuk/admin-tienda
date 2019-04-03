<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>


<table class="table table-hover">
        <thead>
            <tr>
                <th class="align-middle">ID</th>
                <th>Categoria</th>
                <th class="text-center">Acción</th>
            </tr>
        </thead>

        <tbody>
            <?php
                foreach($categorias as $row) {
            ?>
                <tr>
                    <td><?php echo $row['k']; ?></td>
                    <td><?php echo $row['sNombre']; ?></td>
                    <td class="text-center">
                        <a href="categorias/editar/<?php echo $row['k']; ?>" class="fas fa-pen cursor-pointer px-2 text-primary no-underline"></a>
                        <i onclick="eliminar(<?php echo $row['k']; ?>)" class="fas fa-trash cursor-pointer px-2 text-dark no-underline"></i>
                    </td>
                </tr>
            <?php
                }
            ?>
        </tbody>
    </table>
</div>