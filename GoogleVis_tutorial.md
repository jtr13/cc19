
# GoogleVis

Junyang Jiang and Alex Wan

## Overview

This section covers how to make charts with googleVis.

Google Charts Tools is a powerful online tool that enables users to create attractive graphical charts and embed them in Web pages with JavaScript. And the googleVis package can help R users take fully advantage of Google charts tools, which provides an interface between R and the Google charts tools and allows users to create interactive charts based on R data frames. This package (Version 0.6.4) provides interfaces to Motion Charts, Annotated Time, Lines, Maps, Geo Maps, Geo Charts, Intensity Maps, Tables, Gauges, Tree Maps, further Line, Bar, Bubble, Column, Area, Stepped Area, Combo, Scatter, Candlestick, Pie, Sankey, Annotation, Histogram, Timeline, Calendar and Org Charts.

## Example: Line chart

Let’s use GDP dataset from `wbstats` to have a look at how googleVis draws line chart.

Here’s the code for preparing dataset:


```r
library(wbstats)
suppressMessages(library(googleVis))
op <- options(gvis.plot.tag='chart') # set googleVis plot option to display chart in RMarkdown 

dat <- wb(indicator='NY.GDP.PCAP.KD', country=c('MX','CA','US','CH','IN','JP'), start=1980, end=2018)[c("country","value","date")]
gdp <- as.data.frame.matrix(xtabs(value ~ date + country, data=dat))
gdp <- cbind(rownames(gdp),gdp)
colnames(gdp)[1] <- "date"

head(gdp)
```

```
##      date   Canada    India    Japan   Mexico Switzerland United States
## 1980 1980 31839.23 422.9038 25854.58 8016.885    54891.43      28589.67
## 1981 1981 32542.60 438.0069 26744.56 8494.012    55466.16      29028.90
## 1982 1982 31132.46 442.7985 27443.61 8253.446    54420.97      28235.09
## 1983 1983 31628.16 464.1769 28217.50 7784.859    54534.43      29260.59
## 1984 1984 33182.41 470.9742 29301.37 7872.458    55973.70      31107.56
## 1985 1985 34438.33 484.6437 30646.88 7872.018    57774.34      32118.76
```

Then use the `gvisLineChart` method to initialize the chart and then the `plot()` method to render it:


```r
Line <- gvisLineChart(gdp, xvar = "date", yvar = c("Mexico", "United States"))
plot(Line)
```

<!-- LineChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartID71714347ebe0 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1980",
8016.884744,
28589.67273
],
[
"1981",
8494.012101,
29028.9015
],
[
"1982",
8253.446209,
28235.08967
],
[
"1983",
7784.85919,
29260.58618
],
[
"1984",
7872.457697,
31107.55962
],
[
"1985",
7872.017716,
32118.75943
],
[
"1986",
7470.792683,
32925.22668
],
[
"1987",
7445.85369,
33761.17884
],
[
"1988",
7393.108281,
34853.48847
],
[
"1989",
7548.976672,
35793.8965
],
[
"1990",
7790.799673,
36059.30163
],
[
"1991",
7970.144395,
35542.14111
],
[
"1992",
8104.291077,
36287.32286
],
[
"1993",
8117.089816,
36797.79765
],
[
"1994",
8373.513529,
37813.75818
],
[
"1995",
7717.721531,
38369.16184
],
[
"1996",
8109.198698,
39356.0918
],
[
"1997",
8530.355085,
40614.40561
],
[
"1998",
8835.875543,
41942.70951
],
[
"1999",
8946.132877,
43434.69267
],
[
"2000",
9253.968046,
44726.9654
],
[
"2001",
9088.053319,
44728.59748
],
[
"2002",
8960.554086,
45087.36728
],
[
"2003",
8967.02919,
45980.51458
],
[
"2004",
9190.741592,
47287.59377
],
[
"2005",
9270.656542,
48499.81238
],
[
"2006",
9547.333571,
49405.7673
],
[
"2007",
9622.047957,
49856.28149
],
[
"2008",
9587.636339,
49319.47886
],
[
"2009",
8947.741474,
47648.81325
],
[
"2010",
9271.398233,
48466.82338
],
[
"2011",
9477.887185,
48862.42494
],
[
"2012",
9690.869065,
49596.42192
],
[
"2013",
9693.722969,
50161.07582
],
[
"2014",
9839.050191,
51015.13548
],
[
"2015",
10037.20149,
52099.26976
],
[
"2016",
10206.89345,
52534.36528
],
[
"2017",
10297.58621,
53356.23624
],
[
"2018",
10385.29785,
54541.72052
] 
];
data.addColumn('string','date');
data.addColumn('number','Mexico');
data.addColumn('number','United States');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartID71714347ebe0() {
var data = gvisDataLineChartID71714347ebe0();
var options = {};
options["allowHtml"] = true;

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartID71714347ebe0')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartID71714347ebe0);
})();
function displayChartLineChartID71714347ebe0() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartID71714347ebe0"></script>
 
<!-- divChart -->
  
<div id="LineChartID71714347ebe0" 
  style="width: 500; height: automatic;">
</div>

where `xvar` is name of the character column which contains the category labels for the x-axes and `yvar` is a vector of column names of the numerical variables to be plotted. GoogleVis allows users to pass list of configuration options by using a named list `options`. The parameters have to map those
of [the Google documentation](https://google-developers.appspot.com/chart/interactive/docs/gallery/linechart#configuration-options). Note that you need to use the R syntax and wrap configuration options into a character. For more details see the Google API documentation and the googleVis Reference Manual.

In the following code, we create a line chart with two axis:


```r
Line <- gvisLineChart(gdp, xvar = "date", yvar = c("Mexico", "United States"),
                      options=list(
                         series="[{targetAxisIndex: 0},
                                 {targetAxisIndex:1}]",
                         vAxes="[{title:'Mexico'}, {title:'United States'}]"
                       ))
plot(Line)
```

<!-- LineChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartID717117eb8ce9 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1980",
8016.884744,
28589.67273
],
[
"1981",
8494.012101,
29028.9015
],
[
"1982",
8253.446209,
28235.08967
],
[
"1983",
7784.85919,
29260.58618
],
[
"1984",
7872.457697,
31107.55962
],
[
"1985",
7872.017716,
32118.75943
],
[
"1986",
7470.792683,
32925.22668
],
[
"1987",
7445.85369,
33761.17884
],
[
"1988",
7393.108281,
34853.48847
],
[
"1989",
7548.976672,
35793.8965
],
[
"1990",
7790.799673,
36059.30163
],
[
"1991",
7970.144395,
35542.14111
],
[
"1992",
8104.291077,
36287.32286
],
[
"1993",
8117.089816,
36797.79765
],
[
"1994",
8373.513529,
37813.75818
],
[
"1995",
7717.721531,
38369.16184
],
[
"1996",
8109.198698,
39356.0918
],
[
"1997",
8530.355085,
40614.40561
],
[
"1998",
8835.875543,
41942.70951
],
[
"1999",
8946.132877,
43434.69267
],
[
"2000",
9253.968046,
44726.9654
],
[
"2001",
9088.053319,
44728.59748
],
[
"2002",
8960.554086,
45087.36728
],
[
"2003",
8967.02919,
45980.51458
],
[
"2004",
9190.741592,
47287.59377
],
[
"2005",
9270.656542,
48499.81238
],
[
"2006",
9547.333571,
49405.7673
],
[
"2007",
9622.047957,
49856.28149
],
[
"2008",
9587.636339,
49319.47886
],
[
"2009",
8947.741474,
47648.81325
],
[
"2010",
9271.398233,
48466.82338
],
[
"2011",
9477.887185,
48862.42494
],
[
"2012",
9690.869065,
49596.42192
],
[
"2013",
9693.722969,
50161.07582
],
[
"2014",
9839.050191,
51015.13548
],
[
"2015",
10037.20149,
52099.26976
],
[
"2016",
10206.89345,
52534.36528
],
[
"2017",
10297.58621,
53356.23624
],
[
"2018",
10385.29785,
54541.72052
] 
];
data.addColumn('string','date');
data.addColumn('number','Mexico');
data.addColumn('number','United States');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartID717117eb8ce9() {
var data = gvisDataLineChartID717117eb8ce9();
var options = {};
options["allowHtml"] = true;
options["series"] = [{targetAxisIndex: 0},
                                 {targetAxisIndex:1}];
options["vAxes"] = [{title:'Mexico'}, {title:'United States'}];

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartID717117eb8ce9')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartID717117eb8ce9);
})();
function displayChartLineChartID717117eb8ce9() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartID717117eb8ce9"></script>
 
