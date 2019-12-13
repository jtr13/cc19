
# Data structure and cleaning 101

Zijian Wang and Shuo Yang


## Overview
From our own experiences, many of the errors or difficulties arised during implementing charts or analysis are highly likely due to the data. In this tutorial, we will discuss and summarize some basic data structure knowledge and useful data cleaning skills. We hope it will be helpful by shareing some common mistakes and practical tips, especially for the beginners in R. 

## Data Structure

### Basic Data Types

  + character: strings "this is an example".
  + numeric: numbers 1, 1.1, 2.5.
  + factor: categorical labels "red", "green", "blue".
  + Date: dates "2001-02-03", "09-20-2019".
  + logical: Boolean True, Flase.
  + integer : integer values 1, 2, 3.

For these commonly used data types, we can check the data type by `is.*()` and convert to one another using `as.*()`. 

### Attributes

R objects can have attributes to describe the data object. Commonly used attributes are names, dimnames, dimensions, class, length and other user-defined attibutes.

### Vector
Vector is a basic data structure in R. It cantains the element of the same type. 

**Create**

  + Assign value directly by `c()`


```r
v<-c('Alpha','Beta') #char vector
v<-c(TRUE, FALSE, TRUE) #logi vector
v<-c(1,6,4.5,3.2) #num vector 
```

  + Use `:` operator for numeric sequence with increment 1

```r
v<-1:4
```

  + Use functions that returns a vector


```r
seq(0,1,by=0.1) #increment by 0.1
```

```
##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0
```

```r
rep(c("A","B"), each=2, times=3) #repeat each by 2 times and 3 complete replications
```

```
##  [1] "A" "A" "B" "B" "A" "A" "B" "B" "A" "A" "B" "B"
```

**Access**

  + Use integer as index


```r
v<-1:4
v[c(1,2)]  #access 1st and 2nd element.
```

```
## [1] 1 2
```
  
  + Use logical vector as index


```r
v>2 #a logical vector comparing elements in v to 2.
```

```
## [1] FALSE FALSE  TRUE  TRUE
```

```r
v[v>2] #access elements that is larger than 2.
```

```
## [1] 3 4
```

  + Use element name as index
  

```r
names(v)<-c('A','B','C','D') #assign each element a name
v[c('A','B')] # using name as an index
```

```
## A B 
## 1 2
```

**Operation**

  + Modify an element: use `<—` to assign a value to overide the original one
  

```r
v<-1:4
v[1]<-5
v
```

```
## [1] 5 2 3 4
```

  + Add an element: use c() to add or combine two vectors
  

```r
c(v,c(1,2,3)) # combine two vectors together.
```

```
## [1] 5 2 3 4 1 2 3
```
 
  + Delete an element: use negative index to delete the element


```r
v[-3] #delete the 3rd element
```

```
## [1] 5 2 4
```
  
 
### Matrix

Matrix is similar to vector with additional dimension attribute. Matrix is 2-dimensional and requires the same type elements.

**Create**

  + Use `matrix()` to create a matrix. Dimension attribute can be set by `nrow` and/or `ncol`. Dimension names can also be set by argument. Matrix is filled by column by default.
  

```r
m<-matrix(1:6, nrow=2, #byrow=FALSE by default
       dimnames=list(c("row1","row2"),
                     c("col1","col2","col3"))) 
m
```

```
##      col1 col2 col3
## row1    1    3    5
## row2    2    4    6
```

  + Filled by row:


```r
matrix(1:6, nrow=2, byrow=TRUE)
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    4    5    6
```

**Access**

Elements of matrix can be accessed by integer, logical and name as index, like what we do with vector. Index is needed for both row and column.

  + Use integer as index


```r
m[1,3] # element in row 1 and column 3
```

```
## [1] 5
```

```r
m[,-1] # select all column except first column.
```

```
##      col2 col3
## row1    3    5
## row2    4    6
```

  + Use logical vector as index 


```r
m[c(TRUE,FALSE),] # select rows 1
```

```
## col1 col2 col3 
##    1    3    5
```

```r
m[m>2] # select element that greater than 2
```

```
## [1] 3 4 5 6
```

  + Use element name as index


```r
m['row2',c('col2','col3')] # select element in 2nd row and 2nd and 3rd column.
```

```
## col2 col3 
##    4    6
```


**Operation**

  + Combine two matrices (same column) by row: `rbind()`

```r
x<-matrix(c(1,2,3,4), nrow = 2)
y<-matrix(c(5,6,7,8), nrow = 2)
rbind(x,y)
```

