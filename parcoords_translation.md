
# Translation of 'parcoords' Introduction

Yichi Liu and Michi Liu

This is a Chinese translation version of the introduction and examples to the R package "parcoords".<br />
这是R包“parcoords”的使用说明和示例教程的中文翻译。


## 1. ‘parcoords’包使用说明 - 中文翻译

翻译自英文原版说明：https://cran.r-project.org/web/packages/parcoords/parcoords.pdf <br />

### parcoords
基于“d3.js”的交互式平行坐标图。
<br />

#### 描述
创建由d3.js parallel-coordinates的htmlwidget外包的交互式平行坐标图。

#### 使用方法

`parcoords(data = NULL, rownames = TRUE, color = NULL, brushMode = NULL, brushPredicate = "and",`
`alphaOnBrushed = NULL, reorderable = FALSE, axisDots = NULL, margin = NULL, composite = NULL, `
`alpha = NULL, queue = FALSE, mode = FALSE, rate = NULL, dimensions = NULL, bundleDimension = NULL,`
`bundlingStrength = 0.5, smoothness = 0, tasks = NULL, autoresize = FALSE, withD3 = FALSE, `
`width = NULL, height = NULL, elementId = NULL)`

#### 参数
|参数|描述|
|:-|:---|
|data | 用来画图的数据集，格式为data.frame。|
|rownames | 逻辑值，代表是否显示data.frame里的行名称。不论此处是什么值，我们都会将带有行名称的数据发送给JavaScript。如果此处是False（否），则在平行坐标中不显示行名称。|
color | 颜色可以是单一的rgb或hex。对于一个颜色函数，需要提供一个list( colorScale = , colorBy = , colorScheme =, colorInterpolator = , colorDomain =)，其中colorScale是d3-scale的名字，例如scaleOrdinal或 scaleSequential。colorBy是数据中用来决定颜色的列的名称。如果将一个离散型或序数型变量用于color，则请提供colorScheme，例如schemCategory10。如果将一个连续性变量用于color，则请提供colorInterpolator，作为d3内插器的名称，例如interpolateViridis。如果用了d3的色阶，请确保使用参数withD3 = TRUE。|
|brushMode | 字符串格式。根据需要的呈现效果选择刷子的模式，可以选择"1D-axes"或"1D-axes-multi"或"2D-strums"。|
brushPredicate | 字符串格式。可以选择“and”或者“or”，用来表示多个刷子的逻辑关系。|
alphaOnBrushed | 取值范围为0到1，表示被刷后的不透明度（缺省值为0）。|
reorderable | 逻辑值，表示是否对坐标重新排序。|
axisDots | 逻辑值，表示是否在多段线与坐标轴相交处用点标记。|
margin | list格式，列出边界空白的大小（单位为像素）。现阶段如果brushMode = "2D-strums"，需要左边边界空白为0, 因此可能会由于自动更正而导致异常结果。|
composite | 前景的合成类别。|
alpha | 取值范围是0到1，表示多段线的不透明度。
queue | 逻辑值（缺省值为否：FALSE），用来表示是否将渐进式呈现的模式改为队列。如果数据集很大，此处通常为TRUE。|
rate | integer格式，表示队列渐进式呈现速率。|
dimensions | list格式，用来自定义坐标的维度。|
bundleDimension | 字符格式，表示需要捆绑的列/变量的名称。|
bundlingStrength | 数值格式，取值范围是0到1，表示捆绑的力度。如果bundleDimension是空的，那么这个参数将被忽略，不会对平行坐标产生影响。|
smoothness | 数值格式，取值范围是0到1，表示平滑度或曲率。如果bundleDimension是空的，那么这个参数将被忽略，不会对平行坐标产生影响。|
tasks | 可以是一个字符串，或者一个JS，或者一列字符串，或者一列JS。表示在parcoords呈现图像后运行的JavaScript函数。这为高级定制化图像提供了可能。请注意，函数运行的机制是JavaScript call。对于在函数内部的对象this来说，this.el代表了parcoords包含的元素，this.parcoords代表了parcoords的实体。|
autoresize | 逻辑值（缺省值是FALSE），代表在容器大小变化时是否自动改变parcoords的大小。在使用rmarkdown幻灯片展示或者flexdashboard的情境中，这将非常有用。但如果数据集很大或者在一个典型的html环境中则不太有用。|
withD3 | 逻辑值，代表是否要包含d3r中的从属附件。parcoords htmlwidget独立使用了JavaScript，因此在global/window命名空间中不会包含完整的d3。若要包含d3.js，则应设置withD3 = TRUE。|
width | 整数值（单位为像素），代表了宽度。如果此处width = NULL，则会自动拉宽到100。|
height | 整数值（单位为像素），代表了高度。如果此处height = NULL，则高度会自动设置为400px。|
elementId | CSS选择器的ID。|


