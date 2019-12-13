
# (PART) Chinese translations {-}

# Intro to stringr 包入门详解

Yichi Zhang and Mingfang Chang





In this file, we will make an introduction of functions in stringr package with detailed examples in Chinese.


## stringr 包的安装与调用
### 安装

```r
#从CRAN下载string 发行版本：
install.packages("stringr")

#从Github下载：
devtools::install_github("tidyverse/stringr")
```

### 调用

```r
library(stringr)
```

## 字符串匹配函数(Detect Matches)

### str_detect(string, pattern)
检测字符串中是否包含匹配字符，返回TRUE或FALSE。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_detect(fruit, "a")
```

```
## [1] TRUE TRUE TRUE TRUE
```

```r
str_detect(fruit, "b")
```

```
## [1] FALSE  TRUE FALSE FALSE
```

```r
str_detect("this is an example", "an")
```

```
## [1] TRUE
```

### str_which(string, pattern)
查找字符串中匹配字符的索引，返回索引。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_which(fruit, "a")
```

```
## [1] 1 2 3 4
```

```r
str_which(fruit, "p")
```

```
## [1] 1 3 4
```

```r
str_which("example", "a")
```

```
## [1] 1
```

### str_count(string, pattern)
计数字符串匹配次数，返回计数。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_count(fruit, "a")
```

```
## [1] 1 3 1 1
```

```r
str_count(fruit, "p")
```

```
## [1] 2 0 1 3
```

```r
str_count("example", "am")
```

```
## [1] 1
```

### str_locate(string, pattern)
找到字符串中第一个匹配字符的位置，返回位置，如无匹配则返回NA。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
 str_locate(fruit, "a")
```

```
##      start end
## [1,]     1   1
## [2,]     2   2
## [3,]     3   3
## [4,]     5   5
```

```r
str_locate(fruit, "p")
```

```
##      start end
## [1,]     2   2
## [2,]    NA  NA
## [3,]     1   1
## [4,]     1   1
```

```r
str_locate("example", "x")
```

```
##      start end
## [1,]     2   2
```

### str_locate_all(string, pattern)
找到字符串中所有匹配字符的位置，返回位置。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_locate_all(fruit,"p")
```

```
## [[1]]
##      start end
## [1,]     2   2
## [2,]     3   3
## 
## [[2]]
##      start end
## 
## [[3]]
##      start end
## [1,]     1   1
## 
## [[4]]
##      start end
## [1,]     1   1
## [2,]     6   6
## [3,]     7   7
```

```r
str_locate_all("example", "e")
```

```
## [[1]]
##      start end
## [1,]     1   1
## [2,]     7   7
```






## 字符串的截取函数(Subset Strings)

### str_sub(string, start index, end index)

用于直接通过索引来分割字符串，并返回起始索引到结束索引中的全部字符。<br />
示例：<br />

```r
x <-'Hello World'
str_sub(x,1,3)
```

```
## [1] "Hel"
```

```r
str_sub(x,-7,-2)
```

```
## [1] "o Worl"
```
函数的输入也可以是一串字符串。<br />


```r
x <-c('Apple','Banana','Strawberry')
str_sub(x,2,4)
```

```
## [1] "ppl" "ana" "tra"
```

### str_subset(string,pattern)


输入一个字符串或者一系列字符串，并给定一种模式，返还拥有这种模式的字符串。<br />
示例：

```r
x <-'Hello World'
str_subset(x,'ell')
```

```
## [1] "Hello World"
```

```r
y <-c('Apple','Banana','Strawberry')
str_subset(y,'ana')
```

```
## [1] "Banana"
```

```r
z <-'Hello World'
str_subset(x,'zzz')
```

```
## character(0)
```




### str_extract(string,pattern)

输入一个字符串或者一串字符串，给定一种模式,返回在每个字符串中第一个符合模式的子字符串，如果某个字符串中并没有我们输入的模式，则返回空值NA，这个函数的输出类型是一个包含多个字符串的向量。<br />
示例：<br />

```r
string1 <- c('fruit', 'Test Score:89', 'Test Score:170','tiger')
pattern1 <-'ui'
str_extract(string1,pattern1)
```

```
## [1] "ui" NA   NA   NA
```

对于这个函数使用正则表达式来表达字符串的模式会更有意义，我们将会在最后具体讨论正则表达式的写法。<br />


```r
pattern2 <- "[A-Z][a-z]*[:]\\d*"
str_extract(string1,pattern2)
```

```
## [1] NA          "Score:89"  "Score:170" NA
```
我们也可以使用函数str_extract_all(string， pattern) 返回每个字符串当中所有符合的模式的子字符串（并不只是第一个）。<br />
示例：<br />

```r
string2 <- c('fruit', 'Test Score:89 Ratescore:77', 'Test Score:170','tiger')
pattern2 <- "([A-Z][a-z]*[:])(\\d*)"
str_extract_all(string2,pattern2)
```

```
## [[1]]
## character(0)
## 
## [[2]]
## [1] "Score:89"     "Ratescore:77"
## 
## [[3]]
## [1] "Score:170"
## 
## [[4]]
## character(0)
```

### str_match(string, pattern)
输入一个字符串或者一串字符串，给定一种模式,返回在每个字符串中第一个符合模式的子字符串，如果某个字符串中并没有我们输入的模式，则返回空值NA,但是不同于str_extract()函数， 此函数返回一个包含多个字符串的矩阵。<br />
示例：<br />

```r
str_match(string2,pattern2)
```

```
##      [,1]        [,2]     [,3] 
## [1,] NA          NA       NA   
## [2,] "Score:89"  "Score:" "89" 
## [3,] "Score:170" "Score:" "170"
## [4,] NA          NA       NA
```

我们也可以用str_match_all()函数去返回所有符合模式的子字符串,在返回的矩阵中，第一列代表一个符合模式的完整的子字符串，后面的每一列代表了完整的子字符串中的每一个组，这个组是在正则表达式中用括号分割开来的（例如"([A-Z][a-z]*[:])(\\d*)" 中， 第一个组就是([A-Z][a-z]*[:])， 第二个组则是(\\d*)）。<br />


```r
str_match_all(string2,pattern2)
```

```
## [[1]]
##      [,1] [,2] [,3]
## 
## [[2]]
##      [,1]           [,2]         [,3]
## [1,] "Score:89"     "Score:"     "89"
## [2,] "Ratescore:77" "Ratescore:" "77"
## 
## [[3]]
##      [,1]        [,2]     [,3] 
## [1,] "Score:170" "Score:" "170"
## 
## [[4]]
##      [,1] [,2] [,3]
```

## 字符串长度编辑函数(Manage Lengths)

### str_length(string)
返回字符串长度，即所含字符个数。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_length(fruit)
```

