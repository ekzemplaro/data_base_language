// ----------------------------------------------------------------------
//	line.js
//
//							Mar/29/2017
// ----------------------------------------------------------------------
const data_bar =
	{
        labels: ["15:00","15:10","15:20","15:30","15:40","15:50",
		"16:00","16:10",
		"16:20","16:30"],
        datasets: [{
		lineTension: 0,
		fill: false,
		label: '# deg',
		data: [12.3,11.5,4.1,5.2,6.0,4.3,
			7.2,9.1,12.0,10.4]
        }]
}

const options_bar =
	{
//	responsive: false,
	scales: {
		yAxes: [{
		ticks: {
			beginAtZero:true
			}
			}]
		}
	}

// ----------------------------------------------------------------------
window.onload = function()
{
	var ctx = document.getElementById ("myChart")

	var myChart = new Chart (ctx,
		{
		type: 'line',
		data: data_bar,
		options: options_bar
		})
}

// ----------------------------------------------------------------------
