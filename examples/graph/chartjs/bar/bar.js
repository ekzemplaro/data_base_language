// ----------------------------------------------------------------------
//	chartjs/bar/bar.js
//
//							Mar/31/2017
// ----------------------------------------------------------------------
const data_bar =
	{
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
		data: [12, 19, 3, 5, 2.5, 4]
        }]
}

const options_bar =
	{
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
		type: 'bar',
		data: data_bar,
		options: options_bar
		})

}

// ----------------------------------------------------------------------