```
## [1] 5 6 4 9
```

```r
str_length("example")
```

```
## [1] 7
```

```r
str_length(" ")
```

```
## [1] 1
```

```r
str_length("")
```

```
## [1] 0
```

### str_pad((string, width, side = c("left", "right","both"), pad = " ")
用所给字符填充字符串至所给长度，可总左边或右边或两边填充，返回填充后字符串。默认值为从左边以空格填充至所给长度。如果所给长度比字符串长度短，则返回原字符串。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_pad(fruit, 17)
```

```
## [1] "            apple" "           banana" "             pear"
## [4] "        pineapple"
```

```r
str_pad(fruit, 17, "both", "*")
```

```
## [1] "******apple******" "*****banana******" "******pear*******"
## [4] "****pineapple****"
```

```r
str_pad(fruit, 17, "left", " ")
```

```
## [1] "            apple" "           banana" "             pear"
## [4] "        pineapple"
```

```r
str_pad(fruit, 17, "right", "-")
```

```
## [1] "apple------------" "banana-----------" "pear-------------"
## [4] "pineapple--------"
```

```r
str_pad("example", 11, "both")
```

```
## [1] "  example  "
```

```r
str_pad("another", 3, "both","*")
```

```
## [1] "another"
```

### str_trunc(string, width, side = c("right", "left","center"), ellipsis = "...")
从所给方向截取字符串并替换为所给字符至所给长度，可以从左边或右边或中间截取，默认为从左边截取，默认替换字符为"..."，返回编辑后字符串。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_trunc(fruit, 3,"left", "-")
```

```
## [1] "-le" "-na" "-ar" "-le"
```

```r
str_trunc(fruit, 4,"center", "*")
```

```
## [1] "ap*e" "ba*a" "pear" "pi*e"
```

```r
str_trunc(fruit, 5,"right", "%")
```

```
## [1] "apple" "bana%" "pear"  "pine%"
```

```r
str_trunc("example", 5)
```

```
## [1] "ex..."
```

