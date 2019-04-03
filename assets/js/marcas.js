// VALIDAMOS EL FORMULARIO DE EDICIÓN DE LA MARCA
$('form').submit(function(event){
    $nombre = $('#nombre');
    
    if ($nombre.val() == "") {
        $nombre.addClass('is-invalid');
        event.preventDefault();
    }
});


// ELIMINAMOS MARCA
function eliminar(id) {
    eliminar = confirm('¿Estas seguro de eliminar la marca seleccionada?');

    if (eliminar) {
        location.href = "marcas/eliminar/"+id;
    }
}