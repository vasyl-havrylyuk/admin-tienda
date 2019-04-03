// QUITAMOS LOS ESPACIOS INICIALES DEL
$('textarea').each(function(){
    $(this).val($(this).val().trim());
});


// VALIDAMOS EL FORMULARIO DE EDICIÓN DE ARTICULO
$('form').submit(function(event){
    $nombre = $('#nombre');
    $descripcion = $('#descripcion');
    $stock = $('#stock');
    $precio = $('#precio');

    if ($nombre.val() == "") {
        $nombre.addClass('is-invalid');
        event.preventDefault();
    }

    if ($descripcion.val() == "") {
        $descripcion.addClass('is-invalid');
        event.preventDefault();
    }

    if ($stock.val() == "" || isNaN($stock.val())) {
        $stock.addClass('is-invalid');
        event.preventDefault();
    }

    if ($precio.val() == "" || isNaN($precio.val())) {
        $precio.addClass('is-invalid');
        event.preventDefault();
    }
});


// SUSTITUIMOS LA COMA DEL PRECIO POR UN PUNTO Y ELIMINAMOS EL €
$('#precio').keypress(function(){
    $('#precio').val($('#precio').val().replace(",", ".").replace("€", ""));
});


// ELIMINAMOS ARTICULO
function eliminar(id) {
    eliminar = confirm('¿Estas seguro de eliminar el artículo seleccionado?');

    if (eliminar) {
        location.href = "articulos/eliminar/"+id;
    }
}