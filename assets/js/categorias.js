// VALIDAMOS EL FORMULARIO DE EDICIÓN Y CREACIÓN DE CATEGORIA
$('form').submit(function(event){
    $nombre = $('#nombre');
    
    if ($nombre.val() == "") {
        $nombre.addClass('is-invalid');
        event.preventDefault();
    }
});

// ELIMINAMSO CATEGORIA
function eliminar(id) {
    eliminar = confirm('¿Estas seguro de eliminar la categoria seleccionada?');

    if (eliminar) {
        location.href = "categorias/eliminar/"+id;
    } else {
        location.reload(); 
    }
}