### str_trim(string, side = c("both", "left", "right"))
去掉字符串开头或/和结尾的空格，可以去掉左边或右边或两边的空格，默认为去掉两边空格，返回去掉空格后的字符串。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_trim(fruit)
```

```
## [1] "apple"     "banana"    "pear"      "pineapple"
```

```r
str_trim(" example1  ")
```

```
## [1] "example1"
```

```r
str_trim(" example2 ", "left")
```

```
## [1] "example2 "
```

```r
str_trim(" example3 ", "right")
```

```
## [1] " example3"
```

```r
str_trim(" example4 ", "both")
```

```
## [1] "example4"
```


## 字符串变换与编辑函数(Mutate Strings)

### str_sub(string,start index,end index)
可用于返回所有输入的字符串中，从起始索引到结束索引的子字符串。<br />
示例：<br />

```r
f <-c('Apple','Banana','Strawberry')
str_sub(f,1,3)
```

```
## [1] "App" "Ban" "Str"
```

也可用于替换1所有输入的字符串中，从起始索引到结束索引的子字符串，用于替换的字符串取决的使用者自己定义并指向这个函数的字符串。<br />
示例：<br />


```r
f <-c('Apple','Banana','Strawberry')
str_sub(f,1,3)<-'hello'
print(f)
```

```
## [1] "hellole"      "helloana"     "helloawberry"
```

### str_replace(string,pattern,replacement)
找个输入法的字符串中第一个符合我们定义的模式的子字符串并用我们输入的替换字符串替换。<br />
示例：<br />

```r
string3 <- 'exploratary data annlysis'
str_replace(string3,'exploratary','Visulization')
```

```
## [1] "Visulization data annlysis"
```

```r
string2 <- c('fruit', 'Test Score:89 Ratescore:77', 'Test Score:170','tiger')
pattern2 <- "([A-Z][a-z]*[:])(\\d*)"
str_replace(string2,pattern2,'Replacement')
```

```
## [1] "fruit"                         "Test Replacement Ratescore:77"
## [3] "Test Replacement"              "tiger"
```

### str_replace_all(string,pattern,replacement)
找个输入法的字符串中所有符合我们定义的模式的子字符串并用我们输入替换字符串替换,如果这个字符串中不存在我们定义的模式，直接返还原本的字符串。<br />
示例：<br />

```r
string3 <- 'exploratary data annlysis and data Visulization'
str_replace_all(string3,'data','Visulization')
```

```
## [1] "exploratary Visulization annlysis and Visulization Visulization"
```

```r
string2 <- c('fruit', 'Test Score:89 Ratescore:77', 'Test Score:170','tiger')
pattern2 <- "([A-Z][a-z]*[:])(\\d*)"
str_replace_all(string2,pattern2,'Replacement')
```

```
## [1] "fruit"                        "Test Replacement Replacement"
## [3] "Test Replacement"             "tiger"
```

### str_to_lower(string)
将一个字符串或者一个字符串的向量全部变为小写格式。<br />
示例：<br />

```r
upper <- c('FFF','Task','Community CONTRIBUTION')
str_to_lower(upper)
```

```
## [1] "fff"                    "task"                   "community contribution"
```
由于不同的国家有不同的大小写规则，我们可以用参数locale去规定在这个小写转变格式中所使用的规则（每个国家的规则有国家的英文缩写表示，具体课查看维基百科https://zh.wikipedia.org/wiki/ISO_639-1%E4%BB%A3%E7%A0%81%E8%A1%A8 语言ISO639表格）。<br />

```r
upper <- c('FFF','Task','Community CONTRIBUTION')
str_to_lower(upper,locale = 'en')
```

```
## [1] "fff"                    "task"                   "community contribution"
```


### str_to_upper(string)
将一个字符串或者一个字符串的向量全部变为大写格式。<br />
示例：<br />

```r
lower1 <- c('FFF','Task','Community CONTRIBUTION')
str_to_upper(lower1)
```

```
## [1] "FFF"                    "TASK"                   "COMMUNITY CONTRIBUTION"
```

```r
str_to_upper(lower1,locale = 'en')
```

```
## [1] "FFF"                    "TASK"                   "COMMUNITY CONTRIBUTION"
```

### str_to_title(string)
将一个字符串或者一个字符串组成的向量变换称标题格式（每个单词的首字母大写）。<br />
示例：<br />

```r
str_to_title(lower1)
```

```
## [1] "Fff"                    "Task"                   "Community Contribution"
```

```r
str_to_title(lower1,locale = 'en')
```

```
## [1] "Fff"                    "Task"                   "Community Contribution"
```




## 字符串分割与拼接函数(Join and Split)

### str_c(..., sep = "", collapse = NULL)
将多个字符串拼接成单个字符串，字符串间可添加分割字符，默认分割字符为空字符，返回拼接后字符串。 <br />
示例：

```r
str_c("this", "is", "an", "example1", sep = "", collapse = NULL)
```

```
## [1] "thisisanexample1"
```

```r
str_c("this", "is", "an", "example2", sep = " ", collapse = NULL)
```

```
## [1] "this is an example2"
```

```r
str_c("this", "is", "an", "example3")
```

```
## [1] "thisisanexample3"
```

### str_c(..., sep = "", collapse = "")
将一个字符串向量拼接为单个字符串，字符串间可添加分割字符，默认分割字符为空字符，返回拼接后字符串。<br />
示例：

```r
str_c(c("this", "is", "an", "example1"), sep = "", collapse = "")
```

```
## [1] "thisisanexample1"
```

```r
str_c(c("this", "is", "an", "example2"), sep = "", collapse = "*")
```

```
## [1] "this*is*an*example2"
```

### str_dup(string, times)
多次复制字符串，返回复制后字符串。<br />
示例：

```r
fruit <- c("apple", "banana", "pear", "pineapple")
str_dup(fruit, 3)
```

```
## [1] "appleappleapple"             "bananabananabanana"         
## [3] "pearpearpear"                "pineapplepineapplepineapple"
```

```r
str_dup("example", 7)
```

```
## [1] "exampleexampleexampleexampleexampleexampleexample"
```

### str_split_fixed((string, pattern, n)
以所给字符将字符串分割成所给数量的字符串，返回分割后的结果。<br />
示例：

```r
fruit <- c("app le", "bana na", "p ear", "pinea pple")
str_split_fixed(fruit, " ", 2)
```

```
##      [,1]    [,2]  
## [1,] "app"   "le"  
## [2,] "bana"  "na"  
## [3,] "p"     "ear" 
## [4,] "pinea" "pple"
```

```r
str_split_fixed("this is an example2", " ", 3)
```

```
##      [,1]   [,2] [,3]         
## [1,] "this" "is" "an example2"
```

### str_glue(…, .sep = "", .envir = parent.frame())
在字符串内替换变量，变量可在函数内定义，可以连接多个字符串并以所给分隔字符分隔，返回替换后字符串。<br />
示例：

```r
str_glue("This is {apple}", " and this is not {banana}.", .sep=",",apple = "apple", banana = "banana")
```

```
## This is apple, and this is not banana.
```

```r
pineapple<-"pineapple"
str_glue("This is {pineapple}")
```

```
## This is pineapple
```

### str_glue_data(.x, ..., .sep = "", .envir = parent.frame(), .na = "NA")
在字符串内替换变量，变量可在函数内以环境、列表、数据框等形式定义，可以连接多个字符串并以所给分隔字符分隔，返回替换后字符串。<br />
示例：

```r
str_glue_data(list(a="apple", b="banana"), "This is {a}", "this is not {b}", .sep=",")
```

```
## This is apple,this is not banana
```

```r
fruit <- c("apple", "banana", "pear", "pineapple")
```






## 字符串排序(Order Strings)
### str_sort(string)
根据输入的参数，给输入的字符串向量排序。<br />
示例：<br />

```r
order <- c('FFF','Task','Community CONTRIBUTION')
#给名叫order的字符串向量按照字母顺序从前到后排序
str_sort(order)
```

```
## [1] "Community CONTRIBUTION" "FFF"                    "Task"
```

```r
#给名叫order的字符串向量按照字母顺序从后到前排序
str_sort(order,decreasing = TRUE)
```

```
## [1] "Task"                   "FFF"                    "Community CONTRIBUTION"
```

```r
orderNA <- c('FFF','Task','Community CONTRIBUTION',NA)
#给名叫orderNA的字符串向量按照字母顺序从前到后的排序并且把空值排在最后面
str_sort(orderNA,na_last = TRUE)
```

```
## [1] "Community CONTRIBUTION" "FFF"                    "Task"                  
## [4] NA
```

### str_order(string)

此函数与str_sort()的排序方法和使用方法基本一致，两个函数的主要区别在于str_order()返回的是索引的顺序而不是一个排序过后的新字符串向量。<br />
示例：<br />

```r
order2 <- c('FFF','Task','Community CONTRIBUTION')
str_sort(order2)
```

```
## [1] "Community CONTRIBUTION" "FFF"                    "Task"
```

```r
str_order(order2)
```

```
## [1] 3 1 2
```

```r
order2 <- c('FFF','Task','Community CONTRIBUTION')
#排序的顺序变为字母表的顺序从后到前
str_sort(order2,decreasing = TRUE)
```

```
## [1] "Task"                   "FFF"                    "Community CONTRIBUTION"
```

```r
str_order(order2, decreasing = TRUE)
```

```
## [1] 2 1 3
```

```r
orderNA <- c('FFF','Task','Community CONTRIBUTION',NA)
#将NA排在所有字符串的最后面
str_sort(orderNA,na_last = TRUE)
```

```
## [1] "Community CONTRIBUTION" "FFF"                    "Task"                  
## [4] NA
```

```r
str_order(orderNA, na_last =TRUE)
```

```
## [1] 3 1 2 4
```


## 字符串的编译格式与显示格式修改函数(Encode and Visualize Strings)

### str_conv(string, encoding)
更改当前字符串的编码格式。<br />
示例：<br />

```r
x <- charToRaw('武汉欢迎你')
#将武汉欢迎你变成字符节
print(x)
```

```
##  [1] e6 ad a6 e6 b1 89 e6 ac a2 e8 bf 8e e4 bd a0
```

```r
#将原始的字符节x用UTF-8的编码格式从新编码
str_conv(x, "UTF-8")
```

```
## [1] "武汉欢迎你"
```

```r
#使用stringi::stri_enc_list()能返回整个r中完整的编码格式表
```

### str_view(string, pattern)
通过html的形式显示我们输入的模式在字符串中第一个出现的位置的位置。<br />
示例：<br />


```r
str_view("hello world", "world")
```

<!--html_preserve--><div id="htmlwidget-1c23a5920d3deaf5b691" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-1c23a5920d3deaf5b691">{"x":{"html":"<ul>\n  <li>hello <span class='match'>world<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view("hello world world", "world")
```