<!-- divChart -->
  
<div id="LineChartID717117eb8ce9" 
  style="width: 500; height: automatic;">
</div>

To smooth the lines, you can curve the Lines by setting the `curveType` option to `"function"`:


```r
Line <- gvisLineChart(gdp, xvar = "date", yvar = c("Mexico", "United States"),
                      options=list(
                        series="[{targetAxisIndex: 0},
                                 {targetAxisIndex:1}]",
                         vAxes="[{title:'Mexico'}, {title:'United States'}]",
                         curveType='function'
                       ))
plot(Line)
```

<!-- LineChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartID717162d1711d () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1980",
8016.884744,
28589.67273
],
[
"1981",
8494.012101,
29028.9015
],
[
"1982",
8253.446209,
28235.08967
],
[
"1983",
7784.85919,
29260.58618
],
[
"1984",
7872.457697,
31107.55962
],
[
"1985",
7872.017716,
32118.75943
],
[
"1986",
7470.792683,
32925.22668
],
[
"1987",
7445.85369,
33761.17884
],
[
"1988",
7393.108281,
34853.48847
],
[
"1989",
7548.976672,
35793.8965
],
[
"1990",
7790.799673,
36059.30163
],
[
"1991",
7970.144395,
35542.14111
],
[
"1992",
8104.291077,
36287.32286
],
[
"1993",
8117.089816,
36797.79765
],
[
"1994",
8373.513529,
37813.75818
],
[
"1995",
7717.721531,
38369.16184
],
[
"1996",
8109.198698,
39356.0918
],
[
"1997",
8530.355085,
40614.40561
],
[
"1998",
8835.875543,
41942.70951
],
[
"1999",
8946.132877,
43434.69267
],
[
"2000",
9253.968046,
44726.9654
],
[
"2001",
9088.053319,
44728.59748
],
[
"2002",
8960.554086,
45087.36728
],
[
"2003",
8967.02919,
45980.51458
],
[
"2004",
9190.741592,
47287.59377
],
[
"2005",
9270.656542,
48499.81238
],
[
"2006",
9547.333571,
49405.7673
],
[
"2007",
9622.047957,
49856.28149
],
[
"2008",
9587.636339,
49319.47886
],
[
"2009",
8947.741474,
47648.81325
],
[
"2010",
9271.398233,
48466.82338
],
[
"2011",
9477.887185,
48862.42494
],
[
"2012",
9690.869065,
49596.42192
],
[
"2013",
9693.722969,
50161.07582
],
[
"2014",
9839.050191,
51015.13548
],
[
"2015",
10037.20149,
52099.26976
],
[
"2016",
10206.89345,
52534.36528
],
[
"2017",
10297.58621,
53356.23624
],
[
"2018",
10385.29785,
54541.72052
] 
];
data.addColumn('string','date');
data.addColumn('number','Mexico');
data.addColumn('number','United States');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartID717162d1711d() {
var data = gvisDataLineChartID717162d1711d();
var options = {};
options["allowHtml"] = true;
options["series"] = [{targetAxisIndex: 0},
                                 {targetAxisIndex:1}];
options["vAxes"] = [{title:'Mexico'}, {title:'United States'}];
options["curveType"] = "function";

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartID717162d1711d')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartID717162d1711d);
})();
function displayChartLineChartID717162d1711d() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartID717162d1711d"></script>
 
<!-- divChart -->
  
<div id="LineChartID717162d1711d" 
  style="width: 500; height: automatic;">
</div>

Compared to `ggplot2`, googleVis provides more interactive features. For example, you can target a single element using [Crosshairs](https://google-developers.appspot.com/chart/interactive/docs/crosshairs):


```r
Line <- gvisLineChart(gdp, xvar = "date", yvar = c("Mexico", "United States"),
                      options=list(
                         series="[{targetAxisIndex: 0},
                                 {targetAxisIndex:1}]",
                         vAxes="[{title:'Mexico'}, {title:'United States'}]",
                         crosshair="{ trigger: 'both' }"
                       ))
plot(Line)
```

<!-- LineChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartID717156f6e0c2 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1980",
8016.884744,
28589.67273
],
[
"1981",
8494.012101,
29028.9015
],
[
"1982",
8253.446209,
28235.08967
],
[
"1983",
7784.85919,
29260.58618
],
[
"1984",
7872.457697,
31107.55962
],
[
"1985",
7872.017716,
32118.75943
],
[
"1986",
7470.792683,
32925.22668
],
[
"1987",
7445.85369,
33761.17884
],
[
"1988",
7393.108281,
34853.48847
],
[
"1989",
7548.976672,
35793.8965
],
[
"1990",
7790.799673,
36059.30163
],
[
"1991",
7970.144395,
35542.14111
],
[
"1992",
8104.291077,
36287.32286
],
[
"1993",
8117.089816,
36797.79765
],
[
"1994",
8373.513529,
37813.75818
],
[
"1995",
7717.721531,
38369.16184
],
[
"1996",
8109.198698,
39356.0918
],
[
"1997",
8530.355085,
40614.40561
],
[
"1998",
8835.875543,
41942.70951
],
[
"1999",
8946.132877,
43434.69267
],
[
"2000",
9253.968046,
44726.9654
],
[
"2001",
9088.053319,
44728.59748
],
[
"2002",
8960.554086,
45087.36728
],
[
"2003",
8967.02919,
45980.51458
],
[
"2004",
9190.741592,
47287.59377
],
[
"2005",
9270.656542,
48499.81238
],
[
"2006",
9547.333571,
49405.7673
],
[
"2007",
9622.047957,
49856.28149
],
[
"2008",
9587.636339,
49319.47886
],
[
"2009",
8947.741474,
47648.81325
],
[
"2010",
9271.398233,
48466.82338
],
[
"2011",
9477.887185,
48862.42494
],
[
"2012",
9690.869065,
49596.42192
],
[
"2013",
9693.722969,
50161.07582
],
[
"2014",
9839.050191,
51015.13548
],
[
"2015",
10037.20149,
52099.26976
],
[
"2016",
10206.89345,
52534.36528
],
[
"2017",
10297.58621,
53356.23624
],
[
"2018",
10385.29785,
54541.72052
] 
];
data.addColumn('string','date');
data.addColumn('number','Mexico');
data.addColumn('number','United States');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartID717156f6e0c2() {
var data = gvisDataLineChartID717156f6e0c2();
var options = {};
options["allowHtml"] = true;
options["series"] = [{targetAxisIndex: 0},
                                 {targetAxisIndex:1}];
options["vAxes"] = [{title:'Mexico'}, {title:'United States'}];
options["crosshair"] = { trigger: 'both' };

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartID717156f6e0c2')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartID717156f6e0c2);
})();
function displayChartLineChartID717156f6e0c2() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartID717156f6e0c2"></script>
 
<!-- divChart -->
  
<div id="LineChartID717156f6e0c2" 
  style="width: 500; height: automatic;">
</div>

This method are available for other charts including scatter charts, line charts, area charts, and combo charts. If the lines are too intensive or you would like to find detailed information of a line, you should use `explorer` function. This option allows users to pan and zoom Google charts. Setting `dragToZoom` allows users to zoom in and out when scrolling and `rightClickToReset` is for returning it to the original pan and zoom level clicking on the chart. You can also try other options like `dragToPan` and `explorer.maxZoomIn`.


