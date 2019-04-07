
// VALIDAMOS EL FORMULARIO DE EDICIÓN Y CREACIÓN DE USUARIO
$('form').submit(function(event){
    $usuario = $('#usuario');
    $nombre = $('#nombre');
    $apellido = $('#apellido');
    $dni = $('#dni');
    $direccion = $('#direccion');
    $email = $('#email');
    $registro = $('#registro');
    $password = $('#password');
    $rol = $('#rol');
    
    if ($usuario.val() == "") {
        $usuario.addClass('is-invalid');
        event.preventDefault();
    }

    if ($nombre.val() == "") {
        $nombre.addClass('is-invalid');
        event.preventDefault();
    }

    if ($apellido.val() == "") {
        $apellido.addClass('is-invalid');
        event.preventDefault();
    }

    if ($dni.val() == "" || !/^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKET]{1}$/i.test($dni.val()) && !/^[XYZ]{1}[0-9]{7}[TRWAGMYFPDXBNJZSQVHLCKET]{1}$/i.test($dni.val())) {
        $dni.addClass('is-invalid');
        event.preventDefault();
    }

    if ($direccion.val() == "") {
        $direccion.addClass('is-invalid');
        event.preventDefault();
    }

    if ($email.val() == "") {
        $email.addClass('is-invalid');
        event.preventDefault();
    }

    if ($registro.val() == "") {
        $registro.addClass('is-invalid');
        event.preventDefault();
    }

    if ($password.val() == "") {
        $password.addClass('is-invalid');
        event.preventDefault();
    }

    
});


// ELIMINAMOS USUARIO
function eliminar(id) {
    eliminar = confirm('¿Estas seguro de eliminar el usuario seleccionado?');

    if (eliminar) {
        location.href = "usuarios/eliminar/"+id;
    } else {
        location.reload(); 
    }
}