<!--html_preserve--><div id="htmlwidget-b0a2506f487401be2fee" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-b0a2506f487401be2fee">{"x":{"html":"<ul>\n  <li>hello <span class='match'>world<\/span> world<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
我们同时也可以使用函数str_view_all(string, pattern)去显示我们输入的字符串中所有和我们所选择的模式匹配的子字符串的位置。<br />
示例：<br />

```r
str_view_all("hello world world", "world")
```

<!--html_preserve--><div id="htmlwidget-5566b127dfef467bb817" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-5566b127dfef467bb817">{"x":{"html":"<ul>\n  <li>hello <span class='match'>world<\/span> <span class='match'>world<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view_all('Test Score:89 Ratescore:77',"([A-Z][a-z]*[:])(\\d*)")
```

<!--html_preserve--><div id="htmlwidget-526ce9fbd68e345d9ba8" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-526ce9fbd68e345d9ba8">{"x":{"html":"<ul>\n  <li>Test <span class='match'>Score:89<\/span> <span class='match'>Ratescore:77<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### str_wrap(string,width,indent,exdent)
改变字符串的显示格式。<br />
示例：<br />


```r
data <- 'Data analysis is a process of inspecting, cleansing, transforming and modeling data with the goal of discovering useful information, informing conclusion and supporting decision-making. Data analysis has multiple facets and approaches, encompassing diverse techniques under a variety of names, and is used in different business, science, and social science domains. In today\'s business world, data analysis plays a role in making decisions more scientific and helping businesses operate more effectively.'
# the text above come from wikipedia
```

```r
#width规定了字符串每一行的长度，这里我们让字符串data每隔50个字符就换一次行
cat(str_wrap(data, width = 50, indent = 0, exdent = 0),'\n')
```

```
## Data analysis is a process of inspecting,
## cleansing, transforming and modeling data with the
## goal of discovering useful information, informing
## conclusion and supporting decision-making. Data
## analysis has multiple facets and approaches,
## encompassing diverse techniques under a variety of
## names, and is used in different business, science,
## and social science domains. In today's business
## world, data analysis plays a role in making
## decisions more scientific and helping businesses
## operate more effectively.
```

```r
#indent决定了字符串第一行的缩进长度，这里我们选择缩进长度10，也就是第一行在一个空格之后开始
cat(str_wrap(data, width = 50, indent = 10, exdent = 0),'\n')
```

```
##           Data analysis is a process of inspecting,
## cleansing, transforming and modeling data with the
## goal of discovering useful information, informing
## conclusion and supporting decision-making. Data
## analysis has multiple facets and approaches,
## encompassing diverse techniques under a variety of
## names, and is used in different business, science,
## and social science domains. In today's business
## world, data analysis plays a role in making
## decisions more scientific and helping businesses
## operate more effectively.
```

```r
#exdent决定了字符串除了第一行所有其他行的缩进长度，这里我们选择缩进长度15，也就是除了第一行，每行前面都有15个空格
cat(str_wrap(data, width = 50, indent = 0, exdent = 15),'\n')
```

```
## Data analysis is a process of inspecting,
##                cleansing, transforming and modeling data with the
##                goal of discovering useful information, informing
##                conclusion and supporting decision-making. Data
##                analysis has multiple facets and approaches,
##                encompassing diverse techniques under a variety of
##                names, and is used in different business, science,
##                and social science domains. In today's business
##                world, data analysis plays a role in making
##                decisions more scientific and helping businesses
##                operate more effectively.
```


## 正则表达式(Regular Expression)


### 字符匹配

在stringr 函数中，pattern参数可以正则表达式的形式表示。在R语言中，正则表达式以字符串形式表示。

'a'\ 在正则表达式中单个字母代表的就是一个字母本身 <br />
\\.  \      \\? \           \\( \  \\}\  等 当我们想表示一个符号的时候，以符号本身表示一个符号并在前面加一个斜杠<br />
\\n\ 代表换行<br />
\\t\ 代表一个缩进，即跳格<br />
\\s\ 代表任意空格<br />
\\S\ 代表非空格字符<br />
\\d\ 代表任意数字字符<br />
\\D\ 代表任意非数字字符<br />
\\w\ 代表任意字字符<br />
\\W\ 代表任意非字字符<br />
\\b\ 代表词边界<br />
\\B\ 代表非词边界<br />
[:digit] \ 代表0-9之间的任意数字<br />
[:alpha] \ 代表a-z,和A-Z之间的任意字母<br />
[:lower:] \ 代表a-z之间的任意字母<br />
[:upper:] \ 代表A-Z之间的任意字母<br />
[:xdigit:] \ 代表16进制中任意的数字(0-9和A-F)<br />
[:alumn:] \ 代表任意数字或字母<br />
[:graph:] \ 代表任意数字,字母,或者符号<br />
[:print:] \ 代表任意数字,字母,符号,或者空格<br />
[:spcae:] \ 代表空格,用法与\\s相同<br />
[:blank:] \ 代表空格或者跳格(缩进)但不包括换行<br />
\. \ 代表任意字符除了换行<br />

由于很多常规字符不能直接以字符串的形式来表达，所以我们需要在带有斜杠的正则表达式前面额外加上一个斜杠，使相对应的正则表达式能以字符串的形式储存<br />
例如：<br />
\\n\ 在字符串中的表达为'\\\\n'<br />
\\s\ 在字符串中的表达为'\\\\s'<br />
\\w\ 在字符串中的表达为'\\\\w'<br />
等等<br />




### 替换(Alternates)
'\|'\ 表示或者(or)， 例如 'ab\|d'表示'ab' 或'd' 都能被匹配。 <br />

```r
#'wk|kkk'表示字符串中所有的'wk' 或'kkk' 都能被匹配。
str_view_all('w.asdgwkad.dfkkk.qwwerthj','wk|kkk') 
```

<!--html_preserve--><div id="htmlwidget-c7e955f10e5d766f86bc" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-c7e955f10e5d766f86bc">{"x":{"html":"<ul>\n  <li>w.asdg<span class='match'>wk<\/span>ad.df<span class='match'>kkk<\/span>.qwwerthj<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


'[ ]' 表示其中一个，例如'[abd]'表示任意'a'或'b'或'd'都能被匹配。<br />

```r
#'[wk]'表示字符串中所有的'w' 或'k' 都能被匹配。
str_view_all('w.asdgwkad.dfkkk.qwwerthj','[wk]') 
```

<!--html_preserve--><div id="htmlwidget-6759daecc83cc2de91d1" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-6759daecc83cc2de91d1">{"x":{"html":"<ul>\n  <li><span class='match'>w<\/span>.asdg<span class='match'>w<\/span><span class='match'>k<\/span>ad.df<span class='match'>k<\/span><span class='match'>k<\/span><span class='match'>k<\/span>.q<span class='match'>w<\/span><span class='match'>w<\/span>erthj<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

'[^]' 表示除此之外，例如'[^abd]' 表示除'abd'之外的的子字符串都能被匹配。 <br />

```r
#'[^wk]'表示字符串中除了'w' 和'k' ，其他所有子字符串都能被匹配。
str_view_all('w.asdgwkad.dfkkk.qwwerthj','[^wk]') 
```

<!--html_preserve--><div id="htmlwidget-5086d94d0fd7c87832fe" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-5086d94d0fd7c87832fe">{"x":{"html":"<ul>\n  <li>w<span class='match'>.<\/span><span class='match'>a<\/span><span class='match'>s<\/span><span class='match'>d<\/span><span class='match'>g<\/span>wk<span class='match'>a<\/span><span class='match'>d<\/span><span class='match'>.<\/span><span class='match'>d<\/span><span class='match'>f<\/span>kkk<span class='match'>.<\/span><span class='match'>q<\/span>ww<span class='match'>e<\/span><span class='match'>r<\/span><span class='match'>t<\/span><span class='match'>h<\/span><span class='match'>j<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

'[-]' 表示范围，例如'[a-c]' 表示从a至c，即单个子字符串'a','b'或者'c'能被匹配。 <br />

```r
#'[a-f]'表示字符串中所有的从a到f的单个子字符串都能被匹配。
str_view_all('w.asdgwkad.dfkkk.qwwerthj','[a-f]') 
```

<!--html_preserve--><div id="htmlwidget-d79e04e51049517a91d0" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-d79e04e51049517a91d0">{"x":{"html":"<ul>\n  <li>w.<span class='match'>a<\/span>s<span class='match'>d<\/span>gwk<span class='match'>a<\/span><span class='match'>d<\/span>.<span class='match'>d<\/span><span class='match'>f<\/span>kkk.qww<span class='match'>e<\/span>rthj<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


### 锚点(Anchors)
'\^' 表示字符串开头，例如'\^a'表示以a开头的字符串为有效匹配。 <br />

```r
#匹配字符串开头为j的首字母，如果字符串的首字母不是j，则为无有效匹配。
str_view_all('jdjdjdjdj','^j') 
```

<!--html_preserve--><div id="htmlwidget-e6c2ec5a6f22e9085565" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-e6c2ec5a6f22e9085565">{"x":{"html":"<ul>\n  <li><span class='match'>j<\/span>djdjdjdj<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view_all('djdjdjdj','^j') 
```