```r
Line <- gvisLineChart(gdp,
                      options=list(
                         explorer="{actions: ['dragToZoom', 'rightClickToReset']}"
                       ))
plot(Line)
```

<!-- LineChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataLineChartID717121620568 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1980",
31839.23363,
422.9038045,
25854.57502,
8016.884744,
54891.43471,
28589.67273
],
[
"1981",
32542.60024,
438.0068722,
26744.55612,
8494.012101,
55466.16352,
29028.9015
],
[
"1982",
31132.46295,
442.7984657,
27443.60965,
8253.446209,
54420.97193,
28235.08967
],
[
"1983",
31628.16137,
464.1769346,
28217.49821,
7784.85919,
54534.42609,
29260.58618
],
[
"1984",
33182.41009,
470.9741936,
29301.36585,
7872.457697,
55973.70111,
31107.55962
],
[
"1985",
34438.3324,
484.643664,
30646.87862,
7872.017716,
57774.34434,
32118.75943
],
[
"1986",
34828.63349,
496.6394019,
31473.99843,
7470.792683,
58542.71181,
32925.22668
],
[
"1987",
35772.30578,
505.179043,
32801.20619,
7445.85369,
59098.51838,
33761.17884
],
[
"1988",
36868.8077,
542.0541896,
34877.65523,
7393.108281,
60588.59717,
34853.48847
],
[
"1989",
37052.38457,
562.2965258,
36422.60701,
7548.976672,
62703.5288,
35793.8965
],
[
"1990",
36557.63291,
581.2182147,
38074.46354,
7790.799673,
64343.51842,
36059.30163
],
[
"1991",
35353.02024,
575.5015,
39253.64184,
7970.144395,
62962.39135,
35542.14111
],
[
"1992",
35251.64081,
595.0134136,
39488.39343,
8104.291077,
62244.79697,
36287.32286
],
[
"1993",
35794.09466,
611.1188067,
39187.03454,
8117.089816,
61602.79012,
36797.79765
],
[
"1994",
36995.50215,
639.2687016,
39441.58676,
8373.513529,
61889.66595,
37813.75818
],
[
"1995",
37600.33012,
674.619503,
40368.71228,
7717.721531,
61773.0963,
38369.16184
],
[
"1996",
37811.71323,
711.9287753,
41514.89779,
8109.198698,
61833.00711,
39356.0918
],
[
"1997",
39039.98514,
727.0431212,
41861.75344,
8530.355085,
63127.73967,
40614.40561
],
[
"1998",
40226.62509,
757.9340506,
41277.06676,
8835.875543,
64822.29415,
41942.70951
],
[
"1999",
41960.23754,
810.2172168,
41097.9596,
8946.132877,
65607.20926,
43434.69267
],
[
"2000",
43724.16176,
826.5924254,
42169.73328,
9253.968046,
67807.92681,
44726.9654
],
[
"2001",
44025.54052,
851.6164995,
42239.18493,
9088.053319,
68264.52626,
44728.59748
],
[
"2002",
44863.21602,
869.2013162,
42190.80487,
8960.554086,
67860.24483,
45087.36728
],
[
"2003",
45261.33806,
922.1678844,
42744.01128,
8967.02919,
67385.29767,
45980.51458
],
[
"2004",
46225.36087,
979.2838292,
43671.67997,
9190.741592,
68781.61259,
47287.59377
],
[
"2005",
47257.4722,
1040.312274,
44393.62638,
9270.656542,
70471.43852,
48499.81238
],
[
"2006",
48014.9312,
1106.926392,
44995.49449,
9547.333571,
72823.83726,
49405.7673
],
[
"2007",
48536.53941,
1173.875326,
45687.27381,
9622.047957,
75143.70222,
49856.28149
],
[
"2008",
48497.56017,
1192.511764,
45165.78792,
9587.636339,
75793.63304,
49319.47886
],
[
"2009",
46542.90487,
1268.249168,
42724.76037,
8947.741474,
73189.19255,
47648.81325
],
[
"2010",
47450.31847,
1357.563701,
44507.67639,
9271.398233,
74605.72102,
48466.82338
],
[
"2011",
48466.85091,
1410.425876,
44538.72619,
9477.887185,
75029.75782,
48862.42494
],
[
"2012",
48788.33303,
1469.177562,
45276.87434,
9690.869065,
74984.13712,
49596.42192
],
[
"2013",
49400.4583,
1544.619197,
46249.20959,
9693.722969,
75499.70674,
50161.07582
],
[
"2014",
50309.1599,
1640.180647,
46484.15527,
9839.050191,
76410.85666,
51015.13548
],
[
"2015",
50279.58584,
1751.664378,
47102.58088,
10037.20149,
76553.28214,
52099.26976
],
[
"2016",
50263.83433,
1874.228501,
47444.14356,
10206.89345,
76934.32049,
52534.36528
],
[
"2017",
51150.75462,
1987.341087,
48438.83458,
10297.58621,
77451.9812,
53356.23624
],
[
"2018",
51382.42279,
2104.163292,
48919.56089,
10385.29785,
78816.21505,
54541.72052
] 
];
data.addColumn('string','date');
data.addColumn('number','Canada');
data.addColumn('number','India');
data.addColumn('number','Japan');
data.addColumn('number','Mexico');
data.addColumn('number','Switzerland');
data.addColumn('number','United States');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartLineChartID717121620568() {
var data = gvisDataLineChartID717121620568();
var options = {};
options["allowHtml"] = true;
options["explorer"] = {actions: ['dragToZoom', 'rightClickToReset']};

    var chart = new google.visualization.LineChart(
    document.getElementById('LineChartID717121620568')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "corechart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartLineChartID717121620568);
})();
function displayChartLineChartID717121620568() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartLineChartID717121620568"></script>
 
<!-- divChart -->
  
<div id="LineChartID717121620568" 
  style="width: 500; height: automatic;">
</div>

## Example: Geo Chart

Geochart is far more interesting chart for showing GDP for different countries.

> A geochart is a map of a country, a continent, or a region with areas identified in one of three ways:

> * The region mode colors whole regions, such as countries, provinces, or states.
> * The markers mode uses circles to designate regions that are scaled according to a value that you specify.
> * The text mode labels the regions with identifiers (e.g., "Russia" or "Asia").

