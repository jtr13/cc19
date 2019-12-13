
# rvest package 1

Sunny Lee and Jinrong Cao

 
In this page you will find the translated version of the Rvest package in Madarin Chinese. Rvest package is a powerful tool for extracting information on webpages.The original package can be found here: https://cran.r-project.org/web/packages/rvest/rvest.pdf.


**rvest 程序包**\
2019年5月15日\
\
標題：簡單方便地提取網頁上的信息與數據\
版本： 0.3.4\
描述：为了便于下载和操作HTML和XML而设计的, 并且基于‘xml2’和’httr’上的包装\
許可：GPL-3\
網址：http://rvest.tidyverse.org/，https://github.com/tidyverse/rvest \
報錯網址：https://github.com/tidyverse/rvest/issues\
依赖包：R (>= 3.2), xml2\
输入： httr (>= 0.5), magrittr, selectr\
建議：covr，knitr，png，rmarkdown，spelling，stringi (>=版本0.3.1)，testthat\
插圖生成器：knitr\
編碼：UTF-8\
語言：英語-美國\
LazyData: 是\
RoxygenNote 6.1.1\
编辑需要：否\
作者：Hadley Wickham，RStudio\
維護者：Hadley Wickham<hadley@rstudio.com>\
仓库： CRAN\
日期/出版：2019-05-15 20:10:30 UTC\
\
\
**R主题记录**\
encoding . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . . . . . 2\
google_form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 3\
html . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .3\
html_form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . .. . . . . . . . . . . . . . . . . . . . 4\
html_nodes . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . . . . . . 5\
html_session . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . .. . . ..  . . . . . . . .. . . 6\
html_table . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . .. . . . . . . . . . . .. 7\
html_text . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . . . . .  .. . 8\
jump_to . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . . . . . . . .  . . . .. . . 9\
pluck . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . .. . . . . . . . . . . . . . .  10\
session_history . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . . . . 11\
set_values . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . . . .. .  . . 11\
submit_form . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  . . . . . . . . . .  . . . . . . 12\
\
\
**目錄**\
——————————————————————————————————————————\
Encoding &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 猜测并修正错误的字符编码\
——————————————————————————————————————————\
\
描述\
这些函数帮助你应对显示错误编码的网页。你可以使用guess_encoding找到正确的编码（并将结果作为参数提供给html的encoding），或者在找到正确信息之后使用repair_encoding纠正字符向量。\
\
使用\
guess_encoding(x)\
repair_encoding(x, from = NULL)\
\
參數\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一個字符型向量\
	from &nbsp;&nbsp;&nbsp; &nbsp;字符串實際所在編碼。如果為 NULL，guess_coding會被使用\
\
stringi\
	這些功能是極好的stringi程序包的周圍工具，所以你必須事先安裝好stringi程序包\
\
例子\

```r
# 在程序包中包含一個不完善的編碼
path <- system.file("html-ex", "bad-encoding.html", package = "rvest")
x <- read_html(path)
x %>% html_nodes("p") %>% html_text()

guess_encoding(x)
# 以下提供兩個有效的編碼，只有一個正確的
read_html(path, encoding = "ISO-8859-1") %>% html_nodes("p") %>% html_text()
read_html(path, encoding = "ISO-8859-2") %>% html_nodes("p") %>% html_text()
```
\
——————————————————————————————————————————\
google_form &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 得到id之后创建一个google form的链接\
——————————————————————————————————————————\
\
描述\
得到id之后创建一个google form的链接\
\
使用\
	google_form(x)\
\
参数\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 唯一的字符向量\
\
例子\

```r
	google_form("1M9B8DsYNFyDjpwSK6ur_bZf8Rv_04ma3rmaaBiveoUI")
```
\
——————————————————————————————————————————\
html &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 对一个HTML网页进行爬虫\
——————————————————————————————————————————\
\
描述\
html被弃用时：请使用read_html()代替\
\
使用\
	html(x, …, encoding = “”)\
\
	class ‘session’ 的S3方法:\
	read_xml(x, …, as_html = FALSE)\
