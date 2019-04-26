var meses = [];

// Inicialiazamos el array meses con 12 posiciones
reinicializarMeses();

// Mostramos las ganancias del año seleccionado por defecto
mostrarGanancias($('#verGanancia').val());

// Asignamos evento al select
$('#verGanancia').change(mostrarGanancias);




function mostrarGanancias(evento) {
    anio = evento || evento.target.value;

    $.getJSON("getGanancias", {"anio": evento.target.value}, function(data){
    
        // Ordenamos por fecha el array
        data.sort(function(a, b){
            return new Date(a.fecha) - new Date(b.fecha);
        });
    
        // Recorremos el array de las ganancias
        for (let i = 0; i < data.length; i++) {
            meses[new Date(data[i].fecha).getMonth()] += parseFloat(data[i].cantidad * data[i].pvp);
        }

        console.log(meses);

        reinicializarMeses();
    });
}



function reinicializarMeses() {
    for (let i = 0; i < 12; i++) {
        meses[i] = 0;
    };
}




/*
var chart = new Chart($('#ganancias'), {
    type: 'line',
    data: {
        labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        datasets: [
            {
                label: '',
                backgroundColor: '#ececec',
                borderColor: '#d1d1d1',
                data: meses
            }
        ]
    },

    options: {
        legend: {
            display: false
        }
    }
});*/