In googleVis, creating geochart is simple. For regions mode format, you can call `gvisGeoChart` function and pass data containing region location and region color. Region location is a string of a country name (for example, "England") or region code name (for example, "US") or an area code. Region color is a numeric column used to assign a color to this region (for example, gdp value in our example). Note that [markers mode format](https://developers.google.com/chart/interactive/docs/gallery/geochart#markers-mode-format) and [text mode](https://developers.google.com/chart/interactive/docs/gallery/geochart#text-mode-format) format have slightly different formats.



```r
dat <- wb(indicator='NY.GDP.PCAP.KD', start=2018, end=2018)
Geo <- gvisGeoChart(dat, "iso2c", "value")
print(Geo)
```

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "https://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="https://www.w3.org/1999/xhtml">
<head>
<title>GeoChartID717141f2772d</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<style type="text/css">
body {
  color: #444444;
  font-family: Arial,Helvetica,sans-serif;
  font-size: 75%;
  }
  a {
  color: #4D87C7;
  text-decoration: none;
}
</style>
</head>
<body>
 <!-- GeoChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID717141f2772d () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1A",
6458.734486
],
[
"S3",
9038.953812
],
[
"B8",
16259.84994
],
[
"V2",
3732.285934
],
[
"Z4",
10259.496
],
[
"4E",
6470.431562
],
[
"T4",
6538.396476
],
[
"XC",
40949.01323
],
[
"Z7",
26221.24588
],
[
"7E",
9515.682799
],
[
"T7",
10160.53999
],
[
"EU",
37397.89292
],
[
"F1",
1593.289211
],
[
"XE",
901.0423858
],
[
"XD",
43504.76824
],
[
"XF",
6062.928833
],
[
"ZT",
4838.084413
],
[
"XH",
1762.713373
],
[
"XI",
1024.719023
],
[
"XG",
1277.400535
],
[
"V3",
8637.835913
],
[
"ZJ",
9550.784572
],
[
"XJ",
9190.79944
],
[
"T2",
9477.436574
],
[
"XL",
953.2544516
],
[
"XO",
4704.657536
],
[
"XM",
732.2782282
],
[
"XN",
2259.336602
],
[
"ZQ",
7845.805914
],
[
"XP",
5197.101574
],
[
"XU",
54226.6303
],
[
"OE",
39929.77719
],
[
"S4",
13717.71156
],
[
"S2",
3411.06416
],
[
"V4",
43971.42858
],
[
"V1",
1490.459033
],
[
"S1",
12245.61236
],
[
"8S",
1890.34994
],
[
"T5",
1890.34994
],
[
"ZG",
1656.926845
],
[
"ZF",
1655.784319
],
[
"T6",
1656.926845
],
[
"XT",
8537.981517
],
[
"1W",
10881.13945
],
[
"AF",
563.8256627
],
[
"AL",
5075.354985
],
[
"DZ",
4815.570527
],
[
"AD",
44569.78301
],
[
"AO",
3229.61974
],
[
"AG",
15061.58636
],
[
"AR",
10040.13074
],
[
"AM",
4406.706434
],
[
"AU",
56919.37428
],
[
"AT",
50250.04506
],
[
"AZ",
5768.992405
],
[
"BH",
21438.59108
],
[
"BD",
1203.216265
],
[
"BY",
6744.49867
],
[
"BE",
46683.15741
],
[
"BZ",
4309.919986
],
[
"BJ",
896.3243679
],
[
"BT",
3172.773862
],
[
"BO",
2559.511317
],
[
"BA",
6056.244945
],
[
"BW",
8031.014943
],
[
"BR",
11026.24216
],
[
"BN",
31436.94859
],
[
"BG",
8651.094801
],
[
"BF",
709.7551881
],
[
"BI",
210.7835697
],
[
"CV",
3786.734051
],
[
"KH",
1205.29295
],
[
"CM",
1497.783485
],
[
"CA",
51382.42279
],
[
"CF",
384.7800008
],
[
"TD",
813.3424788
],
[
"CL",
15130.15432
],
[
"CN",
7754.962119
],
[
"CO",
7698.412245
],
[
"KM",
1362.638528
],
[
"CD",
418.7386231
],
[
"CG",
2651.700719
],
[
"CR",
9892.64112
],
[
"CI",
1692.544476
],
[
"HR",
15870.28116
],
[
"CY",
30926.45172
],
[
"CZ",
23358.87295
],
[
"DK",
62931.24308
],
[
"DM",
6416.921969
],
[
"DO",
7750.933656
],
[
"EC",
5185.091461
],
[
"EG",
2907.317585
],
[
"SV",
3511.364377
],
[
"GQ",
10602.28616
],
[
"EE",
19948.92283
],
[
"SZ",
4820.024141
],
[
"ET",
570.3056768
],
[
"FJ",
4858.524092
],
[
"FI",
48444.74186
],
[
"FR",
43663.58492
],
[
"GA",
9077.011554
],
[
"GM",
518.8490065
],
[
"GE",
4469.182977
],
[
"DE",
47501.81265
],
[
"GH",
1807.06354
],
[
"GR",
23558.08397
],
[
"GD",
9205.653919
],
[
"GT",
3160.005492
],
[
"GN",
943.3600341
],
[
"GW",
622.0798254
],
[
"GY",
3965.973335
],
[
"HT",
730.2966712
],
[
"HN",
2203.949163
],
[
"HK",
38784.75557
],
[
"HU",
16503.47219
],
[
"IS",
52103.1703
],
[
"IN",
2104.163292
],
[
"ID",
4284.652535
],
[
"IQ",
5510.758895
],
[
"IE",
76880.80771
],
[
"IL",
34788.65793
],
[
"IT",
35391.70548
],
[
"JM",
4841.653326
],
[
"JP",
48919.56089
],
[
"JO",
3236.949148
],
[
"KZ",
11165.54436
],
[
"KE",
1202.133023
],
[
"KI",
1762.305861
],
[
"KR",
26761.94138
],
[
"XK",
4193.631327
],
[
"KW",
33537.85153
],
[
"KG",
1087.204062
],
[
"LA",
1789.135301
],
[
"LV",
16405.73322
],
[
"LB",
6249.766655
],
[
"LS",
1401.611115
],
[
"LR",
541.2713241
],
[
"LY",
7528.970075
],
[
"LT",
17669.65898
],
[
"LU",
107243.2375
],
[
"MO",
58054.08264
],
[
"MG",
432.6578354
],
[
"MW",
516.7540552
],
[
"MY",
12109.48855
],
[
"MV",
8049.933835
],
[
"ML",
777.8605975
],
[
"MT",
28385.06497
],
[
"MH",
3254.830736
],
[
"MR",
1349.374452
],
[
"MU",
10578.61732
],
[
"MX",
10385.29785
],
[
"FM",
2773.560364
],
[
"MD",
2684.143102
],
[
"MN",
4197.755982
],
[
"ME",
8226.598844
],
[
"MA",
3357.359102
],
[
"MZ",
539.1833403
],
[
"MM",
1571.907217
],
[
"NA",
6073.194376
],
[
"NR",
9962.388924
],
[
"NP",
812.2363603
],
[
"NL",
55022.91819
],
[
"NZ",
38000.12988
],
[
"NI",
1860.431709
],
[
"NE",
398.5200428
],
[
"NG",
2396.310914
],
[
"MK",
5394.288478
],
[
"NO",
92121.42113
],
[
"OM",
15663.9053
],
[
"PK",
1196.594136
],
[
"PW",
12853.73601
],
[
"PA",
11723.93056
],
[
"PG",
2400.21576
],
[
"PY",
5394.461414
],
[
"PE",
6453.922634
],
[
"PH",
3021.986863
],
[
"PL",
16639.72798
],
[
"PT",
23737.65871
],
[
"PR",
27340.65417
],
[
"QA",
63222.10607
],
[
"RO",
11534.85862
],
[
"RU",
11729.09437
],
[
"RW",
826.3385196
],
[
"WS",
3894.337974
],
[
"ST",
1297.358572
],
[
"SA",
20775.20181
],
[
"SN",
1546.520159
],
[
"RS",
6880.533595
],
[
"SC",
14385.30181
],
[
"SL",
474.1134401
],
[
"SG",
58247.87264
],
[
"SK",
20669.90426
],
[
"SI",
26758.90229
],
[
"SB",
1477.005999
],
[
"ZA",
7439.919412
],
[
"ES",
33146.39167
],
[
"LK",
3936.450246
],
[
"KN",
18011.18764
],
[
"LC",
8503.45275
],
[
"VC",
6875.486286
],
[
"SD",
1855.626292
],
[
"SR",
8048.614313
],
[
"SE",
57232.08549
],
[
"CH",
78816.21505
],
[
"TJ",
1073.021835
],
[
"TZ",
957.1259352
],
[
"TH",
6361.62499
],
[
"TL",
2759.526494
],
[
"TG",
672.4947925
],
[
"TO",
4054.940955
],
[
"TT",
15288.93154
],
[
"TN",
4402.0237
],
[
"TR",
15026.70752
],
[
"TM",
7647.935804
],
[
"TV",
3636.055006
],
[
"UG",
709.6658061
],
[
"UA",
3110.194646
],
[
"AE",
40782.36811
],
[
"GB",
42986.03288
],
[
"US",
54541.72052
],
[
"UY",
14617.464
],
[
"UZ",
2026.540839
],
[
"VU",
2863.228634
],
[
"VN",
1964.475991
],
[
"PS",
2680.318123
],
[
"YE",
667.9454369
],
[
"ZM",
1672.345428
],
[
"ZW",
1322.344063
] 
];
data.addColumn('string','iso2c');
data.addColumn('number','value');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID717141f2772d() {
var data = gvisDataGeoChartID717141f2772d();
var options = {};
options["width"] = 556;
options["height"] = 347;

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID717141f2772d')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID717141f2772d);
})();
function displayChartGeoChartID717141f2772d() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID717141f2772d"></script>
 
