var numMes = [01, 02, 03, 04, 05, 06, 07, 08, 09, 10, 11, 12];

var meses = [];

for (let i = 01; i < 12; i++) {
    $.getJSON("getGanancias", {"numMes": numMes[i]}, function(data){
        meses.push(data.numMes);
    });
}



setTimeout(function(){
    meses.sort(function(a,b){return a-b});

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
});
}, 200);