<!--html_preserve--><div id="htmlwidget-b23813f62c728ffbefeb" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-b23813f62c728ffbefeb">{"x":{"html":"<ul>\n  <li>djdjdjdj<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

'\$' 表示字符串结尾，例如'a\$'表示以a结尾的字符串为有效匹配。<br />

```r
#匹配字符串尾字母j，如果字符串的最后一个字母不是j，则为无有效匹配。
str_view_all('jdjdjdjdj','j$') 
```

<!--html_preserve--><div id="htmlwidget-48b57e059c67eaa8a334" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-48b57e059c67eaa8a334">{"x":{"html":"<ul>\n  <li>jdjdjdjd<span class='match'>j<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view_all('djdjdjdj','j$') 
```

<!--html_preserve--><div id="htmlwidget-2f06e3eaeb53d9f1bd6e" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-2f06e3eaeb53d9f1bd6e">{"x":{"html":"<ul>\n  <li>djdjdjd<span class='match'>j<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

### 查找(Look Arounds)
'char1(?=char2)' 表示匹配char1后一个为char2的char1字符，例如‘a(?=c)’表示匹配a后一个为c的a。 <br />

```r
#匹配后一个字符为n的u

str_view_all('Columbia university','u(?=n)') 
```

<!--html_preserve--><div id="htmlwidget-c1ea371403906f2e1826" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-c1ea371403906f2e1826">{"x":{"html":"<ul>\n  <li>Columbia <span class='match'>u<\/span>niversity<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

'char1(?!char2)' 表示匹配char1后一个不为char2的char1字符，例如‘a(?!c)’表示匹配a后一个不为c的a。<br /> 

```r
#匹配后一个字符为不为n的u