<!-- divChart -->
  
<div id="GeoChartID717141f2772d" 
  style="width: 556; height: 347;">
</div>
 <div><span>Data: dat &#8226; Chart ID: <a href="Chart_GeoChartID717141f2772d.html">GeoChartID717141f2772d</a> &#8226; <a href="https://github.com/mages/googleVis">googleVis-0.6.4</a></span><br /> 
<!-- htmlFooter -->
<span> 
  R version 3.6.1 (2017-01-27) 
  &#8226; <a href="https://developers.google.com/terms/">Google Terms of Use</a> &#8226; <a href="https://google-developers.appspot.com/chart/interactive/docs/gallery/geochart">Documentation and Data Policy</a>
</span></div>
</body>
</html>

Like other chart, you can customize the colors of GeoCharts for background color, chart fill color, chart border color, etc. Please check [correct format](https://developers.google.com/chart/interactive/docs/gallery/geochart#coloring-your-chart).


```r
Geo <- gvisGeoChart(dat, "iso2c", "value",
                    options=list(
                         colorAxis="{colors:['yellow', 'orange', 'red', 'purple']}",
                         backgroundColor="lightblue")
                       )
print(Geo)
```

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "https://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="https://www.w3.org/1999/xhtml">
<head>
<title>GeoChartID7171505391ae</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<style type="text/css">
body {
  color: #444444;
  font-family: Arial,Helvetica,sans-serif;
  font-size: 75%;
  }
  a {
  color: #4D87C7;
  text-decoration: none;
}
</style>
</head>
<body>
 <!-- GeoChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID7171505391ae () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"1A",
6458.734486
],
[
"S3",
9038.953812
],
[
"B8",
16259.84994
],
[
"V2",
3732.285934
],
[
"Z4",
10259.496
],
[
"4E",
6470.431562
],
[
"T4",
6538.396476
],
[
"XC",
40949.01323
],
[
"Z7",
26221.24588
],
[
"7E",
9515.682799
],
[
"T7",
10160.53999
],
[
"EU",
37397.89292
],
[
"F1",
1593.289211
],
[
"XE",
901.0423858
],
[
"XD",
43504.76824
],
[
"XF",
6062.928833
],
[
"ZT",
4838.084413
],
[
"XH",
1762.713373
],
[
"XI",
1024.719023
],
[
"XG",
1277.400535
],
[
"V3",
8637.835913
],
[
"ZJ",
9550.784572
],
[
"XJ",
9190.79944
],
[
"T2",
9477.436574
],
[
"XL",
953.2544516
],
[
"XO",
4704.657536
],
[
"XM",
732.2782282
],
[
"XN",
2259.336602
],
[
"ZQ",
7845.805914
],
[
"XP",
5197.101574
],
[
"XU",
54226.6303
],
[
"OE",
39929.77719
],
[
"S4",
13717.71156
],
[
"S2",
3411.06416
],
[
"V4",
43971.42858
],
[
"V1",
1490.459033
],
[
"S1",
12245.61236
],
[
"8S",
1890.34994
],
[
"T5",
1890.34994
],
[
"ZG",
1656.926845
],
[
"ZF",
1655.784319
],
[
"T6",
1656.926845
],
[
"XT",
8537.981517
],
[
"1W",
10881.13945
],
[
"AF",
563.8256627
],
[
"AL",
5075.354985
],
[
"DZ",
4815.570527
],
[
"AD",
44569.78301
],
[
"AO",
3229.61974
],
[
"AG",
15061.58636
],
[
"AR",
10040.13074
],
[
"AM",
4406.706434
],
[
"AU",
56919.37428
],
[
"AT",
50250.04506
],
[
"AZ",
5768.992405
],
[
"BH",
21438.59108
],
[
"BD",
1203.216265
],
[
"BY",
6744.49867
],
[
"BE",
46683.15741
],
[
"BZ",
4309.919986
],
[
"BJ",
896.3243679
],
[
"BT",
3172.773862
],
[
"BO",
2559.511317
],
[
"BA",
6056.244945
],
[
"BW",
8031.014943
],
[
"BR",
11026.24216
],
[
"BN",
31436.94859
],
[
"BG",
8651.094801
],
[
"BF",
709.7551881
],
[
"BI",
210.7835697
],
[
"CV",
3786.734051
],
[
"KH",
1205.29295
],
[
"CM",
1497.783485
],
[
"CA",
51382.42279
],
[
"CF",
384.7800008
],
[
"TD",
813.3424788
],
[
"CL",
15130.15432
],
[
"CN",
7754.962119
],
[
"CO",
7698.412245
],
[
"KM",
1362.638528
],
[
"CD",
418.7386231
],
[
"CG",
2651.700719
],
[
"CR",
9892.64112
],
[
"CI",
1692.544476
],
[
"HR",
15870.28116
],
[
"CY",
30926.45172
],
[
"CZ",
23358.87295
],
[
"DK",
62931.24308
],
[
"DM",
6416.921969
],
[
"DO",
7750.933656
],
[
"EC",
5185.091461
],
[
"EG",
2907.317585
],
[
"SV",
3511.364377
],
[
"GQ",
10602.28616
],
[
"EE",
19948.92283
],
[
"SZ",
4820.024141
],
[
"ET",
570.3056768
],
[
"FJ",
4858.524092
],
[
"FI",
48444.74186
],
[
"FR",
43663.58492
],
[
"GA",
9077.011554
],
[
"GM",
518.8490065
],
[
"GE",
4469.182977
],
[
"DE",
47501.81265
],
[
"GH",
1807.06354
],
[
"GR",
23558.08397
],
[
"GD",
9205.653919
],
[
"GT",
3160.005492
],
[
"GN",
943.3600341
],
[
"GW",
622.0798254
],
[
"GY",
3965.973335
],
[
"HT",
730.2966712
],
[
"HN",
2203.949163
],
[
"HK",
38784.75557
],
[
"HU",
16503.47219
],
[
"IS",
52103.1703
],
[
"IN",
2104.163292
],
[
"ID",
4284.652535
],
[
"IQ",
5510.758895
],
[
"IE",
76880.80771
],
[
"IL",
34788.65793
],
[
"IT",
35391.70548
],
[
"JM",
4841.653326
],
[
"JP",
48919.56089
],
[
"JO",
3236.949148
],
[
"KZ",
11165.54436
],
[
"KE",
1202.133023
],
[
"KI",
1762.305861
],
[
"KR",
26761.94138
],
[
"XK",
4193.631327
],
[
"KW",
33537.85153
],
[
"KG",
1087.204062
],
[
"LA",
1789.135301
],
[
"LV",
16405.73322
],
[
"LB",
6249.766655
],
[
"LS",
1401.611115
],
[
"LR",
541.2713241
],
[
"LY",
7528.970075
],
[
"LT",
17669.65898
],
[
"LU",
107243.2375
],
[
"MO",
58054.08264
],
[
"MG",
432.6578354
],
[
"MW",
516.7540552
],
[
"MY",
12109.48855
],
[
"MV",
8049.933835
],
[
"ML",
777.8605975
],
[
"MT",
28385.06497
],
[
"MH",
3254.830736
],
[
"MR",
1349.374452
],
[
"MU",
10578.61732
],
[
"MX",
10385.29785
],
[
"FM",
2773.560364
],
[
"MD",
2684.143102
],
[
"MN",
4197.755982
],
[
"ME",
8226.598844
],
[
"MA",
3357.359102
],
[
"MZ",
539.1833403
],
[
"MM",
1571.907217
],
[
"NA",
6073.194376
],
[
"NR",
9962.388924
],
[
"NP",
812.2363603
],
[
"NL",
55022.91819
],
[
"NZ",
38000.12988
],
[
"NI",
1860.431709
],
[
"NE",
398.5200428
],
[
"NG",
2396.310914
],
[
"MK",
5394.288478
],
[
"NO",
92121.42113
],
[
"OM",
15663.9053
],
[
"PK",
1196.594136
],
[
"PW",
12853.73601
],
[
"PA",
11723.93056
],
[
"PG",
2400.21576
],
[
"PY",
5394.461414
],
[
"PE",
6453.922634
],
[
"PH",
3021.986863
],
[
"PL",
16639.72798
],
[
"PT",
23737.65871
],
[
"PR",
27340.65417
],
[
"QA",
63222.10607
],
[
"RO",
11534.85862
],
[
"RU",
11729.09437
],
[
"RW",
826.3385196
],
[
"WS",
3894.337974
],
[
"ST",
1297.358572
],
[
"SA",
20775.20181
],
[
"SN",
1546.520159
],
[
"RS",
6880.533595
],
[
"SC",
14385.30181
],
[
"SL",
474.1134401
],
[
"SG",
58247.87264
],
[
"SK",
20669.90426
],
[
"SI",
26758.90229
],
[
"SB",
1477.005999
],
[
"ZA",
7439.919412
],
[
"ES",
33146.39167
],
[
"LK",
3936.450246
],
[
"KN",
18011.18764
],
[
"LC",
8503.45275
],
[
"VC",
6875.486286
],
[
"SD",
1855.626292
],
[
"SR",
8048.614313
],
[
"SE",
57232.08549
],
[
"CH",
78816.21505
],
[
"TJ",
1073.021835
],
[
"TZ",
957.1259352
],
[
"TH",
6361.62499
],
[
"TL",
2759.526494
],
[
"TG",
672.4947925
],
[
"TO",
4054.940955
],
[
"TT",
15288.93154
],
[
"TN",
4402.0237
],
[
"TR",
15026.70752
],
[
"TM",
7647.935804
],
[
"TV",
3636.055006
],
[
"UG",
709.6658061
],
[
"UA",
3110.194646
],
[
"AE",
40782.36811
],
[
"GB",
42986.03288
],
[
"US",
54541.72052
],
[
"UY",
14617.464
],
[
"UZ",
2026.540839
],
[
"VU",
2863.228634
],
[
"VN",
1964.475991
],
[
"PS",
2680.318123
],
[
"YE",
667.9454369
],
[
"ZM",
1672.345428
],
[
"ZW",
1322.344063
] 
];
data.addColumn('string','iso2c');
data.addColumn('number','value');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID7171505391ae() {
var data = gvisDataGeoChartID7171505391ae();
var options = {};
options["width"] = 556;
options["height"] = 347;
options["colorAxis"] = {colors:['yellow', 'orange', 'red', 'purple']};
options["backgroundColor"] = "lightblue";

    var chart = new google.visualization.GeoChart(
    document.getElementById('GeoChartID7171505391ae')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "geochart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID7171505391ae);
})();
function displayChartGeoChartID7171505391ae() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID7171505391ae"></script>
 
