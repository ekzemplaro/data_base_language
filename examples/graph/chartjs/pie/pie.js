// ----------------------------------------------------------------------
//	pie.js
//
//							Mar/29/2017
// ----------------------------------------------------------------------
const data_bar =
	{
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
		data: [12, 19, 3, 5, 2, 4],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
		],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
		],
            borderWidth: 1
        }]
}

const options_bar =
	{
	}

// ----------------------------------------------------------------------
window.onload = function()
{
	var ctx = document.getElementById ("myChart")

	var myChart = new Chart (ctx,
		{
		type: 'pie',
		data: data_bar,
		options: options_bar
		})

}

// ----------------------------------------------------------------------
