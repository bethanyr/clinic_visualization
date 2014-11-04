var margin = {top: 20, right: 180, bottom: 30, left: 100},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var parseDate = d3.time.format("%d-%b-%y").parse;
var formatTime = d3.time.format("%d-%b-%y");// Format tooltip date / time


var x = d3.time.scale()
    .range([0, width]);

var y = d3.scale.linear()
    .range([height, 0]);

var color = d3.scale.category10();

var xAxis = d3.svg.axis().scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");

var line = d3.svg.line()
    //.interpolate("basis") // makes the dots off
    .x(function(d) { return x(d.date); })
    .y(function(d) { return y(d.number); });

var svg = d3.select("#chart2").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

var div = d3.select("#chart2")
    .append("div")  // declare the tooltip div 
    .attr("class", "tooltip")
    .style("opacity", 0);

//different json files
d3.json("diabetes.json", function(error, data) {
  color.domain(d3.keys(data[0]).filter(function(key) { if ( key !== "date" && key !== "link") {return true;} else {return false;} }));

  data.forEach(function(d) {
    d.date = parseDate(d.date);
    console.log(d.data);
  });

    data.forEach(function(d) {
    d.link = d.link;
  });

  var profiles = color.domain().map(function(name) {
    return {
      name: name,
      values: data.map(function(d) {
     
          return {date: d.date, number: +d[name]};
      })
    };
  });

  x.domain(d3.extent(data, function(d) { return d.date; }));

  y.domain([
    d3.min(profiles, function(c) { return d3.min(c.values, function(v) { return v.number; }); }),
    d3.max(profiles, function(c) { return d3.max(c.values, function(v) { return v.number; }) ; })
  ]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Unit");

  var profile = svg.selectAll(".profile")
      .data(profiles)
    .enter().append("g")
      .attr("class", "profile");

  profile.append("path")
      .attr("class", "line")
      .attr("d", function(d) { return line(d.values); })
      .style("stroke", function(d) { return color(d.name); });
                                         
    svg.selectAll("g.dot")
        .data(profiles)
        .enter().append("g")
        .attr("class", "dot")
        .selectAll("circle")
        .data(function(d) { return d.values; })
        .enter().append("circle")
        .attr("r", 3)
        .attr("cx", function(d,i) {  return x(d.date); })
        .attr("cy", function(d,i) { return y(d.number); }) //change the scale here
    // Tooltip stuff after this
        .on("mouseover", function(d) {        
            div.transition()
                .style("opacity", 0);
            div.transition()
                .style("opacity", .8);    
            div.html(
                //'<a href= "'+d.link+'" target="_blank">' + //with a link
                formatTime(d.date) +
                //"</a>" +
                "<br/>"  + d.number)     
                .style("left", (d3.event.pageX) + "px")             
                .style("top", (d3.event.pageY - 28) + "px")
                .attr("class", "info");
            })
        .on('mouseout', function(d) {
            d3.select('.info')
              .transition()
              .duration(2000)
              .style("opacity", 0); 
               
        });


  profile.append("text")
      .datum(function(d) { return {name: d.name, value: d.values[d.values.length - 1]}; })
      .attr("transform", function(d) { return "translate(" + x(d.value.date) + "," + y(d.value.number) + ")"; })
      .attr("x", 6)
      .attr("dy", ".35em")
      .text(function(d) { return d.name; });

});