#### 返回值
一个属于htmlwidget类型的对象，可以作为HTML自动在不同环境中显示，包括R控制台里，Markdown文件内，和Shiny的输出文件内等。


#### 使用示例


```r
if(interactive()) {
  # simple example using the mtcars dataset
  data(mtcars)
  parcoords(mtcars)
  # various ways to change color
  # in these all lines are the specified color
  parcoords(mtcars, color = "green")
  parcoords(mtcars, color = "#f0c")
  # in these we supply a function for our color
  parcoords(
    mtcars
    ,color = list(
      colorBy = "cyl"
      ,colorScale = "scaleOrdinal"
      ,colorScheme = "schemeCategory10"
    )
    ,
    withD3 = TRUE
  )
  if (require('ggplot2', quietly = TRUE)) {
    parcoords(
      diamonds
      ,rownames = FALSE
      ,brushMode = "1d-axes"
      ,reorderable = TRUE
      ,queue = TRUE
      ,color = list(
        colorBy = "cut"
        ,colorScale = "scaleOrdinal"
        ,colorScheme = "schemeCategory10"
      )
      ,
      withD3 = TRUE
    )
  }
}
library(parcoords)
parcoords(mtcars,
          dimensions = list(cyl = list(
            title = "cylinder",
            tickValues = unique(mtcars$cyl)
          )))
parcoords(
  mtcars
  ,rownames = FALSE
  ,brushMode = "1d-multi"
  ,brushPredicate = "OR"
  ,dimensions = list(cyl = list(
    title = "cylinder",
    tickValues = unique(mtcars$cyl)
  ))
  
)
```

<br />
<br />
<br />

### parcoords-shiny
在Shiny中使用parcoords。
<br />

#### 描述
用以在Shiny应用程序中使用sunburst和在交互式Rmd文件中输出并显示的函数。

#### 使用方法

`parcoordsOutput(outputId, width = "100%", height = "400px")`
`renderParcoords(expr, env = parent.frame(), quoted = FALSE)`

#### 参数
|参数|描述|
|:-|:---|
|outputId | 返回的变量名称（用于读取）。|
|width, height | 必须是有效的CSS单位（例如'100%', '400px', 'auto'）或者一个数字。若是数字，则会转换成字符并在后方加上"px"。|
|expr | 用来生成sunburst的表达式。|
|env | 运行表达式expr的环境。|
|quoted | expr是否是一个被引用的表达式(用quote())。若是想将表达式存在一个变量之中，这个参数将非常有用。|


#### 使用示例