str_view_all('Columbia university','u(?!n)') 
```

<!--html_preserve--><div id="htmlwidget-84481e8cb24fb7563959" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-84481e8cb24fb7563959">{"x":{"html":"<ul>\n  <li>Col<span class='match'>u<\/span>mbia university<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

'(?<=char2)char1' 表示匹配char1前一个为char2的char1字符，例如'(?<=b)a'表示匹配a前一个为b的a。 <br />

```r
#匹配前一个字符为空格的u

str_view_all('Columbia university','(?<= )u') 
```

<!--html_preserve--><div id="htmlwidget-1c76f4fdf098bd704b9c" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-1c76f4fdf098bd704b9c">{"x":{"html":"<ul>\n  <li>Columbia <span class='match'>u<\/span>niversity<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

'(?<!char2)char1' 表示匹配char1前一个不为char2的char1字符，例如'(?<!b)a'表示匹配a前一个不为b的a <br />

```r
#匹配前一个字符不为空格的u

str_view_all('Columbia university','(?<! )u') 
```

<!--html_preserve--><div id="htmlwidget-55c33e22311ab87e9773" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-55c33e22311ab87e9773">{"x":{"html":"<ul>\n  <li>Col<span class='match'>u<\/span>mbia university<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->




### 数量词的使用(Quantifiers)

\? 代表前一个正则表达式出现零次或者一次<br />

```r
#寻找字符串ab中有所有由一个a或者空字符组成的模式(pattern)
str_view_all('ab','a?') 
```

<!--html_preserve--><div id="htmlwidget-32083d9e5fc3ff1ed9dc" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-32083d9e5fc3ff1ed9dc">{"x":{"html":"<ul>\n  <li><span class='match'>a<\/span><span class='match'><\/span>b<span class='match'><\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#寻找字符串.wkwkwkk中有所有由一个k或者空字符组成的模式(pattern)
str_view_all('.wkwkwkk','k?') 
```

