<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
?>


<table class="table table-hover">
        <thead>
            <tr>
                <th class="align-middle">ID</th>
                <th>Usuario</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Fecha registro</th>
                <th class="text-center">Acción</th>
            </tr>
        </thead>

        <tbody>
            <?php
                foreach($usuarios as $row) {
            ?>
                <tr>
                    <td><?php echo $row['k']; ?></td>
                    <td><?php echo $row['sUser']; ?></td>
                    <td><?php echo $row['sNombre']; ?></td>
                    <td><?php echo $row['sApellido']; ?></td>
                    <td><?php echo $row['dFechaRegistro']; ?></td>
                    <td class="text-center">
                        <a href="usuarios/editar/<?php echo $row['k']; ?>" class="fas fa-pen cursor-pointer px-2 text-primary no-underline"></a>
                        <i onclick="eliminar(<?php echo $row['k']; ?>)" class="fas fa-trash cursor-pointer px-2 text-dark no-underline"></i>
                    </td>
                </tr>
            <?php
                }
            ?>
        </tbody>
    </table>
</div>