```r
if(interactive()) {

	#### filter proxy example ----
	library(parcoords)
	library(shiny)
	
	ui <- tagList(
		textOutput("filteredstate", container=h3),
		parcoordsOutput("pc")
	)
	
	server <- function(input, output, session) {
		rv <- reactiveValues(filtered = FALSE)
		output$pc <- renderParcoords({
			parcoords(mtcars)
		})
	
		observe({
			# toggle between filtered and unfiltered every 2.5 seconds
			invalidateLater(2500)
			rv$filtered <- !isolate(rv$filtered)
		})
		
		observeEvent(rv$filtered, {
			# create a proxy with which we will communicate between
			# Shiny and the parallel coordinates without a re-render
			pcp <- parcoordsProxy("pc")
			
			if(rv$filtered) {
				pcFilter(
					pcp,
					list(
						cyl = c(6,8),
						hp = list(gt = 200)
					)
				)
			} else {
				pcFilter(pcp, list())
			}
		})
		
		output$filteredstate <- renderText({
			paste0("Filtered:", rv$filtered)
		})
	}
	
	shinyApp(ui = ui, server = server)
	
	### center proxy example ----
	library(shiny)
	library(parcoords)
	
	ui <- tags$div(
		parcoordsOutput("pc", width = 2500),
		style="width:2500px;"
	)
	
	server <- function(input, output, session) {
		# create a proxy with which we will communicate between
		# Shiny and the parallel coordinates without a re-render
		pcp <- parcoordsProxy("pc")
		
		output$pc <- renderParcoords({
			parcoords(mtcars)
		})
		
		pcCenter(pcp, 'drat')
	}
	
	shinyApp(ui=ui, server=server)
	
	### hide/unhide proxy example ----
	library(parcoords)
	library(shiny)
	
	ui <- tagList(
		selectizeInput(
			inputId = "columns",
			label = "Columns to Hide",
			choices = c("names",colnames(mtcars)),
			selected = "names",
			multiple = TRUE
		),
		parcoordsOutput("pc"),
		checkboxInput("hidenames", label="Hide Row Names", value=TRUE),
		parcoordsOutput("pc2")
	)
	
	server <- function(input, output, session) {
		output$pc <- renderParcoords({
			parcoords(mtcars, rownames = FALSE, brushMode = "1d")
		})
		output$pc2 <- renderParcoords({
		parcoords(mtcars, rownames = FALSE)
	})
	
		pcUnhide
	
		observeEvent(input$columns, {
			# create a proxy with which we will communicate between
			# Shiny and the parallel coordinates without a re-render
			pcp <- parcoordsProxy("pc")
			
			pcHide(pcp, input$columns)
		}, ignoreInit = TRUE, ignoreNULL = FALSE)
		
		observeEvent(input$hidenames, {
			# create a proxy with which we will communicate between
			# Shiny and the parallel coordinates without a re-render
			pcp2 <- parcoordsProxy("pc2")
			if(input$hidenames) {
				pcHide(pcp2, "names")
			} else {
				pcUnhide(pcp2, "names")
			}
		})
	}
	
	shinyApp(ui = ui, server = server)
	
	
	### snapshot example ----
	library(shiny)
	library(parcoords)
	
	ui <- tags$div(
		actionButton(inputId = "snapBtn", label = "snapshot"),
		parcoordsOutput("pc", height=400)
	)
	
	server <- function(input, output, session) {
		# create a proxy with which we will communicate between
		# Shiny and the parallel coordinates without a re-render
		pcp <- parcoordsProxy("pc")
	
		output$pc <- renderParcoords({
			parcoords(mtcars)
		})
	
		observeEvent(input$snapBtn, {
			# create a proxy with which we will communicate between
			# Shiny and the parallel coordinates without a re-render
			pcp <- parcoordsProxy("pc")
			pcSnapshot(pcp)
		})
	}
	
	shinyApp(ui=ui, server=server)
}
```


<br />
<br />
<br />

### ParcoordsProxy
用于发送指令至Shiny 应用程序的代理实例中。
<br />

#### 描述
创建一个parcoords 形式的对象，该对象可用于控制和自定义化已经渲染的平行坐标图。该函数只能在Shiny 应用程序和 Shiny 文档中使用。

#### 使用方法
`parcoordsProxy(parcoordsId, session = shiny::getDefaultReactiveDomain(), deferUntilFlush = TRUE)`