```
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
## [3,]    5    7
## [4,]    6    8
```

  + Combine two matrices (same row) by column: `cbind()`


```r
cbind(x,y)
```

```
##      [,1] [,2] [,3] [,4]
## [1,]    1    3    5    7
## [2,]    2    4    6    8
```

  + Change dimension using `dim()`

```r
dim(x)<-c(1,4)# change the dimension to (1,4)
x #Matrix is rearranged by column.
```

```
##      [,1] [,2] [,3] [,4]
## [1,]    1    2    3    4
```

### Array

Arrays can store data in more than two dimensions. One-dimensional arrays are similar to vectors. A two-dimensional arrays are the same as a matrix. Array requires input of same type.

**Create**


```r
A<-array(1:12, dim=c(3,2,2))  # create a array of three dimension. 
A
```

```
## , , 1
## 
##      [,1] [,2]
## [1,]    1    4
## [2,]    2    5
## [3,]    3    6
## 
## , , 2
## 
##      [,1] [,2]
## [1,]    7   10
## [2,]    8   11
## [3,]    9   12
```

**Access**

Accessing elements is similar to vector and matrix. The index must be consistent with the dimension. For a three-dimensional array, index is in the format `[ , , ]`.

**Operation**

  + As array is made of matrices in multiple dimensions, the operation on elements are carried out by accessing elements of the matrices.
  

```r
matrix1<-A[,,1]
matrix2<-A[,,2]
matrix1+matrix2 # add element in the two matrix together accordingly.
```

```
##      [,1] [,2]
## [1,]    8   14
## [2,]   10   16
## [3,]   12   18
```

  + We can also do operation on specific dimension of an array:
  

```r
apply(A,1,sum) # sum the rows value across all matrixis.
```

```
## [1] 22 26 30
```

```r
apply(A,2,sum) # sum the columns value across all matrixis.
```

```
## [1] 30 48
```

```r
apply(A,3,sum) # sum the matrix value across all matrixis
```

```
## [1] 21 57
```

### List

A vector with elements of different types is called a list. For example, a list can have a vector of character, a factor, a numeric matrix and a data frame as its four components. Great flexibility makes lists widely used. 

**Create**

We can give names of the components to the list or use the index for reference.


```r
L<-list(a=1:4,FALSE) # assign a name to the first component
L
```

```
## $a
## [1] 1 2 3 4
## 
## [[2]]
## [1] FALSE
```

**Accesse**

  + We can access the contents in each component by either `$` notation or `[[]]`


```r
L$a 
```

```
## [1] 1 2 3 4
```

```r
L[[2]]
```

```
## [1] FALSE
```

  + We can obtain a sublist of the list by `[]`

```r
L[1]
```

```
## $a
## [1] 1 2 3 4
```
  
  + Note that `L[[1]]` returns the content of the first component, which is a numeric vector in our example. On the other hand, `L[1]` returns a list of one component, which is the first component of L.

**Operation**

  + Add components to a list: similar like vector, we can use `c()` to add components. The list structure is dynamic, which means we can also simply assign values using new tags.
  

```r
c(L,b="s")
```

```
## $a
## [1] 1 2 3 4
## 
## [[2]]
## [1] FALSE
## 
## $b
## [1] "s"
```

```r
L$b<-"s" # add a string component to the list and name it 'b'.
L
```

```
## $a
## [1] 1 2 3 4
## 
## [[2]]
## [1] FALSE
## 
## $b
## [1] "s"
```
  
  + Delete components from a list: we can delete a component either by negative index or assigning `NULL` to it.
  

```r
L[-1] # delete the first component of the list.
```

```
## [[1]]
## [1] FALSE
## 
## $b
## [1] "s"
```

```r
L$b<-NULL # delete the component which name is b.
L
```

```
## $a
## [1] 1 2 3 4
## 
## [[2]]
## [1] FALSE
```

  + Flatten lists: use `unlist` to produce a vector for all components in the list. The components will be converted into an approporiate unique mode.

```r
unlist(L) # FALSE is converted to 0
```

```
## a1 a2 a3 a4    
##  1  2  3  4  0
```

### Data Frame

Data frame is a special case of list. Data frame is organized in a two-dimensional way, which has equal length for each column.

**Create** 

Use `data.frame()`. If the name of a column is not provided, it will make a valid name with the component. Another thing to point out is argument `stringsAsFactors`. It is set to default setting, which is `TRUE` for most of the cases. We recommend to set it to `FALSE` if there is at least column meant to be character.

```r
df<-data.frame('A'=c(1,2,3),'B'=c('a','b','c'), stringsAsFactors = FALSE)
df
```