\
参数\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一个url, 一个本地路径, 一个包含html的字符串, 或是一个httr请求后的回应\
	… &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 如果x為一個URL，額外的參數會被傳送給httr::GET()\
	encoding &nbsp;&nbsp;&nbsp; 详述文件的编码。参照iconvlist()里的完整列表。如果在判断正确编码的过程中遇到问题，尝试stringi::stri_enc_detect()\
	as_html &nbsp;&nbsp;&nbsp;&nbsp; 可以選擇如同爬html檔一般地爬一個xml檔\
\
例子\

```r
# 通過url:
google <- read_html("http://google.com", encoding = "ISO-8859-1")
google %>% xml_structure()
google %>% html_nodes("div")

# 通過字符序列： (最少要是html 5文件)
# http://www.brucelawson.co.uk/2010/a-minimal-html5-document/
minimal <- read_html("<!doctype html>
  <meta charset=utf-8>
 <title>blah</title>
 <p>I'm the content")
minimal
minimal %>% xml_structure()

# 通過httr請求
google2 <- read_html(httr::GET("http://google.com"))
```
\
——————————————————————————————————————————\
html_form &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 对一个网页里的表格进行爬虫\
——————————————————————————————————————————\
\
描述\
爬取網頁上的表單\
\
使用\
	html_form(x)\
\
参数\
	x	一个节点，节点的集合或一个文件\
\
可参照\
HTML 4.01 form specification: http://www.w3.org/TR/html401/interact/forms.html \
\
例子\

```r
html_form(read_html("https://hadley.wufoo.com/forms/libraryrequire-quiz/"))
html_form(read_html("https://hadley.wufoo.com/forms/r-journal-submission/"))

box_office <- read_html("http://www.boxofficemojo.com/movies/?id=ateam.htm")
box_office %>% html_node("form") %>% html_form()
```
\
——————————————————————————————————————————\
html_nodes &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 从HTML文件里抓取节点\
——————————————————————————————————————————\
\
描述\
使用XPath與CSS選擇器更輕易地從html檔案獲取信息。當與https://selectorgadget.com/ \ 一同使用時CSS選擇器特別有效：因為這能讓你輕易地找到你該使用哪個選擇器。若是你之前沒有使用過CSS選擇器，跟著這個有趣的教學操作一遍：http://flukeout.github.io/ \
\
使用\
	html_nodes(x, css, xpath) \
	html_node(x, css, xpath) \
\
参数\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一个文件，一个节点的集合或一个节点\
	css, xpath &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 要选择的节点。取决于要使用CSS或XPath 1.0选择器，提供一个css或xpath\