<!-- divChart -->
  
<div id="GeoChartID7171505391ae" 
  style="width: 556; height: 347;">
</div>
 <div><span>Data: dat &#8226; Chart ID: <a href="Chart_GeoChartID7171505391ae.html">GeoChartID7171505391ae</a> &#8226; <a href="https://github.com/mages/googleVis">googleVis-0.6.4</a></span><br /> 
<!-- htmlFooter -->
<span> 
  R version 3.6.1 (2017-01-27) 
  &#8226; <a href="https://developers.google.com/terms/">Google Terms of Use</a> &#8226; <a href="https://google-developers.appspot.com/chart/interactive/docs/gallery/geochart">Documentation and Data Policy</a>
</span></div>
</body>
</html>

One important feature of googleVis is `ChartEditor Class` which is used to open an in-page dialog box that enables a user to customize a visualization on the fly. In this method, you can customize color, region, chart type and so on directly. And this class works for most Google Charts.

Try click the "Edit me!" button in the following chart and see what happens.



```r
Geo <- gvisGeoChart(dat, "country", "value",
                    options=list(
                         gvis.editor="Edit me!")
                       )
plot(Geo)
```

<!-- GeoChart generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataGeoChartID71715d3d96ae () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"Arab World",
6458.734486
],
[
"Caribbean small states",
9038.953812
],
[
"Central Europe and the Baltics",
16259.84994
],
[
"Early-demographic dividend",
3732.285934
],
[
"East Asia & Pacific",
10259.496
],
[
"East Asia & Pacific (excluding high income)",
6470.431562
],
[
"East Asia & Pacific (IDA & IBRD countries)",
6538.396476
],
[
"Euro area",
40949.01323
],
[
"Europe & Central Asia",
26221.24588
],
[
"Europe & Central Asia (excluding high income)",
9515.682799
],
[
"Europe & Central Asia (IDA & IBRD countries)",
10160.53999
],
[
"European Union",
37397.89292
],
[
"Fragile and conflict affected situations",
1593.289211
],
[
"Heavily indebted poor countries (HIPC)",
901.0423858
],
[
"High income",
43504.76824
],
[
"IBRD only",
6062.928833
],
[
"IDA & IBRD total",
4838.084413
],
[
"IDA blend",
1762.713373
],
[
"IDA only",
1024.719023
],
[
"IDA total",
1277.400535
],
[
"Late-demographic dividend",
8637.835913
],
[
"Latin America & Caribbean",
9550.784572
],
[
"Latin America & Caribbean (excluding high income)",
9190.79944
],
[
"Latin America & the Caribbean (IDA & IBRD countries)",
9477.436574
],
[
"Least developed countries: UN classification",
953.2544516
],
[
"Low & middle income",
4704.657536
],
[
"Low income",
732.2782282
],
[
"Lower middle income",
2259.336602
],
[
"Middle East & North Africa",
7845.805914
],
[
"Middle income",
5197.101574
],
[
"North America",
54226.6303
],
[
"OECD members",
39929.77719
],
[
"Other small states",
13717.71156
],
[
"Pacific island small states",
3411.06416
],
[
"Post-demographic dividend",
43971.42858
],
[
"Pre-demographic dividend",
1490.459033
],
[
"Small states",
12245.61236
],
[
"South Asia",
1890.34994
],
[
"South Asia (IDA & IBRD)",
1890.34994
],
[
"Sub-Saharan Africa",
1656.926845
],
[
"Sub-Saharan Africa (excluding high income)",
1655.784319
],
[
"Sub-Saharan Africa (IDA & IBRD countries)",
1656.926845
],
[
"Upper middle income",
8537.981517
],
[
"World",
10881.13945
],
[
"Afghanistan",
563.8256627
],
[
"Albania",
5075.354985
],
[
"Algeria",
4815.570527
],
[
"Andorra",
44569.78301
],
[
"Angola",
3229.61974
],
[
"Antigua and Barbuda",
15061.58636
],
[
"Argentina",
10040.13074
],
[
"Armenia",
4406.706434
],
[
"Australia",
56919.37428
],
[
"Austria",
50250.04506
],
[
"Azerbaijan",
5768.992405
],
[
"Bahrain",
21438.59108
],
[
"Bangladesh",
1203.216265
],
[
"Belarus",
6744.49867
],
[
"Belgium",
46683.15741
],
[
"Belize",
4309.919986
],
[
"Benin",
896.3243679
],
[
"Bhutan",
3172.773862
],
[
"Bolivia",
2559.511317
],
[
"Bosnia and Herzegovina",
6056.244945
],
[
"Botswana",
8031.014943
],
[
"Brazil",
11026.24216
],
[
"Brunei Darussalam",
31436.94859
],
[
"Bulgaria",
8651.094801
],
[
"Burkina Faso",
709.7551881
],
[
"Burundi",
210.7835697
],
[
"Cabo Verde",
3786.734051
],
[
"Cambodia",
1205.29295
],
[
"Cameroon",
1497.783485
],
[
"Canada",
51382.42279
],
[
"Central African Republic",
384.7800008
],
[
"Chad",
813.3424788
],
[
"Chile",
15130.15432
],
[
"China",
7754.962119
],
[
"Colombia",
7698.412245
],
[
"Comoros",
1362.638528
],
[
"Congo, Dem. Rep.",
418.7386231
],
[
"Congo, Rep.",
2651.700719
],
[
"Costa Rica",
9892.64112
],
[
"Cote d'Ivoire",
1692.544476
],
[
"Croatia",
15870.28116
],
[
"Cyprus",
30926.45172
],
[
"Czech Republic",
23358.87295
],
[
"Denmark",
62931.24308
],
[
"Dominica",
6416.921969
],
[
"Dominican Republic",
7750.933656
],
[
"Ecuador",
5185.091461
],
[
"Egypt, Arab Rep.",
2907.317585
],
[
"El Salvador",
3511.364377
],
[
"Equatorial Guinea",
10602.28616
],
[
"Estonia",
19948.92283
],
[
"Eswatini",
4820.024141
],
[
"Ethiopia",
570.3056768
],
[
"Fiji",
4858.524092
],
[
"Finland",
48444.74186
],
[
"France",
43663.58492
],
[
"Gabon",
9077.011554
],
[
"Gambia, The",
518.8490065
],
[
"Georgia",
4469.182977
],
[
"Germany",
47501.81265
],
[
"Ghana",
1807.06354
],
[
"Greece",
23558.08397
],
[
"Grenada",
9205.653919
],
[
"Guatemala",
3160.005492
],
[
"Guinea",
943.3600341
],
[
"Guinea-Bissau",
622.0798254
],
[
"Guyana",
3965.973335
],
[
"Haiti",
730.2966712
],
[
"Honduras",
2203.949163
],
[
"Hong Kong SAR, China",
38784.75557
],
[
"Hungary",
16503.47219
],
[
"Iceland",
52103.1703
],
[
"India",
2104.163292
],
[
"Indonesia",
4284.652535
],
[
"Iraq",
5510.758895
],
[
"Ireland",
76880.80771
],
[
"Israel",
34788.65793
],
[
"Italy",
35391.70548
],
[
"Jamaica",
4841.653326
],
[
"Japan",
48919.56089
],
[
"Jordan",
3236.949148
],
[
"Kazakhstan",
11165.54436
],
[
"Kenya",
1202.133023
],
[
"Kiribati",
1762.305861
],
[
"Korea, Rep.",
26761.94138
],
[
"Kosovo",
4193.631327
],
[
"Kuwait",
33537.85153
],
[
"Kyrgyz Republic",
1087.204062
],
[
"Lao PDR",
1789.135301
],
[
"Latvia",
16405.73322
],
[
"Lebanon",
6249.766655
],
[
"Lesotho",
1401.611115
],
[
"Liberia",
541.2713241
],
[
"Libya",
7528.970075
],
[
"Lithuania",
17669.65898
],
[
"Luxembourg",
107243.2375
],
[
"Macao SAR, China",
58054.08264
],
[
"Madagascar",
432.6578354
],
[
"Malawi",
516.7540552
],
[
"Malaysia",
12109.48855
],
[
"Maldives",
8049.933835
],
[
"Mali",
777.8605975
],
[
"Malta",
28385.06497
],
[
"Marshall Islands",
3254.830736
],
[
"Mauritania",
1349.374452
],
[
"Mauritius",
10578.61732
],
[
"Mexico",
10385.29785
],
[
"Micronesia, Fed. Sts.",
2773.560364
],
[
"Moldova",
2684.143102
],
[
"Mongolia",
4197.755982
],
[
"Montenegro",
8226.598844
],
[
"Morocco",
3357.359102
],
[
"Mozambique",
539.1833403
],
[
"Myanmar",
1571.907217
],
[
"Namibia",
6073.194376
],
[
"Nauru",
9962.388924
],
[
"Nepal",
812.2363603
],
[
"Netherlands",
55022.91819
],
[
"New Zealand",
38000.12988
],
[
"Nicaragua",
1860.431709
],
[
"Niger",
398.5200428
],
[
"Nigeria",
2396.310914
],
[
"North Macedonia",
5394.288478
],
[
"Norway",
92121.42113
],
[
"Oman",
15663.9053
],
[
"Pakistan",
1196.594136
],
[
"Palau",
12853.73601
],
[
"Panama",
11723.93056
],
[
"Papua New Guinea",
2400.21576
],
[
"Paraguay",
5394.461414
],
[
"Peru",
6453.922634
],
[
"Philippines",
3021.986863
],
[
"Poland",
16639.72798
],
[
"Portugal",
23737.65871
],
[
"Puerto Rico",
27340.65417
],
[
"Qatar",
63222.10607
],
[
"Romania",
11534.85862
],
[
"Russian Federation",
11729.09437
],
[
"Rwanda",
826.3385196
],
[
"Samoa",
3894.337974
],
[
"Sao Tome and Principe",
1297.358572
],
[
"Saudi Arabia",
20775.20181
],
[
"Senegal",
1546.520159
],
[
"Serbia",
6880.533595
],
[
"Seychelles",
14385.30181
],
[
"Sierra Leone",
474.1134401
],
[
"Singapore",
58247.87264
],
[
"Slovak Republic",
20669.90426
],
[
"Slovenia",
26758.90229
],
[
"Solomon Islands",
1477.005999
],
[
"South Africa",
7439.919412
],
[
"Spain",
33146.39167
],
[
"Sri Lanka",
3936.450246
],
[
"St. Kitts and Nevis",
18011.18764
],
[
"St. Lucia",
8503.45275
],
[
"St. Vincent and the Grenadines",
6875.486286
],
[
"Sudan",
1855.626292
],
[
"Suriname",
8048.614313
],
[
"Sweden",
57232.08549
],
[
"Switzerland",
78816.21505
],
[
"Tajikistan",
1073.021835
],
[
"Tanzania",
957.1259352
],
[
"Thailand",
6361.62499
],
[
"Timor-Leste",
2759.526494
],
[
"Togo",
672.4947925
],
[
"Tonga",
4054.940955
],
[
"Trinidad and Tobago",
15288.93154
],
[
"Tunisia",
4402.0237
],
[
"Turkey",
15026.70752
],
[
"Turkmenistan",
7647.935804
],
[
"Tuvalu",
3636.055006
],
[
"Uganda",
709.6658061
],
[
"Ukraine",
3110.194646
],
[
"United Arab Emirates",
40782.36811
],
[
"United Kingdom",
42986.03288
],
[
"United States",
54541.72052
],
[
"Uruguay",
14617.464
],
[
"Uzbekistan",
2026.540839
],
[
"Vanuatu",
2863.228634
],
[
"Vietnam",
1964.475991
],
[
"West Bank and Gaza",
2680.318123
],
[
"Yemen, Rep.",
667.9454369
],
[
"Zambia",
1672.345428
],
[
"Zimbabwe",
1322.344063
] 
];
data.addColumn('string','country');
data.addColumn('number','value');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartGeoChartID71715d3d96ae() {
var data = gvisDataGeoChartID71715d3d96ae();
var options = {};
options["width"] = 556;
options["height"] = 347;

    chartGeoChartID71715d3d96ae = new google.visualization.ChartWrapper({
    dataTable: data,       
    chartType: 'GeoChart',
    containerId: 'GeoChartID71715d3d96ae',
    options: options
    });
    chartGeoChartID71715d3d96ae.draw();
    

}

  function openEditorGeoChartID71715d3d96ae() {
  var editor = new google.visualization.ChartEditor();
  google.visualization.events.addListener(editor, 'ok',
  function() { 
  chartGeoChartID71715d3d96ae = editor.getChartWrapper();  
  chartGeoChartID71715d3d96ae.draw(document.getElementById('GeoChartID71715d3d96ae')); 
  }); 
  editor.openDialog(chartGeoChartID71715d3d96ae);
  }
    
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "charteditor";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartGeoChartID71715d3d96ae);
})();
function displayChartGeoChartID71715d3d96ae() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartGeoChartID71715d3d96ae"></script>
 
