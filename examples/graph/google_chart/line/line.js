// -----------------------------------------------------------------------
//	line.js
//
//					Mar/29/2017
//
// -----------------------------------------------------------------------
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// -----------------------------------------------------------------------
function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Time', 'deg A', 'deg B'],
          ['15:00',  18.3,      20.2],
          ['15:10',  18.1,      20.5],
          ['15:20',  19.3,      19.8],
          ['15:30',  20.5,      17.5],
          ['15:40',  19.3,      16.4],
          ['15:50',  18.3,      18.5],
          ['16:00',  17.3,      19.2],
          ['16:10',  18.2,      20.7],
          ['16:20',  19.3,      21.3],
          ['16:30',  19.8,      21.7]
        ])

var options = {
	title: 'Raspberry Pi Thermometer',
//	curveType: 'function',
	legend: { position: 'bottom' }
        }

var chart = new google.visualization.LineChart(document.getElementById('curve_chart'))

	chart.draw (data,options)
}

// -----------------------------------------------------------------------