```
##   A B
## 1 1 a
## 2 2 b
## 3 3 c
```

**Access**

  + The content can be accessed like a list using `$` operator and `[[]]` or like a matrix using the index.

```r
df$A #using name to select columns
```

```
## [1] 1 2 3
```

```r
df[[1]] #like a list
```

```
## [1] 1 2 3
```

```r
df[,1] #like a matrix
```

```
## [1] 1 2 3
```

**Operation**

Here we only discuss basic operation of data frame from a data structure perspective. `{dplyr}` is highly recommended for efficient data frame operation.

  + Add a column in data frame: just like list.

```r
df$'m'<-c(TRUE,TRUE,FALSE) # add a column m
df<-cbind(df,n=2:4) # add a column n
df
```

```
##   A B     m n
## 1 1 a  TRUE 2
## 2 2 b  TRUE 3
## 3 3 c FALSE 4
```

  + Add a row in data frame: add the new row as a data frame.

```r
df.new<-data.frame(A=4, B="d", m=TRUE, n=5)
rbind(df,df.new) # add a row
```

```
##   A B     m n
## 1 1 a  TRUE 2
## 2 2 b  TRUE 3
## 3 3 c FALSE 4
## 4 4 d  TRUE 5
```

  + Delete a column in data frame: we can do this by consider the data frame as a matrix or list
  

```r
df[[1]]<-NULL # delete the first column
df
```

```
##   B     m n
## 1 a  TRUE 2
## 2 b  TRUE 3
## 3 c FALSE 4
```

  + Delete a row in data frame: just like matrix, by negative the row index we want to delete
  

```r
df[-1,] # delete the first row
```

```
##   B     m n
## 2 b  TRUE 3
## 3 c FALSE 4
```


### Data Structure Conversion

  + Similar as data types, there are `as.*` functions to convert object into different structures. 
  + Pay attention to the differences in attributes when performing conversion. For example, A data frame converted to a matrix will lose its variety in column data types.

### Functions to Check Data Structure Attributes

**Name Related**

  + `names()`: get or set the names of the object. For matrix-like objects (matrix and data frame), `names()` is dealing with the column names. 
  + `colnames()` and `rownames()`: only work for matrix-like objects.

**Size Related**

  + `length()`: get or set the length of object.

```r
vector<-1:12
length(vector)  # length of the vector is the number of elements.
```

```
## [1] 12
```

```r
matrix<-matrix(1:12,nrow = 3)
length(matrix) # length of the matrix is the number of all elements.
```

```
## [1] 12
```

```r
array<-array(1:12,dim=c(2,3,2))
length(array)  # length of the array is the number of all elements.
```

```
## [1] 12
```

```r
list<-list('a'=c(1,2,3),'b'=c('r','b'))
length(list) # length of the list is the number of components in the list.
```

```
## [1] 2
```

```r
df<-data.frame('a'=c(1,2,3),'b'=c('A','B','C'))
length(df) # length of the data frame is the number of column.
```

```
## [1] 2
```

  + `nrow()` and `ncol()`: returns the number of rows or column for matrix-like objects.
  + `dim()`: returns a vector `c(nrow(), ncol())` for matrix-like objects.

**Type Related**

  + `typeof()`: object's type (low-level).
  + `class()`: object's type (high-level).

**Others**

  + `attributes()`: present the attributes of the object.
  + `str()`: structure of the object and information about the class, length and content of each column.
  

```r
str(df)
```

```
## 'data.frame':	3 obs. of  2 variables:
##  $ a: num  1 2 3
##  $ b: Factor w/ 3 levels "A","B","C": 1 2 3
```

  + `summary()`: summary statistics

```r
summary(df) #summary for data frame by column
```

```
##        a       b    
##  Min.   :1.0   A:1  
##  1st Qu.:1.5   B:1  
##  Median :2.0   C:1  
##  Mean   :2.0        
##  3rd Qu.:2.5        
##  Max.   :3.0
```

```r
summary(L) #summary for list
```

```
##   Length Class  Mode   
## a 4      -none- numeric
##   1      -none- logical
```

  + `head()` and `tail()`: return the first few part and last few part of the object

```r
head(1:100)
```

```
## [1] 1 2 3 4 5 6
```

```r
tail(1:100)
```

```
## [1]  95  96  97  98  99 100
```

__*Tips:*__

  - Getting familiar with different data types and structures will help you spot simple mistakes. Be aware of each data structures' different characteristics, like dimension and data types. 
  
  - Most of the functions require certain type of data input and produce certain type of outputs. Keeping a clear clue of what to input and what you get will help debug errors.
  
  - Understanding the relationship and conversion among different data structures will provide more flexibility dealing with the analysis.


