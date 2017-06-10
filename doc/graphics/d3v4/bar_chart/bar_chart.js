// ------------------------------------------------------------------------
//	bar_chart.js
//
//						Jun/02/2017
// ------------------------------------------------------------------------
const file_json="data.json"

jQuery.getJSON(file_json,function (data)
	{
	drawStackChart(data)
})


// ------------------------------------------------------------------------
    //Draw Stack Chart
const marginStackChart = { top: 20, right: 20, bottom: 30, left: 40 }
const widthStackChart = 500 - marginStackChart.left - marginStackChart.right
const heightStackChart = 300 - marginStackChart.top - marginStackChart.bottom

const xStackChart = d3.scaleBand()
            .range([0, widthStackChart])
            .padding(0.1)
const yStackChart = d3.scaleLinear()
                .range([heightStackChart, 0])


const colorStackChart = d3.scaleOrdinal(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"])


var canvasStackChart = d3.select("#Dash").append("svg")
        .attr("width", widthStackChart + marginStackChart.left + marginStackChart.right)
        .attr("height", heightStackChart + marginStackChart.top + marginStackChart.bottom)
        .append("g")
        .attr("transform", "translate(" + marginStackChart.left + "," + marginStackChart.top + ")");

// ------------------------------------------------------------------------
function drawStackChart(data)
{
	colorStackChart.domain(d3.keys(data[0]).filter(function (key) { return key !== "Year"; }));

	data.forEach(function (d) {
                var y0 = 0;
                d.ages = colorStackChart.domain().map(function (name) { return { name: name, y0: y0, y1: y0 += +d[name] }; });
                d.total = d.ages[d.ages.length - 1].y1;
            });

            data.sort(function (a, b) { return b.total - a.total; });

            xStackChart.domain(data.map(function (d) { return d.Year; }));
            yStackChart.domain([0, d3.max(data, function (d) { return d.total; })]);

            canvasStackChart.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + heightStackChart + ")")
            .call(d3.axisBottom(xStackChart));

            canvasStackChart.append("g")
            .attr("class", "y axis")
            .call(d3.axisLeft(yStackChart))
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 6)
            .attr("dy", ".71em")
            .style("text-anchor", "end")
            .text("No Of Buildings");

            var state = canvasStackChart.selectAll(".Year")
            .data(data)
            .enter().append("g")
            .attr("class", "g")
            .attr("transform", function (d) { return "translate(" + xStackChart(d.Year) + ",0)"; });

            state.selectAll("rect")
            .data(function (d) { return d.ages; })
            .enter().append("rect")
            .attr("width", xStackChart.bandwidth())
            .attr("y", function (d) { return yStackChart(d.y1); })
            .attr("height", function (d) { return yStackChart(d.y0) - yStackChart(d.y1); })
            .style("fill", function (d) { return colorStackChart(d.name); });

            var legend = canvasStackChart.selectAll(".legend")
            .data(colorStackChart.domain().slice().reverse())
            .enter().append("g")
            .attr("class", "legend")
            .attr("transform", function (d, i) { return "translate(0," + i * 20 + ")"; });

            legend.append("rect")
            .attr("x", widthStackChart - 18)
            .attr("width", 18)
            .attr("height", 18)
            .style("fill", colorStackChart);

            legend.append("text")
            .attr("x", widthStackChart - 24)
            .attr("y", 9)
            .attr("dy", ".35em")
            .style("text-anchor", "end")
            .text(function (d) { return d; });
}

// ------------------------------------------------------------------------