\
html_node 與 html_nodes 比較\
html_node就像是 “[[”，它總是只會獲取剛好一個元素。當給予一列的節點，html_node總是會給出同樣長度的列表，而html_nodes給出的長度可能會更長或是更短。\
\
CSS选择器支持\
CSS选择器被selectr包翻译成XPath选择器，而这个选择器是python cssselect库的一个端口, https://pythonhosted.org/cssselect/. \
它执行大多数CSS3里的选择器，参照描述：http://www.w3.org/TR/2011/REC-css3-selectors-20110929/. 例外情况如下：\
- 需要交互的虚拟选择器被忽略：:hover, :active, :focus, :target, :visited \
- 如下的虚拟classes无法和通配符元素*运作：*:first-of-type, *:last-of-type, *:nth-of-type, *:nth-last-of-type, *:only-of-type \
- 它支持：:contains(text) \
- 你可以使用!=, [foo!=bar] 等同于 :not([foo=bar]) \
- :not() 接受一个由简单选择器构成的序列，而不仅仅是一个简单选择器 \
\
例子\

```r
# CSS 選擇器----------------------------------------------
ateam <- read_html("http://www.boxofficemojo.com/movies/?id=ateam.htm")
html_nodes(ateam, "center")
html_nodes(ateam, "center font")
html_nodes(ateam, "center font b")

# 但是 html_node 最好與 magrittr程序包內的 %>% 一同使用 
# 你可以使用chain subsetting連鎖子集合:
ateam %>% html_nodes("center") %>% html_nodes("td")
ateam %>% html_nodes("center") %>% html_nodes("font")

td <- ateam %>% html_nodes("center") %>% html_nodes("td")
td
# 當使用在一序列的節點上，html_nodes()將給出所有節點，並將結果壓縮成一個
# 新的节点列表对象(nodelist) 
td %>% html_nodes("font")
# html_node()給出第一個符合的節點. 若是找不到符合的節點，它會給出一個”missing”節點 
if (utils::packageVersion("xml2") > "0.1.2") {
  td %>% html_node("font")
}

# 若要選出一個在特定位置的元素，你該使用magrittr::extract2，這是”[[“的一個別名
library(magrittr)
ateam %>% html_nodes("table") %>% extract2(1) %>% html_nodes("img")
ateam %>% html_nodes("table") %>% `[[`(1) %>% html_nodes("img")

# 找出前兩個表格中的所有圖像
ateam %>% html_nodes("table") %>% `[`(1:2) %>% html_nodes("img")
ateam %>% html_nodes("table") %>% extract(1:2) %>% html_nodes("img")

# XPath 選擇器 ---------------------------------------------
# 和XPath連鎖(chaining)有點棘手 - 你可能需要變更使用中的字首
# 不論你現在在檔案中的哪裡，應該都是從根節點(root node)中做選擇
ateam %>%
  html_nodes(xpath = "//center//font//b") %>%
  html_nodes(xpath = "//b")
```
\
——————————————————————————————————————————\
html_session &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  模拟一个html浏览器的session\
——————————————————————————————————————————\
\
描述\
	模拟一个html浏览器的session\
\
使用\
	html_session(url, ...)\
	is.session(x)\
\
参数\
	url &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 开始 session的位置\
	… &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 任何在session中使用的其他httr配置\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一个用于测试是否是session的对象\
\
方法\
一个session对httr和html方法的组合进行回应：使用httr::cookies(), httr::headers()和httr::status_code()获取要求的属性；使用html_nodes()获取html\
\
例子\

```r
# http://stackoverflow.com/questions/15853204\

s <- html_session("http://hadley.nz")
s %>% jump_to("hadley-wickham.jpg") %>% jump_to("/") %>% session_history()
s %>% jump_to("hadley-wickham.jpg") %>% back() %>% session_history()

s %>% follow_link(css = "p a")
```
\
——————————————————————————————————————————\
html_table &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 将一个html表格爬虫为数据框\
——————————————————————————————————————————\
\
描述\
	将一个html表格爬虫为数据框\
\
使用\
	html_table(x, header = NA, trim = TRUE, fill = FALSE, dec = ".")\
\
参数\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一个节点，节点的集合或一个文件\
	header &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 是否将第一行作为header? 如果是NA, 并且如果包含< th >标签，那么使用第一行\
	trim &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 是否要去除每一个单元格内开头和结尾的空格？\
	fill &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 如果是，自动将每一行内少于最大列数的单元格填充为NAs\
  dec &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 用作小数符号的字符\
\
假设\
html_table目前基于以下假设：\
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 没有任何单元格跨行\
 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 标题在第一行里\
\
例子\

```r
sample1 <- minimal_html("<table>
  <tr><th>Col A</th><th>Col B</th></tr>
  <tr><td>1</td><td>x</td></tr>
  <tr><td>4</td><td>y</td></tr>
  <tr><td>10</td><td>z</td></tr>
</table>")
sample1 %>%
  html_node("table") %>%
  html_table()

# 在合併格中的值會被複製
sample2 <- minimal_html("<table>
  <tr><th>A</th><th>B</th><th>C</th></tr>
  <tr><td>1</td><td>2</td><td>3</td></tr>
  <tr><td colspan='2'>4</td><td>5</td></tr>
  <tr><td>6</td><td colspan='2'>7</td></tr>
</table>")

sample2 %>%
  html_node("table") %>%
  html_table()

# 如果表格格式不整齊、每個縱列中的行數不同，使用`fill = TRUE`來填滿缺失值
sample3 <- minimal_html("<table>
  <tr><th>A</th><th>B</th><th>C</th></tr>
  <tr><td colspan='2'>1</td><td>2</td></tr>
  <tr><td colspan='2'>3</td></tr>
  <tr><td>4</td></tr>
</table>")

sample3 %>%
  html_node("table") %>%
  html_table(fill = TRUE)
```
\
——————————————————————————————————————————\
html_text &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 从html里提取属性，文本和标签名\
——————————————————————————————————————————\
\
描述\
	 从html里提取属性，文本和标签名\
\
使用\
html_text(x, trim = FALSE) \
html_name(x) \
html_children(x) \
html_attrs(x) \
html_attr(x, name, default = NA_character_)\
\
参数\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一个文件，节点，或节点的集合\
	trim &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 如果是，那么去除每一个单元格内开头和结尾的空格\
	name &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 需要检索的属性的名字\
  default &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 当属性不存在于每一个节点时，默认使用的字符串\
	\
值\
	html_attr、html_tag、和html_text：一個字符型向量\
	html_attrs： 一個列表\
\
例子\

```r
movie <- read_html("http://www.imdb.com/title/tt1490017/")
cast <- html_nodes(movie, "#titleCast span.itemprop")
html_text(cast)
html_name(cast)
html_attrs(cast)
html_attr(cast, "class")
```
\
——————————————————————————————————————————\
jump_to &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;  链接到一个新的url\
——————————————————————————————————————————\
\
描述\
	 jump_to接受一个url(相对或绝对)；follow_link接受一个指向目前页面上链接(一个< a >标签)的表达\
\
使用\
	jump_to(x, url, …)\
	follow_link(x, i, css, xpath, …)\
\
参数\
	x &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; 一个session\
	url &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一个用于链接的url, 无论相对或绝对\
	... &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 任何用于这个请求的其他httr配置\
	i &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp; 你可以选择：\
	 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一个整数: 选择第i个链接\
	 &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 一个字符串：第一个包含此文本的链接（区分大小写）\
  css &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 選擇的節點。提供css與xpath中的一種（視情況而定：看你想要使用CSS或是 XPath 1.0 選擇器\
  xpath &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;選擇的節點。提供css與xpath中的一種（視情況而定：看你想要使用CSS或是XPath 1.0 選擇器\
	\
例子\

```r
s <- html_session("http://hadley.nz")
s <- s %>% follow_link("github")
s <- s %>% back()
s %>% follow_link("readr")
```
\
——————————————————————————————————————————\
pluck &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 用位置抓取列表内的元素\
——————————————————————————————————————————\
\
描述\
	 用位置抓取列表内的元素\
\
使用\
	pluck(x, i , type)\
\
参数\
	x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一个列表\
	i &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一个字符串或一个整数\
	type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;結果的種類（若知曉）\
\
——————————————————————————————————————————\
session_history &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 用于操作历史记录的工具\
——————————————————————————————————————————\
\
描述\
	 用于操作历史记录的工具\
\
使用\
	session_history(x)\
	back(x)\
\
参数\
	x &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 一个session\
\
——————————————————————————————————————————\
set_values &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 在一个表格中设定数值\
——————————————————————————————————————————\
\
描述\
	 在一个表格中设定数值\
\
使用\
	set_values(form, …)\
\
参数\
	form &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 要調整的表格\
	…	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 要被調整的內容（名稱與值配對）\
\
值\
	表格內被更新的物件\
\
例子\

```r
search <- html_form(read_html("http://www.google.com"))[[1]]
set_values(search, q = "My little pony")
set_values(search, hl = "fr")
## 沒有運行: set_values(search, btnI = "blah")
```
\
——————————————————————————————————————————\
submit_form &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 将一个表格提交回服务器\
——————————————————————————————————————————\
\
描述\
	 将一个表格提交回服务器\
\
使用\
	submit_form(session, form, submit = NULL, ...)\
\
参数\
	session &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 将表格提交到的session\
	form &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	要提交的表格\
	submit &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 用于提交的按钮名字。如果没有提供，默认为表格里第一个提交的按钮（包含一条消息）\
	… &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 任何传递给 httr::GET()或httr::POST()的其他参数\
\	
值\	
如果请求成功，选择爬虫html的回应。如果http请求失败，报错。如果要获取回应里的其他元素，自己用submit_request结果里的元素进行搭建。\
\
例子\

```r
test <- google_form("1M9B8DsYNFyDjpwSK6ur_bZf8Rv_04ma3rmaaBiveoUI")
f0 <- html_form(test)[[1]]
f1 <- set_values(f0, entry.564397473 = "abc")
```
\