## Data Cleaning

Getting data ready for analysis can be quite tedious and time consuming. In this chapter, we will discuss some general workflow for the data cleaning process using {`tidyverse`}, including importing and tidying data. We will also summarise some common mistakes and provide useful tips.

### Import Data

Commonly used data file types are .txt, .csv, .xlsx and .xls. 

**Import .txt and .csv using {`readr` package}**
      
  + The .txt and .csv files are flat files with certian character as **delimiter** to seperate fields with in a record. Normally .txt is tab (`\t`) delimited and .csv is comma (`,`) delimited. 
  + General function to import a delimited file is `read_delim()`. Argument `delim` needs to be set to indicate delimiter. With commonly used delimiers "`,`" and "`\t`", `read_csv()` and `read_tsv` are the special caes of `read_delim()`. For example, `read_csv(...) = read_delim(..., delim=",")`.
  + By defualt, argument `col_names` is set to be `TRUE` for these `read_*` functions. It uses the first row as the column names. Remember to set it to `FALSE` if it starts with data directly without column names. `col_names` can also take a character vector for the known column names.
  + By defualt, argument `na` is set to be `c("","NA")`. If there is any other input interpreted as missing values, like `"N\A"` or `"*"`, it can be pass to `na` as a character vector.


```r
library(tidyverse)
df<-read_delim("1|a|\nNA|c|5.5\n2|*|4.3", delim = "|",
           col_names=c("A","B","C"), na=c("","NA","*"))
df
```

```
## # A tibble: 3 x 3
##       A B         C
##   <dbl> <chr> <dbl>
## 1     1 a      NA  
## 2    NA c       5.5
## 3     2 <NA>    4.3
```

**Import .xlsx and .xls using {`readxl` package}**

  + `read_excel()` is commonly used, without specifying file type. Otherwise, `read_xls()` can be used for .xls file and `read_xlsx()` can be used for .xlsx file.
  + Argument `sheet` is for the sheet to read. It is either a string  of the sheet name, or an integer $i$ for the ith sheet.
  + `col_names` is similar to {`readr`} functions
  + `na=""` by default. It can be modified similar as the above {`readr`} functions.
  
__*Tips:*__
  
  - It is always helpful to open the original files to observe the data first. This will help determine which delimiter is used, whether the first line is the column name, what should be interpreted as missing value, and any notable pattern for further cleaning (for example 50* for 50 with some notes).
  
  - Sometimes it might not be possible to open the original file directly, for example the file size is too large. Then you need to go through a trial and error process to set the proper arguments. In this case, argument of `n_max` is very useful. You can start with the general functions reading the first 10 rows by setting `n_max=10`. Then you can decide whether the first row is the column name. For delimited files, you can try a few delimiter till you find the correct one. As for missing values, you can always find a way to modify them in the later cleaning process.
  
  - There is an easy way to familiarize yourselve with the previous two sets of function. On the Environment tab, you can manually import dataset. Select "From Text (readr)..." and "From Excel..." from the dropdown list and play around with the "Import Options". Then you can visualize the effects of different arguments directly from the "Data Preview" and learn the coding details from the "Code Preview".
  
  - The local file to read is usually put in the working directory. But if you want to access a file in some other folder and do not know the path to it, here is the trick. Function `file.choose()` will pop up a dialog box allowing you to choose a file interactively and return the path to this file.
  
There are packages for other types of data to explore:

  + {`rvest`} for html data, like the `html_table`.
  + {`haven`} reads SPSS, Stata, and SAS files.
  + {`dbplyr`} returns a data frame with SQL queries against a database, along with a backend package {`DBI`} to work with different databases (e.g. RMySQL, RSQLite, RPostgreSQL etc).


### Tidy Data

Before we perform any data manipulation with fancy dplyr pipes for further visualization or modeling, we must have tidy data at hand. However in the real world, the imported data is never as clean as the textbook one. Each data has its own adjustment needs, here we try to discuss some must-check steps and useful skills, along with some tips.
  
**Data Overview**

  + Use `str()` to get the structure of the data frame. It shows the size of the data frame, each column's name and data types. This is a quick check of what the data looks like. 
  + Use `head()` to get first few rows of data.
  + Use `summary()` to get a columnwise statistics summary. This will provide some initial ideas of the data range and distribution. It is also a good way to check NAs.
  + These functions is useful whenever a data overview is needed in the data cleaning process, especially when there is any big change in the data frame.

