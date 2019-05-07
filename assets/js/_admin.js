// ELIMINAMOS EL ERROR CUANDO NOS POSICIONEMOS SOBRE UNA CAJA
$('input, textarea, select').click(function(){$(this).removeClass('is-invalid');});
$('input, textarea, select').blur(function(){$(this).removeClass('is-invalid');});


// CON ESTAS DOS LINEAS CONSEGUIMOS CREAR EL EFECTO DEL BORDER RADIUS EN EL LATERAL DERECHO EN EL MENU
$('nav div.dropdown').last().mouseover(function(){$('.menu-items').css({'borderBottomRightRadius': '0px'});});
$('nav div.dropdown').last().mouseout(function(){$('.menu-items').css({'borderBottomRightRadius': '10px'});});


/*

*/

$('#notificacionWrapper').click(function(){
    $.getJSON('getPedidos', {}, function(data){
        $tituloModal = $('#pedidos .modal-title').empty();
        $('#pedidos table tr:gt(0)').remove();
        $tablaModal = $('#pedidos table');
        $tituloModal.text(data.length+" PEDIDOS SIN RESOLVER");

        for (let i = 0; i < data.length; i++) {
            $row = $('<tr></tr>').appendTo($tablaModal);
            $td = $('<td class="text-center">'+data[i].pedido+'</td>').appendTo($row);
            $td = $('<td>'+data[i].nombre+'</td>').appendTo($row);
            $td = $('<td>'+data[i].apellido+'</td>').appendTo($row);
            $td = $('<td>'+data[i].direccion+'</td>').appendTo($row);
            $td = $('<td class="text-center" target="_blank"><a href="#">Ver</a></td>').appendTo($row);
            $td = $('<td class="text-center"><i class="fas fa-times text-danger estado"></i></td>').appendTo($row);
        }

        $('#pedidos').modal('toggle');
    });
});