<!-- divChart -->
<input type='button' onclick='openEditorGeoChartID71715d3d96ae()' value='Edit me!'/>  
<div id="GeoChartID71715d3d96ae" 
  style="width: 556; height: 347;">
</div>


## Example: Sankey chart

GoogleVis can draw Sankey chart as well.

> A sankey diagram is a visualization used to depict a flow from one set of values to another. The things being connected are called nodes and the connections are called links. Sankeys are best used when you want to show a many-to-many mapping between two domains (e.g., universities and majors) or multiple paths through a set of stages (for instance, Google Analytics uses sankeys to show how traffic flows from pages to other pages on your web site).

For A, b 


```r
# From Google Charts Guide
data <- data.frame(From=c(rep("A",3), rep("B", 3)),
                    To=c(rep(c("X", "Y", "Z"),2)),
                    Weight=c(5,7,6,2,9,4))

Sankey <- gvisSankey(data, from="From", to="To", weight="Weight")
plot(Sankey)
```

<!-- Sankey generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataSankeyID717113bd4982 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"A",
"X",
5
],
[
"A",
"Y",
7
],
[
"A",
"Z",
6
],
[
"B",
"X",
2
],
[
"B",
"Y",
9
],
[
"B",
"Z",
4
] 
];
data.addColumn('string','From');
data.addColumn('string','To');
data.addColumn('number','Weight');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartSankeyID717113bd4982() {
var data = gvisDataSankeyID717113bd4982();
var options = {};
options["width"] = 400;
options["height"] = 400;

    var chart = new google.visualization.Sankey(
    document.getElementById('SankeyID717113bd4982')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "sankey";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartSankeyID717113bd4982);
})();
function displayChartSankeyID717113bd4982() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartSankeyID717113bd4982"></script>
 
