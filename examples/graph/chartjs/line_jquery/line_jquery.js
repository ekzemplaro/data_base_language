// ----------------------------------------------------------------------
//	line_jquery.js
//
//							Mar/31/2017
// ----------------------------------------------------------------------
const options_par =
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
function data_par_create_proc (res)
{
	jQuery("#outarea_bb").text ("res.lengh = " + res.length)

	var labels = new Array ()
	var data = new Array ()

	for (var it in res)
		{
		labels.push (res[it][0])
		data.push (res[it][1])
		}

	const data_par =
		{
		labels: labels,
		datasets: [{
			lineTension: 0,
			fill: false,
			label: '# deg',
			data: data
        		}]
		}

	return	data_par
}

// ----------------------------------------------------------------------
jQuery (function ()
{
	jQuery("#outarea_aa").text ("*** start ***")

	var ctx = document.getElementById ("myChart")

	const file_json = "data_in.json"

	jQuery.getJSON (file_json,function (res)
		{
		const data_par = data_par_create_proc (res)

		var myChart = new Chart (ctx,
			{
			type: 'line',
			data: data_par,
			options: options_par
			})
		})

	jQuery("#outarea_hh").text ("*** end ***")
})

// ----------------------------------------------------------------------