#### 参数
|参数|描述|
|:-|:---|
|parcoordsID|parcoordsID 该参数是一个单元素字符向量，代表需要更改的平行坐标图的输出ID。（注意：如果函数被Shiny模块调用，该命名空间会被自动添加）|
|session|该参数指向该图所属的Shiny会话控制对象，通常情况下使用默认值即可。|
|DeferUntilFlush|该参数用于指示是否立刻执行针对该实例的操作。若否，则保留该操作，直到下次所有输出更新后再执行。默认值为TRUE。|
 

#### 细节
通常情况下，我们可以直接使用parcoords函数创建平行坐标图。通过此，我们可以自定义一个存储在内存中的平行坐标图。这个平行坐标图可以在R控制台、R markdown 文档以及Shiny输出中显示。而在使用Shiny时，有时在输出/渲染完平行坐标图后，我们可能会想要进一步自定义化我们的平行坐标图。在这种情况下，之前存在内存的平行坐标图早已被清除，我们也早已在网页浏览器上完成了实例的实现。<br />
<br />
因此我们需要使用ParcoordsProxy函数。该函数可以返回一个对象，用于代替普通parcoord（平行坐标图）对象。同时可以调用我们平时所用的绘制平行坐标图的函数，实现在动态实例中执行更改和自定义化的指令，而不是对存储在内存中的平行坐标图直接进行更改。
<br />
<br />
<br />

### pcCenter
通过parcoordsProxy，实现基于列或者某一变量，将平行坐标图水平居中。
<br />

#### 使用方法
`pcCenter(pc = NULL, dim = NULL)`

#### 参数
|参数|描述|
|:-|:---|
|Pc|parcoordsProxy对象|
|dim|字符串向量，选择你想要作为居中基准的列或变量。|

#### 返回值
parcoordsProxy对象。
<br />
<br />
<br />


### pcFilter
通过parcoordsProxy过滤不需要的平行坐标图。
<br />

#### 使用方法
`pcFilter(pc = NULL, filters = NULL)`

#### 参数
|参数|描述|
|:-|:---|
|pc|parcoordsProxy|
|filters|应用于parcoordsProxy实现过滤的过滤器列表。可查询参阅search.js中的示例。|

#### 返回值
parcoordsProxy对象。
<br />
<br />
<br />


### pcHide
通过parcoordsProxy，隐藏平行坐标图的某些列。
<br />

#### 用法
`pcHide(pc = NULL, dim = NULL)`

#### 参数
|参数|描述|
|:-|:---|
|pc|parcoordsProxy对象。|
|dim|字符串向量，想要隐藏的列名。|

#### 返回值
parcoordsProxy对象。
<br />
<br />
<br />


### pcSnapshot
通过parcoordsProxy获取平行坐标图的图像。
<br />

#### 用法
`pcSnapshot(pc = NULL)`

#### 参数
|参数|描述|
|:-|:---|
|pc|parcoordsProxy对象。|

#### 返回值
parcoordsProxy对象。
<br />
<br />
<br />


### pcUnhide
通过parcoordsProxy解除平行坐标图的某些列的隐藏状态。
<br />

#### 用法
`pcUnHide(pc = NULL, dim = NULL)`

#### 参数
|参数|描述|
|:-|:---|
|pc|parcoordsProxy对象。|
|dim|字符串向量，想要解除隐藏的列。|

#### 返回值
parcoordsProxy对象。
<br />
<br />
<br />
<br />

## 2. ‘parcoords’使用教程 - 中文翻译

翻译自英文原版教程： ftp://cran.r-project.org/pub/R/web/packages/parcoords/vignettes/introduction-to-parcoords-.html <br />

肯顿·罗素 <br />
2019-05-21 <br />


`Parcoords` 提供`shiny`和`crosstalk`完全集成的多元数据集的交互性视图（parcoords-es）。

### 范例
绘制平行坐标图时，默认视图仅提供有限的交互性。`parcoords`的多种参数可提供一个更有身临其境感的自定义化过程。

```r
library(parcoords)

parcoords(mtcars, height = 450)
```

