// ------------------------------------------------------------------------
//	map_pref.js
//
//						mar/08/2018
// ------------------------------------------------------------------------
(function(fn) {
    if (document.readyState !== 'loading'){
        fn();
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
})(function() {
	const WIDTH = 700
	const HEIGHT = 560;
	const file_json = "tochigi.json"

    var svg = d3.selectAll("#map")
        .attr("width", WIDTH)
        .attr("height", HEIGHT);

    var g = svg.append("g");

    d3.json(file_json).then(function(json) {
        var projection = d3.geoMercator()
            .scale(25000)
            .center(d3.geoCentroid(json))
            .translate([WIDTH / 2, HEIGHT / 2])

        var path = d3.geoPath()
            .projection(projection)

        g.selectAll('path')
            .data(json.features)
            .enter()
            .append('path')
            .attr('d', path)
            .attr('class', 'area')
    })
})

// ------------------------------------------------------------------------