<!--html_preserve--><div id="htmlwidget-9630526fcc39b640abe3" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-9630526fcc39b640abe3">{"x":{"html":"<ul>\n  <li><span class='match'><\/span>.<span class='match'><\/span>w<span class='match'>k<\/span><span class='match'><\/span>w<span class='match'>k<\/span><span class='match'><\/span>w<span class='match'>k<\/span><span class='match'>k<\/span><span class='match'><\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

\* 代表前一个正则表达式出现零次或多次<br />

```r
#寻找字符串abaa中所有由一个a或者多个a或者空字符组成的模式(pattern)
str_view_all('abaa','a*') 
```

<!--html_preserve--><div id="htmlwidget-3d023d95cd28f78c37c8" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-3d023d95cd28f78c37c8">{"x":{"html":"<ul>\n  <li><span class='match'>a<\/span><span class='match'><\/span>b<span class='match'>aa<\/span><span class='match'><\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#寻找字符串.wkkkkwkwkk中所有由一个k或者多个k或者空字符组成的模式(pattern)
str_view_all('.wkkkkwkwkk','k*')
```

<!--html_preserve--><div id="htmlwidget-0ba70c20cac07bc3c90b" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-0ba70c20cac07bc3c90b">{"x":{"html":"<ul>\n  <li><span class='match'><\/span>.<span class='match'><\/span>w<span class='match'>kkkk<\/span><span class='match'><\/span>w<span class='match'>k<\/span><span class='match'><\/span>w<span class='match'>kk<\/span><span class='match'><\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#可以看到k*和k？的主要区别在于k？会把‘kkkk’当作4个单个k组成的模式(pattern),而k*会把字符串'kkkk'视为一个由4个k组成的模式(pattern)
```


\+ 代表前一个正则表达式出现一次或多次<br />


```r
#寻找字符串abaa中有所有由一个a或者多个a组成的模式(pattern)
str_view_all('abaa','a+') 
```

<!--html_preserve--><div id="htmlwidget-a45dc06c5e4c9882873d" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-a45dc06c5e4c9882873d">{"x":{"html":"<ul>\n  <li><span class='match'>a<\/span>b<span class='match'>aa<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#寻找字符串.wkkkkwkwkk中所有由一个k或者多个k组成的模式(pattern)
str_view_all('.wkkkkwkwkk','k+')
```

<!--html_preserve--><div id="htmlwidget-48fea9f4fbf12f085d53" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-48fea9f4fbf12f085d53">{"x":{"html":"<ul>\n  <li>.w<span class='match'>kkkk<\/span>w<span class='match'>k<\/span>w<span class='match'>kk<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#数量词加号不再将空字符视为一个模式(pattern),加号匹配前一个字符串出现至少一次的模式(pattern)
```

\{n} 代表前一个正则表达式出现n次<br />


```r
#a{n} 将会匹配字符串中连续出现了n个a的模式(pattern)
```


