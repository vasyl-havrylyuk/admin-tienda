// ELIMINAMOS EL ERROR CUANDO NOS POSICIONEMOS SOBRE UNA CAJA
$('input, textarea, select').click(function(){$(this).removeClass('is-invalid');});
$('input, textarea, select').blur(function(){$(this).removeClass('is-invalid');});


// CON ESTAS DOS LINEAS CONSEGUIMOS CREAR EL EFECTO DEL BORDER RADIUS EN EL LATERAL DERECHO EN EL MENU
$('nav div.dropdown').last().mouseover(function(){$('.menu-items').css({'borderBottomRightRadius': '0px'});});
$('nav div.dropdown').last().mouseout(function(){$('.menu-items').css({'borderBottomRightRadius': '10px'});});



$('#notificacionWrapper').click(function(){
    getPedidos();
    $('#pedidos').modal('toggle');
});


function getPedidos() {
    $.getJSON('/admin/getPedidos', {}, function(data){
        actualizarModalYnotificacion(data);
    });
}

function actualizarModalYnotificacion(data) {
    $tituloModal = $('#pedidos .modal-title').empty();
    $('#pedidos .tablaPedidos tr:gt(0)').remove();
    $tablaModal = $('#pedidos .tablaPedidos');
    pedidosSinResolver = data.filter((obj) => obj.enviado === '0');
    $tituloModal.text(pedidosSinResolver.length+" PEDIDOS SIN RESOLVER");

    for (let i = 0; i < data.length; i++) {
        $row = $('<tr></tr>').appendTo($tablaModal);
        $td = $('<td class="text-center">'+data[i].pedido+'</td>').appendTo($row);
        $td = $('<td>'+data[i].nombre+'</td>').appendTo($row);
        $td = $('<td>'+data[i].apellido+'</td>').appendTo($row);
        $td = $('<td>'+data[i].direccion+'</td>').appendTo($row);
        
        $td_lineaPedido = $('<td class="text-center" target="_blank"></td>').appendTo($row);
        $ver = $('<a data-toggle="collapse" href="#pedido'+data[i].pedido+'" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">Ver</a>').appendTo($td_lineaPedido);
        $collapse = $('<div class="collapse multi-collapse" id="pedido'+data[i].pedido+'"></div>').appendTo($td_lineaPedido);
        $table = $('<table class="tablaArticulos"></table>').appendTo($collapse);
        $row_articulo = $('<tr></tr>').appendTo($table);
            $td = $('<td>#Id</td>').appendTo($row_articulo);
            $td = $('<td>Artículo</td>').appendTo($row_articulo);
            $td = $('<td>Cantidad</td>').appendTo($row_articulo);


        for (let j = 0; j < data[i].lineaPedido.length; j++) {
            $row_articulo = $('<tr></tr>').appendTo($table);
            $td = $('<td>'+data[i].lineaPedido[j].k+'</td>').appendTo($row_articulo);
            $td = $('<td><a href="/admin/articulos/editar/'+data[i].lineaPedido[j].k+'" target="_blank">'+data[i].lineaPedido[j].nombre+'</a></td>').appendTo($row_articulo);
            $td = $('<td>'+data[i].lineaPedido[j].cantidad+'</td>').appendTo($row_articulo);
        }
        

        switch(data[i].enviado) {
            case '0': 
                $td = $('<td class="text-center sinResolverWrapper"><i class="fas fa-times text-danger sinResolver"></i></td>').appendTo($row);
                $td.click({"pedido":data[i].pedido}, function(event){
                    
                    resolverPedido(event);
                    $(this).children('i').removeClass('fa-times text-danger sinResolver');
                    $(this).children('i').addClass('fa-check text-success enviado');
                    $(this).removeClass('sinResolverWrapper');
                    $(this).off();
                })
                break;
            case '1':
                $td = $('<td class="text-center"><i class="fas fa-check text-success enviado"></i></td>').appendTo($row);
                break;
        }
    }

    $('#notificacionWrapper .number').text(pedidosSinResolver.length);
}

function resolverPedido(event) {
    const pedido = event.data.pedido;
    $.post('/admin/resolverPedido', {"pedido":pedido}, function(){});
    getPedidos();
}