**Column Names**

  + Majority of the functions for data import will return a data-frame like structure or something can be easily transformed into a data frame. An important feature of data frame is its column name. `{readr}` can preserve its column names as original with white space and special characters, but it is still recommended to keep a clear short name with "_" at most.
  + Renaming the columns is basically string manipulation, which can be performed with `{stringr}`
  

```r
  eg.colname<-c("Number of Moons", "Ring System?")
  #eg1: replace white space by "_"
  eg1<-str_replace_all(eg.colname," ","")
  eg1
```

```
## [1] "NumberofMoons" "RingSystem?"
```

```r
  #eg2: remove all white space and special characters
  eg2<-str_replace_all(eg.colname,"(\\W)","")  #\W is RegEx for any non char
  eg2
```

```
## [1] "NumberofMoons" "RingSystem"
```

```r
  #eg3: keep the first 3 char as the abbr.
  eg3<-str_sub(eg.colname, 1, 3)
  eg3
```

```
## [1] "Num" "Rin"
```

```r
  #eg4: design your own way for names
  eg4<-sapply(sapply(eg.colname,str_extract_all,"([A-Z][a-z]{2})"),
                        paste0,collapse = "")
  eg4
```

```
## Number of Moons    Ring System? 
##        "NumMoo"        "RinSys"
```
  + Then column names can be changed by `colnames` or `rename_*` functions, along with above string manipulation.
  + The original informative long column names can be stored in a vector separately for future reference.
  + Similar treatments can be applied to row names as needed.

**Transpose**

  + Sometimes we need to transpose data frame for a better organization of data. It is better to perform transposition before any further modification of data.
  + Simpliest way is to treat data frame a matrix and use `t()`, after which `as.data.frame()` is needed to transfer data back to a data frame. The drawback is all entries will be forced into one data type. This can be modified in later stage.
  + A better way to transpose data frame while maintaining each column's data type is to use `gather()` and `spread()`.

**Columnwise Modification**

  + Use `mutate_all()` for general patterns applied to all collumns. For example, remove any unnecessary notation.


```r
df<-data.frame(ID=c("test_1","test_2","test_3"),
               Value=c("3","4.5*","2"),
               Type=c("A","A","B*"), stringsAsFactors=F)

df<-df%>%mutate_all(function(x){str_remove_all(x,"\\*")})
  #df%>%mutate_all(str_remove_all,"\\*") #produce the same result
df
```

```
##       ID Value Type
## 1 test_1     3    A
## 2 test_2   4.5    A
## 3 test_3     2    B
```

  + Use `mutate_if()` or `mutate_at()` to modify selected columns. For example, double the value of each numeric column. 


```r
df<-df%>%
  mutate_at(vars(Type), as.factor)%>%
  mutate_at("Value",as.numeric)%>%
  mutate_if(is.numeric, ~.^2)
df
```

```
##       ID Value Type
## 1 test_1  9.00    A
## 2 test_2 20.25    A
## 3 test_3  4.00    B
```
  
  + Use `separate()` to separate information in one column into multiple columns. Combine with string manipulation to modify character columns as desired. 
 

```r
df%>%separate(ID,c("ID_Type","Index"),sep="_")
```

```
##   ID_Type Index Value Type
## 1    test     1  9.00    A
## 2    test     2 20.25    A
## 3    test     3  4.00    B
```

```r
df%>%mutate(Index = str_extract(ID,"\\d"))
```

```
##       ID Value Type Index
## 1 test_1  9.00    A     1
## 2 test_2 20.25    A     2
## 3 test_3  4.00    B     3
```
  
**NAs and Outliers**

Missing values and extreme values are also very important for future analysis. Depending on the purposes, there are different strategies dealing with them. We will not cover them in this tutorial, but we need to highlight their importance. We would rather to include NA and outlier processing in the later stages of data analysis, as the strategies might be adjusted along the way. 

__*Tips:*__

  - It always worths studying the documentations about the original data in more details. This will help you get a better understand of the data: what the number unit is, what the possible values of the data are, any natural relation presents and so on.
  
  - Store the data as different objects from time to time. This helps to keep tracks for future reference and debug.
  
  - Column modification is basically `mutate_*` functions with some functions to modify the columns. Simple functions without arguments are easy to use within the `mutate_*` functions. For complex modification involving multiple functions, it is recommended to define a new function which only requires the column values as the input. 
  
  - Try to make your code more generic, so that it can be applied to similar data with minimal modification.
  
  
**Reference:**
 
 1. [R for Data Science] https://r4ds.had.co.nz/
 2. [edav.info/] https://edav.info/index.html
