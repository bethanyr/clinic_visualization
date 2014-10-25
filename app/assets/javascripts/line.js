// Set the dimensions of the canvas / graph
var margin = {top: 30, right: 20, bottom: 30, left: 50},
    width = 600 - margin.left - margin.right,
    height = 270 - margin.top - margin.bottom;

// Parse the date / time
var parseDate = d3.time.format("%d-%b-%y").parse;
var formatTime = d3.time.format("%e %B");// Format tooltip date / time

// Set the rangestrann
var x = d3.time.scale().range([0, width]);
var y = d3.scale.linear().range([height, 0]);

// Define the axes
var xAxis = d3.svg.axis().scale(x)
    .orient("bottom").ticks(5);

var yAxis = d3.svg.axis().scale(y)
    .orient("left").ticks(5);

// Define the line
var valueline = d3.svg.line()
    .x(function(d) { return x(d.date); })
    .y(function(d) { return y(d.bp); });

var title = "Simple plot with links";

// Define 'div' for tooltips
var div = d3.select("div")
    .append("div")  // declare the tooltip div 
    .attr("class", "tooltip")
    .style("opacity", 0);

// Adds the svg canvas
var svg = d3.select("div")
    .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
    .append("g")
        .attr("transform", 
              "translate(" + margin.left + "," + margin.top + ")");

// Get the data
var url = '/flowchart/data.json';

d3.json(url, function(error, data) {
    console.log(data)
    data.forEach(function(d) {
        d.date = parseDate(d.date);
        d.bp = +d.bp;
    });


    // Scale the range of the data
    x.domain(d3.extent(data, function(d) { return d.date; }));
    y.domain([0, d3.max(data, function(d) { return d.bp; })]);

    // Add the valueline path.
    svg.append("path")        
        .attr("class", "line")
        .attr("d", valueline(data));

    // draw the scatterplot
    svg.selectAll("dot")                                    
        .data(data)                                            
    .enter().append("circle")                                
        .attr("r", 5)    
        .attr("cx", function(d) { return x(d.date); })         
        .attr("cy", function(d) { return y(d.bp); })
    // Tooltip stuff after this
        .on("mouseover", function(d) {        
            div.transition()
                .style("opacity", 0);
            div.transition()
                .style("opacity", .9);    
            div.html(
                '<a href= "'+d.link+'" target="_blank">' + //with a link
                formatTime(d.date) +
                "</a>" +
                "<br/>"  + d.bp)     
                .style("left", (d3.event.pageX) + "px")             
                .style("top", (d3.event.pageY - 28) + "px")
                .attr("class", "info");
            })
        .on('mouseout', function(d) {
            //d3.select('.info')
             // .style("opacity", 0.5); 
                
        });

    // Add the X Axis
    svg.append("g")    
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

    // Add the Y Axis
    svg.append("g")    
        .attr("class", "y axis")
        .call(yAxis);


    svg.append("text")          // Add the title shadow
        .attr("x", (width / 2))
        .attr("y", margin.top / 4)
        .attr("text-anchor", "middle")
        .attr("class", "shadow")
        .style("font-size", "16px")
        .text(title);

});