// ELIMINAMOS EL ERROR CUANDO NOS POSICIONEMOS SOBRE UNA CAJA
$('input, textarea, select').click(function(){
    $(this).removeClass('is-invalid');
});


// CON ESTAS DOS LINEAS CONSEGUIMOS CREAR EL EFECTO DEL BORDER RADIUS EN EL LATERAL DERECHO EN EL MENU
$('nav div.dropdown').last().mouseover(function(){$('.menu-items').css({'borderBottomRightRadius': '0px'});});
$('nav div.dropdown').last().mouseout(function(){$('.menu-items').css({'borderBottomRightRadius': '10px'});});