// ------------------------------------------------------------------------
//	map_pref.js
//
//						mar/08/2018
// ------------------------------------------------------------------------
const file_json = "tochigi.json"

jQuery.getJSON(file_json,function (data)
	{
	jQuery("#outarea_aa").text ("*** start ***")
	draw_map_proc(data)
	jQuery("#outarea_hh").text ("*** end ***")
	})

// ------------------------------------------------------------------------
function draw_map_proc(data_in)
{
	const WIDTH = 700
	const HEIGHT = 560

	var svg = d3.selectAll("#map")
		.attr("width", WIDTH)
		.attr("height", HEIGHT);

	var gg = svg.append("g");

        var projection = d3.geoMercator()
            .scale(25000)
            .center(d3.geoCentroid(data_in))
            .translate([WIDTH / 2, HEIGHT / 2])

        var path = d3.geoPath()
            .projection(projection)

        gg.selectAll('path')
		.data(data_in.features)
		.enter()
		.append('path')
		.attr('d', path)
		.attr('class', 'area')
		.attr('data-address', function(d) {
			const pp = d.properties;
			if (pp.N03_007 == "09201")
				{
                		this.style.fill = 'red'
				}
			else if (pp.N03_007 == "09216")
				{
                		this.style.fill = 'green'
				}
			return pp.N03_007 + " " + pp.N03_004;
			})
/*
		.on('mouseover', function() {
                this.style.fill = 'red';
            })
            .on('mouseout', function() {
                this.style.fill = 'silver';
		})
*/
            .on('click', function() {
                this.style.fill = 'red';
	jQuery("#outarea_bb").text (this)
	jQuery("#outarea_cc").text (this.getAttribute('data-address'))
//		console.log(this)
            })

}

// ------------------------------------------------------------------------
