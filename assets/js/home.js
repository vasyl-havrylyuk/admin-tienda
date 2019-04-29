// Array que contendrá las ganancias de cada meses
var meses = new Array();

// Reiniciamos el array meses con 12 posiciones y valor 0
reiniciarMeses();

// Mostramos un grafico por defecto al iniciar la pagina
mostrarGanancias($('select#verGanancia option').last().val());

// Asignamos evento change al select de los años
$('select#verGanancia').change({}, mostrarGanancias);

function mostrarGanancias(evento) {
    $gananciasWrapper = $('#gananciasWrapper').empty();
    $ganancias = $('<canvas id="ganancias"></canvas>');
    $gananciasWrapper.append($ganancias);


    reiniciarMeses();

    anio = null;

    if (evento.target) anio = evento.target.value
    else anio = evento;
    
    
    $.getJSON("getGanancias", {"anio": anio}, function(data){
        // Ordenamos por fecha el array
        data.sort(function(a, b){
            return new Date(a.fecha) - new Date(b.fecha);
        });
        // Recorremos el array de las ganancias
        for (let i = 0; i < data.length; i++) {
            meses[new Date(data[i].fecha).getMonth()] += parseFloat(data[i].cantidad * data[i].pvp);
        }

        inicializarGrafico(meses);
        
    });
}

function reiniciarMeses() {
    for (let i = 0; i < 12; i++) {
        meses[i] = 0;
    };
}

function inicializarGrafico(meses) {
    var chart = new Chart($('#ganancias'), {
        // The type of chart we want to create
        type: 'line',
    
        // The data for our dataset
        data: {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            datasets: [{
                backgroundColor: '#e3ffbc',
                borderColor: '#7c0',
                data: meses
            }]
        },
    
        // Configuration options go here
        options: {
            legend: {
                display: false
            },

            hover: {
                onHover: function(e) {
                   var point = this.getElementAtEvent(e);
                   if (point.length) e.target.style.cursor = 'pointer';
                   else e.target.style.cursor = 'default';
                }
            }
        }
    })
}






var topCompradores = [];

$.getJSON("getTopCompradores", {}, function(data){
    
    for (let i = 0; i < data.length; i++) {
        topCompradores.push({
            "id": data[i].k,
            "user": data[i].sUser,
            "compras": data[i].compras
        });
    }

    var chart = new Chart($('#topCompradores'), {
        type: 'pie',
        data: {
            labels: topCompradores.map(function(a) {return a.user;}),
            datasets: [{
                backgroundColor: ['#e4f8ff', '#ffe9da', '#ffffd4'],
                borderColor: ['#0095c9', '#d45600', '#e4e400'],
                data: topCompradores.map(function(a) {return a.compras;})
            }]
        },
        options: {
            legend: {
                onHover: function(e) {
                   e.target.style.cursor = 'pointer';
                }
            },
            hover: {
                onHover: function(e) {
                   var point = this.getElementAtEvent(e);
                   if (point.length) e.target.style.cursor = 'pointer';
                   else e.target.style.cursor = 'default';
                }
            }
        }
    });

    document.getElementById("topCompradores").onclick = function(evt){
        var activePoints = chart.getElementsAtEvent(evt);
        var firstPoint = activePoints[0];
        var label = chart.data.labels[firstPoint._index];
        
        if (firstPoint !== undefined) {   
            for (let i = 0; i < topCompradores.length; i++) {
                if (topCompradores[i].user == label) {
                    window.location.href = "usuarios/editar/"+topCompradores[i].id;
                }
            }
        }
    };
});






$.getJSON("getStocks", {}, function(data){
    var nombres = data.map(function(a){return a.nombre;});
    var stocks = data.map(function(a){return a.stock;});

    var chart = new Chart($('#stocks'), {
        type: 'horizontalBar',
        data: {
            labels: nombres,
            datasets: [{
                backgroundColor: getBackgroundStock(stocks),
                data: stocks
            }]
        },
        options: {
            legend: false
        }
    });


    // Continuar por añadiendo el clickeable a cada articulo
});

function getBackgroundStock(stock) {
    var tmp = new Array();

    for (let i = 0; i < stock.length; i++) {
        if (stock[i] < 20) tmp.push("#ff7c7c");
        if (stock[i] > 20 && stock[i] < 30) tmp.push("#fff07c");
        if (stock[i] > 30) tmp.push("#c5ff7c");
    }

    return tmp;
}