```r
#寻找字符串abaa中所有由2个a组成的模式(pattern)
str_view_all('abaa','a{2}') 
```

<!--html_preserve--><div id="htmlwidget-f87e6b5d91f6d9a8993d" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-f87e6b5d91f6d9a8993d">{"x":{"html":"<ul>\n  <li>ab<span class='match'>aa<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#寻找字符串.wkkkkwkwkk中所有由4个k组成的模式(pattern)
str_view_all('.wkkkkwkwkk','k{4}')
```

<!--html_preserve--><div id="htmlwidget-20f9c39171920954f754" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-20f9c39171920954f754">{"x":{"html":"<ul>\n  <li>.w<span class='match'>kkkk<\/span>wkwkk<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


\{n,} 代表前一个正则表达式出现n次或者更多<br />


```r
#a{n,} 将会匹配字符串中连续出现了n个a或者更多的模式(pattern)
```


```r
#寻找字符串abaaab.bbaaaa.aaa中所有由2个或2个以上a组成的模式(pattern)
str_view_all('abaab.bbaaaa.aaa','a{2,}') 
```

<!--html_preserve--><div id="htmlwidget-047106d723581813d2d4" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-047106d723581813d2d4">{"x":{"html":"<ul>\n  <li>ab<span class='match'>aa<\/span>b.bb<span class='match'>aaaa<\/span>.<span class='match'>aaa<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#寻找字符串.wkkkkwkwkk.32.qwdsfkkkkkkkk.wd中所有由4个或者4个以上k组成的模式(pattern)
str_view_all('.wkkkkwkwkk.32.qwdsfkkkkkkkk.wd','k{4,}')
```

<!--html_preserve--><div id="htmlwidget-dc4ba2db46e2dabb30da" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-dc4ba2db46e2dabb30da">{"x":{"html":"<ul>\n  <li>.w<span class='match'>kkkk<\/span>wkwkk.32.qwdsf<span class='match'>kkkkkkkk<\/span>.wd<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

\{n,m} 代表前一个正则表达式出现的次数在n到m之间(包括n和m)<br />


```r
#a{n,m} 将会匹配字符串中连续出现了n到m个a的模式(pattern)
```


```r
#寻找字符串abaaab.bbaaaa.aaa中所有由2到4个a组成的模式(pattern)
str_view_all('abaab.bbaaaa.aaa','a{3,4}') 
```

<!--html_preserve--><div id="htmlwidget-312b0a057a24527be053" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-312b0a057a24527be053">{"x":{"html":"<ul>\n  <li>abaab.bb<span class='match'>aaaa<\/span>.<span class='match'>aaa<\/span><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
#寻找字符串.wkkkkwkwkk.32.qwdsfkkkkkkkk.wd中所有由4到6个k组成的模式(pattern)
str_view_all('.wkkkkwkwkk.32.qwdsfkkkkkkkk.wd','k{4,6}')
```

<!--html_preserve--><div id="htmlwidget-27e48c9dcfe4f669af95" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-27e48c9dcfe4f669af95">{"x":{"html":"<ul>\n  <li>.w<span class='match'>kkkk<\/span>wkwkk.32.qwdsf<span class='match'>kkkkkk<\/span>kk.wd<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


### 括号划分表达式并用转义号码替换

(\ ) 将表达式中的一个部分用括号包含代表着括号中的子表达式自成一个组，系统在匹配表达式时,也会根据括号的顺序来匹配<br />

例如: (a)(bb)(cab) 此正则表达式中，第一组子表达式是a,第二组子表达式是bb,第三组表达式是cab,系统在匹配的时候,匹配的循序也就是先匹配一个a,然后两个b,最后再是cab<br />

我们可以通过在数字前加上双斜杠来直接表示对应数字的子表达式<br />
例如:<br />
\\\\1 在正则表达式中代表第一组子正则表达式<br />
\\\\\3 在正则表达式中代表第三组子正则表达式<br />
等等<br />

表达式 '(a)(b)(c)(c)(b)(a)' 和 '(a)(b)(c)\\3\\2\\1'是相同的 <br />
表达式 '(aab)(cde)(c)(aab)(c)(cde)' 和 '(aab)(cde)(c)\\1\\3\\2'是相同的 <br />


```r
str_view_all("abccbaab", '(a)(b)(c)\\3\\2\\1')
```

<!--html_preserve--><div id="htmlwidget-3e8903223eaff8ec4fc2" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-3e8903223eaff8ec4fc2">{"x":{"html":"<ul>\n  <li><span class='match'>abccba<\/span>ab<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

```r
str_view_all("abccbaab", '(a)(b)(c)(c)(b)(a)')
```

<!--html_preserve--><div id="htmlwidget-2c5e6118141d2c86f820" style="width:960px;height:100%;" class="str_view html-widget"></div>
<script type="application/json" data-for="htmlwidget-2c5e6118141d2c86f820">{"x":{"html":"<ul>\n  <li><span class='match'>abccba<\/span>ab<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->




## 参考文献(Reference)
http://edrub.in/CheatSheets/cheatSheetStringr.pdf



