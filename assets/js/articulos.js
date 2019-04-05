// QUITAMOS LOS ESPACIOS INICIALES DEL
$('textarea').each(function(){
    $(this).val($(this).val().trim());
});


// VALIDAMOS EL FORMULARIO DE EDICIÓN Y CREACIÓN DE ARTICULO
$('form').submit(function(event){
    $nombre = $('#nombre');
    $descripcion = $('#descripcion');
    $imagen = $('#imagen');
    $stock = $('#stock');
    $categoria = $('#categoria');
    $marca = $('#marca');
    $precio = $('#precio');


    if ($nombre.val() == "") {
        $nombre.addClass('is-invalid');
        event.preventDefault();
    }

    if ($descripcion.val() == "") {
        $descripcion.addClass('is-invalid');
        event.preventDefault();
    }
    

    if ($(this).hasClass("edicion") && $imagen.val() != "" && !extensionCorrecta($imagen.val()) || $(this).hasClass("registro") && $imagen.val() == "" || $(this).hasClass("registro") && $imagen.val() != "" && !extensionCorrecta($imagen.val())) {
        $($imagen).addClass('is-invalid');
        event.preventDefault();
    }


    if ($stock.val() == "" || isNaN($stock.val())) {
        $stock.addClass('is-invalid');
        event.preventDefault();
    }

    if ($categoria.val() == "Seleccionar") {
        $categoria.addClass('is-invalid');
        event.preventDefault();
    }

    if ($marca.val() == "Seleccionar") {
        $marca.addClass('is-invalid');
        event.preventDefault();
    }


    if ($precio.val() == "" || isNaN($precio.val())) {
        $precio.addClass('is-invalid');
        event.preventDefault();
    }
});

function extensionCorrecta(imagen) {
    var extensiones_permitidas = ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'tiff', 'ico'];
    var extension_imagen = imagen.split('.').pop();

    if (extensiones_permitidas.indexOf(extension_imagen) != -1) {
        return true;
    } else {
        return false;
    }
}


// FUNCIÓN PARA ACTUALIZAR LA IMAGEN QUE SE MUESTRA A LA HORA DE CREAR O EDITAR UN NUEVO ARTICULO
function leerRuta(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {$('#imagenSrc').attr('src', e.target.result).width(250);};
        reader.readAsDataURL(input.files[0]);
    }

    $("form.registro div.row img").css({"opacity":"1"});
}



// SUSTITUIMOS LA COMA DEL PRECIO POR UN PUNTO Y ELIMINAMOS EL €
$('#precio').blur(function(){
    $('#precio').val($('#precio').val().replace(",", ".").replace("€", ""));});


// ELIMINAMOS ARTICULO
function eliminar(id) {
    eliminar = confirm('¿Estas seguro de eliminar el artículo seleccionado?');

    if (eliminar) {
        location.href = "articulos/eliminar/"+id;
    } else {
        location.reload(); 
    }
}