<!--html_preserve--><div class="parcoords html-widget" height="450" id="htmlwidget-91bd7e06987c27abb8d9" style="width:960px;height:450px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-91bd7e06987c27abb8d9">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":false,"bundlingStrength":0.5,"smoothness":0,"height":450},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### 选项
#### 刷子模式
通过`brushMode`参数，我们可以使用多种笔刷，通过该功能用户可以自由过滤/选择数据。


```r
library(parcoords)

parcoords(
  mtcars,
  brushMode = '1D-axes', # "1D-axes", "1D-axes-multi", or "2D-strums" 
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-4beb6d0f4a79086a92d8" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-4beb6d0f4a79086a92d8">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"brushMode":"1D-axes","brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":false,"bundlingStrength":0.5,"smoothness":0,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

除了`brushMode`外，`parcoords`还有其他参数支持进一步自定义化。例如`brushPredicate`和`alphaOnBrushed`。可通过两个示例图的对比，查看它们的功能。


```r
library(parcoords)

parcoords(
  mtcars,
  brushMode = '1D-axes',
  brushPredicate = "or", # "and" "or"
  alphaOnBrushed = 0.3,
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-f7f1f8c4ef23c82c893c" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-f7f1f8c4ef23c82c893c">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"brushMode":"1D-axes","brushPredicate":"OR","alphaOnBrushed":0.3,"reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":false,"bundlingStrength":0.5,"smoothness":0,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

#### 颜色
可以用`rgb`或`hex`值给平行坐标图上单一颜色。


```r
library(parcoords)

parcoords(
  mtcars,
  color = "#3e3",
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-a3f0dae52c6e9531455c" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-a3f0dae52c6e9531455c">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"color":"#3e3","brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":false,"bundlingStrength":0.5,"smoothness":0,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

我们还可以通过提供以下参数`list( colorScale = , colorBy = , colorScheme = , colorInterpolator =, colorDomain =)`给颜色函数，以对颜色进行更改。其中，`colorScale` 是[`d3-scale`](https://github.com/d3/d3-scale)中的参数名字，例如`scaleOrdinal`和`scaleSequential`。`colorBy`是原数据中决定颜色的列名。如果根据离散变量或者顺序变量对平行坐标图上色，请同时提供`colorScheme`参数，如s`chemCategory10`，以保证上色能正常进行。如果通过连续变量对其上色，请同时提供`colorInterpolator`，该参数为d3插值器的名称，如`interpolateViridis`。如果使用d3提供的色标，请务必把参数`withD3=TRUE`包含在函数中。以下示例有助于阐明以上概念。


```r
library(parcoords)

parcoords(
  mtcars,
  color = list(
    # discrete or categorical column
    colorScale = "scaleOrdinal",
    colorBy = "cyl",
    colorScheme = "schemeCategory10"
  ),
  withD3 = TRUE,
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-2931a8ed02565e80ff78" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-2931a8ed02565e80ff78">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"color":{"colorScale":"scaleOrdinal","colorBy":"cyl","colorScheme":"schemeCategory10"},"brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":false,"bundlingStrength":0.5,"smoothness":0,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

对使用连续变量上色，`list`在参数`colorScale = ‘scaleSequential’`上可能与其他情况下的略有不同。该情况下，默认的插值器是`interpolateViridis`，而在下面的例子中，我们使用`interpolateMagma`作为插值器。

```r
library(parcoords)

parcoords(
  mtcars,
  color = list(
    # continuous variable
    colorScale = "scaleSequential",
    colorBy = "mpg",
    colorInterpolator = "interpolateMagma"
  ),
  withD3 = TRUE,
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-69f7799813af848161a6" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-69f7799813af848161a6">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"color":{"colorScale":"scaleSequential","colorBy":"mpg","colorInterpolator":"interpolateMagma"},"brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":false,"bundlingStrength":0.5,"smoothness":0,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

#### 捆绑
当我们的数据集更大时，使用捆绑功能会很有帮助。为了数据集的大小起见，我们将继续使用`mtcars`数据。要查看效果，可以尝试使用`survival::colon`或`ggplot2::diamonds`。


```r
library(parcoords)

parcoords(
  mtcars,
  bundleDimension = "cyl",
  bundlingStrength = 0.5,
  smoothness = 0.2,
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-2c25a1846e6600ce3124" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-2c25a1846e6600ce3124">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":false,"bundleDimension":"cyl","bundlingStrength":0.5,"smoothness":0.2,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

#### 队列和速率
对于较大的数据集（> 1000行），除非设置`queue = TRUE`与`rate`，否则图的交互反应速度会大大降低。这里可能需要进行一些试验才能选择正确的参数达到好的效果。如上所述，我们使用`mtcars`来示范。而实际上，只有当数据集真的很大时才需要使用这些功能。


```r
library(parcoords)

parcoords(
  mtcars,
  brushMode = "1D-axes",
  queue = TRUE,
  rate = 2, # probably will be bigger (15 - 100) than this in real use
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-06844ed259eeda5a68cc" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-06844ed259eeda5a68cc">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"brushMode":"1D-axes","brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":"queue","rate":2,"bundlingStrength":0.5,"smoothness":0,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

#### 贴砖模式
我添加了参数`mode = 'tiled'`，以此来使用下述方法

```
"基于贴砖模式的平行坐标图及其在财务数据可视化中的应用"


Jamal Alsakran, Ye Zhao, and Xinlei Zhao
```

**我很乐意接受关于此方法的反馈或建议**。尽管该技术是为较大的数据集设计的，但是此代码尚未经过优化，并且未使用缓存，因此随着数据的增大，它实际上会变慢。对于使用数据集`mtcars`来说，此方法并没有意义。但出于示例目的，我们将继续使用这个较小的数据集。


```r
library(parcoords)

parcoords(
  mtcars,
  mode = "tiled",
  brushMode = "1D-axes",
  height = 500
)
```

<!--html_preserve--><div class="parcoords html-widget" height="500" id="htmlwidget-aba6c27304432dc766e0" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="htmlwidget-aba6c27304432dc766e0">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"brushMode":"1D-axes","brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"mode":"tiled","bundlingStrength":0.5,"smoothness":0,"height":500},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### 方法
该包提供了一些独立使用或在`Shiny`中使用的辅助方法。例如，我们可以使用快照功能来得到一个`png`格式的文件，作为对平行坐标图的当前状态的导出。

#### 截图快照
先前版本的平行坐标中，提供了一些可以将图表捕获为静态图像的基本支持。但是，功能尚不完善，并且实施存在问题。现在，可以通过JavaScript和R的快照功能来达到目的。生成的图像还将记录刷子的当前状态。


```r
library(parcoords)

pc <- parcoords(
  data = mtcars,
  color = list(
    colorBy = "hp",
    colorScale = "scaleSequential"
  ),
  alpha = 0.5,
  brushMode = "1d",
  # requires withD3 for now but will change so this is not necessary
  #  after some iteration since this will pollute global namespace
  #  and potenially conflict with other htmlwidgets using a different version of d3
  withD3 = TRUE,
  elementId = "parcoords-snapshot-example"
)

htmltools::tagList(
  htmltools::tags$script(
"
function snapshotPC() {
  var pc = HTMLWidgets.find('#parcoords-snapshot-example').instance.parcoords;
  pc.snapshot();
}
"    
  ),
  htmltools::tags$button(
    "snapshot",
    onclick = "snapshotPC()"
  ),
  pc
)
```

<!--html_preserve--><script>
function snapshotPC() {
  var pc = HTMLWidgets.find('#parcoords-snapshot-example').instance.parcoords;
  pc.snapshot();
}
</script>
<button onclick="snapshotPC()">snapshot</button>
<div class="parcoords html-widget" height="500" id="parcoords-snapshot-example" style="width:960px;height:500px; position:relative; overflow-x:auto; overflow-y:hidden; max-width:100%;" width="960"></div>
<script type="application/json" data-for="parcoords-snapshot-example">{"x":{"data":{"names":["Mazda RX4","Mazda RX4 Wag","Datsun 710","Hornet 4 Drive","Hornet Sportabout","Valiant","Duster 360","Merc 240D","Merc 230","Merc 280","Merc 280C","Merc 450SE","Merc 450SL","Merc 450SLC","Cadillac Fleetwood","Lincoln Continental","Chrysler Imperial","Fiat 128","Honda Civic","Toyota Corolla","Toyota Corona","Dodge Challenger","AMC Javelin","Camaro Z28","Pontiac Firebird","Fiat X1-9","Porsche 914-2","Lotus Europa","Ford Pantera L","Ferrari Dino","Maserati Bora","Volvo 142E"],"mpg":[21,21,22.8,21.4,18.7,18.1,14.3,24.4,22.8,19.2,17.8,16.4,17.3,15.2,10.4,10.4,14.7,32.4,30.4,33.9,21.5,15.5,15.2,13.3,19.2,27.3,26,30.4,15.8,19.7,15,21.4],"cyl":[6,6,4,6,8,6,8,4,4,6,6,8,8,8,8,8,8,4,4,4,4,8,8,8,8,4,4,4,8,6,8,4],"disp":[160,160,108,258,360,225,360,146.7,140.8,167.6,167.6,275.8,275.8,275.8,472,460,440,78.7,75.7,71.1,120.1,318,304,350,400,79,120.3,95.1,351,145,301,121],"hp":[110,110,93,110,175,105,245,62,95,123,123,180,180,180,205,215,230,66,52,65,97,150,150,245,175,66,91,113,264,175,335,109],"drat":[3.9,3.9,3.85,3.08,3.15,2.76,3.21,3.69,3.92,3.92,3.92,3.07,3.07,3.07,2.93,3,3.23,4.08,4.93,4.22,3.7,2.76,3.15,3.73,3.08,4.08,4.43,3.77,4.22,3.62,3.54,4.11],"wt":[2.62,2.875,2.32,3.215,3.44,3.46,3.57,3.19,3.15,3.44,3.44,4.07,3.73,3.78,5.25,5.424,5.345,2.2,1.615,1.835,2.465,3.52,3.435,3.84,3.845,1.935,2.14,1.513,3.17,2.77,3.57,2.78],"qsec":[16.46,17.02,18.61,19.44,17.02,20.22,15.84,20,22.9,18.3,18.9,17.4,17.6,18,17.98,17.82,17.42,19.47,18.52,19.9,20.01,16.87,17.3,15.41,17.05,18.9,16.7,16.9,14.5,15.5,14.6,18.6],"vs":[0,0,1,1,0,1,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,1,0,1,0,0,0,1],"am":[1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1],"gear":[4,4,4,3,3,3,3,4,4,4,4,3,3,3,3,3,3,4,4,4,3,3,3,3,3,4,5,5,5,5,5,4],"carb":[4,4,1,1,2,1,4,2,2,4,4,3,3,3,4,4,4,1,2,1,1,2,2,4,2,1,2,2,4,6,8,2]},"options":{"rownames":true,"color":{"colorBy":"hp","colorScale":"scaleSequential"},"brushMode":"1D-axes","brushPredicate":"AND","reorderable":false,"margin":{"top":50,"bottom":50,"left":100,"right":50},"alpha":0.5,"mode":false,"bundlingStrength":0.5,"smoothness":0},"autoresize":false,"tasks":null},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

#### 使用Shiny的代理方法
与`leaflet`和`plotly`类似，`parcoords`中提供了代理方法，来与`Shiny`中的平行坐标进行交互，并且无需完全重新渲染。当前，下列功能（名称由`pc*`分隔）可以使用。

- pcFilter
- pcCenter
- pcSnapshot
- pcHide
- pcUnhide
- pcSnapshot

可以输入`?parcoords-shiny `来查看相关使用示例。
