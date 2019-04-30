var meses = new Array();

reiniciarMeses();

getGanancias($('select#verGanancia option').last().val());

$('select#verGanancia').change({}, getGanancias);

function getGanancias(evento) {
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

        inicializarGraficoGanancias(meses);
        
    });
}

function reiniciarMeses() {
    for (let i = 0; i < 12; i++) {
        meses[i] = 0;
    };
}

function inicializarGraficoGanancias(meses) {
    $gananciasWrapper = $('#gananciasWrapper').empty();
    $ganancias = $('<canvas id="ganancias"></canvas>');
    $gananciasWrapper.append($ganancias);

    var chart = new Chart($('#ganancias'), {
        // The type of chart we want to create
        type: 'line',
    
        // The data for our dataset
        data: {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            datasets: [{
                backgroundColor: '#e3ffbc',
                borderColor: '#7c0',
                data: meses,
                borderWidth: .7
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









getTopCompradores();

function getTopCompradores() {
    $.getJSON("getTopCompradores", {}, function(data){
        inicializarGraficoTopCompradores(data);
    });
}

function inicializarGraficoTopCompradores(data) {
    var chart = new Chart($('#topCompradores'), {
        type: 'pie',
        data: {
            ids: data.map(function (a) {return a.k}),
            labels: data.map(function(a) {return a.sUser;}),
            datasets: [{
                backgroundColor: ['#e4f8ff', '#ffe9da', '#e9ffe6'],
                borderColor: ['#0095c9', '#d45600', '#1df500'],
                data: data.map(function(a) {return a.compras;}),
                borderWidth: .5
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

    $('#topCompradores').click(function(evt){
        var activePoints = chart.getElementsAtEvent(evt);
        var activado = activePoints[0];
        var id = chart.data.ids[activado._index];
        
        if (activado) {
            window.location.href = "usuarios/editar/"+id;
        }
    });
}








getStocks();

function getStocks() {
    $.getJSON("getStocks", {}, function(data){
        inicializarGraficoStocks(data);
    });
}





function setStocks(id, valor) {
    $posAnt = $(document).scrollTop();
    $.post("setStock", {"id": id, "valor": valor}, function(data){
        getStocks();    
    });
    $('html, body').animate({scrollTop: $posAnt});
}

function inicializarGraficoStocks(data) {
    $stocksWrapper = $('#stocksWrapper').empty();
    $stocks = $('<canvas id="stocks"></canvas>');
    $stocksWrapper.append($stocks);

    var chart = new Chart($('#stocks'), {
        type: 'horizontalBar',
        data: {
            ids: data.map(function(a){return a.k;}),
            labels: data.map(function(a){return a.sNombre;}),
            datasets: [{
                backgroundColor: getBackgroundStock(data.map(function(a){return a.iStock;})),
                borderColor: getBorderStock(data.map(function(a){return a.iStock;})),
                data: data.map(function(a){return a.iStock;}),
                borderWidth: 1
            }]
        },
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
            },
            scales: {
                xAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });


    


    $('#stocks').click(function(evt){
        var activePoints = chart.getElementsAtEvent(evt);
        var activado = activePoints[0];
        var id = chart.data.ids[activado._index];
        var value = chart.data.datasets[activado._datasetIndex].data[activado._index];

        if (activado) {
            $modalBody = $('.modal-body').empty();
            $inputGroup = $('<div class="input-group"></div>').appendTo($modalBody);
            $stock = $('<input type="number" id="'+id+'" value="'+value+'" class="form-control" name="stock">').appendTo($inputGroup);
            
            $actualizarStock = $('<button type="button" class="btn btn-primary ml-3">Actualizar stock</button>')
                .appendTo($inputGroup);

            $actualizarStock.click({}, function(){
                $modalBody.children().each(function(){
                    $(this).animate({"display": "none"}, 0, function(){
                        $(this).remove()
                    })
                });

                $stockActualizado = $('<button type="button" class="btn" id="stockActualizado">Stock actualizado</button>')
                    .appendTo($modalBody)
                    .css({
                        "color": "#28a745",
                        "borderColor": "#28a745",
                        "cursor": "default"
                    })
                    .animate({
                        width: "100%"
                    }, 300);
                
                
                setStocks($stock.prop("id"), $stock.prop("value"));

                setTimeout(function(){
                    $('#stock').modal('toggle');
                }, 1100);
            });

            $('#stock').modal('toggle');
        }

    });
}

function getBackgroundStock(stock) {
    var tmp = new Array();
    for (let i = 0; i < stock.length; i++) {
        if (stock[i] < 20) tmp.push("#ffafaf");
        if (stock[i] >= 20 && stock[i] <= 30) tmp.push("#ffd19e");
        if (stock[i] > 30) tmp.push("#e3ffbc");
    }
    return tmp;
}

function getBorderStock(stock) {
    var tmp = new Array();
    for (let i = 0; i < stock.length; i++) {
        if (stock[i] < 20) tmp.push("#ed0000");
        if (stock[i] >= 20 && stock[i] <= 30) tmp.push("#e97a00");
        if (stock[i] > 30) tmp.push("#7c0");
    }
    return tmp;
}