<!-- divChart -->
  
<div id="SankeyID717113bd4982" 
  style="width: 400; height: 400;">
</div>

You can also create a Sankey chart with multiple levels of connections.

```r
# From googleVis Examples on CRAN
data <- data.frame(From=c(rep("A",3), rep("B", 3), rep("X",2), "Y", rep("Z",3), "W"),
                    To=c(rep(c("X", "Y", "Z"),2), c("M", "N"), "M", c("M", "N", "W"), "M"),
                    Weight=c(5,7,6,2,9,4,2,3,10,2,8,3,4))

Sankey <- gvisSankey(data, from="From", to="To", weight="Weight")
plot(Sankey)
```

<!-- Sankey generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataSankeyID71715db27910 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"A",
"X",
5
],
[
"A",
"Y",
7
],
[
"A",
"Z",
6
],
[
"B",
"X",
2
],
[
"B",
"Y",
9
],
[
"B",
"Z",
4
],
[
"X",
"M",
2
],
[
"X",
"N",
3
],
[
"Y",
"M",
10
],
[
"Z",
"M",
2
],
[
"Z",
"N",
8
],
[
"Z",
"W",
3
],
[
"W",
"M",
4
] 
];
data.addColumn('string','From');
data.addColumn('string','To');
data.addColumn('number','Weight');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartSankeyID71715db27910() {
var data = gvisDataSankeyID71715db27910();
var options = {};
options["width"] = 400;
options["height"] = 400;

    var chart = new google.visualization.Sankey(
    document.getElementById('SankeyID71715db27910')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "sankey";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartSankeyID71715db27910);
})();
function displayChartSankeyID71715db27910() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartSankeyID71715db27910"></script>
 
<!-- divChart -->
  
<div id="SankeyID71715db27910" 
  style="width: 400; height: 400;">
</div>

You can set custom colors for nodes and links using `sankey.node` and `sankey.node`. Both nodes and links can be given custom color palettes using their colors options. You can also set a coloring mode for the links between nodes using the `colorMode` option.


```r
# From googleVis Examples on CRAN
data <- data.frame(From=c(rep("A",3), rep("B", 3), rep("X",2), "Y", rep("Z",3), "W"),
                    To=c(rep(c("X", "Y", "Z"),2), c("M", "N"), "M", c("M", "N", "W"), "M"),
                    Weight=c(5,7,6,2,9,4,2,3,10,2,8,3,4))

Sankey <- gvisSankey(data, from="From", to="To", weight="Weight",
                     options=list(
               sankey="{link: {color: { fill: '#d799ae' } },
                        node: {color: { fill: '#a61d4c' },
                               label: { color: '#871b47'} }}"))
plot(Sankey)
```

<!-- Sankey generated in R 3.6.1 by googleVis 0.6.4 package -->
<!-- Tue Nov 19 18:45:37 2019 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataSankeyID71711b4d72b4 () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
"A",
"X",
5
],
[
"A",
"Y",
7
],
[
"A",
"Z",
6
],
[
"B",
"X",
2
],
[
"B",
"Y",
9
],
[
"B",
"Z",
4
],
[
"X",
"M",
2
],
[
"X",
"N",
3
],
[
"Y",
"M",
10
],
[
"Z",
"M",
2
],
[
"Z",
"N",
8
],
[
"Z",
"W",
3
],
[
"W",
"M",
4
] 
];
data.addColumn('string','From');
data.addColumn('string','To');
data.addColumn('number','Weight');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartSankeyID71711b4d72b4() {
var data = gvisDataSankeyID71711b4d72b4();
var options = {};
options["width"] = 400;
options["height"] = 400;
options["sankey"] = {link: {color: { fill: '#d799ae' } },
                        node: {color: { fill: '#a61d4c' },
                               label: { color: '#871b47'} }};

    var chart = new google.visualization.Sankey(
    document.getElementById('SankeyID71711b4d72b4')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "sankey";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartSankeyID71711b4d72b4);
})();
function displayChartSankeyID71711b4d72b4() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartSankeyID71711b4d72b4"></script>
 
<!-- divChart -->
  
<div id="SankeyID71711b4d72b4" 
  style="width: 400; height: 400;">
</div>



```r
## Set options back to original options
options(op)
```

There are more interesting charts designed to address your data visualization needs we do not cover in this tutorial. Please see [Chart Gallery](https://google-developers.appspot.com/chart/interactive/docs/gallery) if you like.

## googleVis in RStudio
Writing googleVis in RStudio is easy. Normally after runing `plot` command it will open a standalone browser window and render charts in the web page. Besides, RStudio also supports viewing local web content in [Viewer pane](https://support.rstudio.com/hc/en-us/articles/202133558-Extending-RStudio-with-the-Viewer-Pane). You can also use command
```
plot(object, browser=rstudioapi::viewer)
```
instead of `plot(object)` to view googleVis charts in Viewer window of Rstudio.

To Knit the markdown file to HTML, you should print the chart element only

```r
op <- options(gvis.plot.tag='chart') 
# or using plot(object, 'chart') when ploting charts
```
and set the chunk option results to ’asis’ with `{r results='asis'}`.

## Reference and Resource

* [googleVis Source Code](https://github.com/mages/googleVis)
* [googleVis CRAN Page](https://github.com/mages/googleVis)
* [googleVis Examples](https://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html)
* [googleVis Reference Manual](https://cran.r-project.org/web/packages/googleVis/googleVis.pdf)
* [Google Chart Tools Documentation](https://developers.google.com/chart/interactive/docs)
* [Google APIs Terms of Service](https://developers.google.com/terms/)
* [Author's Blog](https://magesblog.com/categories/googlevis/)

