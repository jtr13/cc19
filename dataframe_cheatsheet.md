
# All About Dataframes

Thomas Causero



The purpose of this cheatsheet is to present functions to deal with dataframes. To do so, I'll use 2 different ways: one that doesn't require any additional libraries and one using two libraries (dplyr and tidyr). Note that the tidyverse library contains those two libraries among others. So, one can decide to load dplyr and tidyr sperately or load all of them at the same time using tidyverse.


```r
#library(tidyverse)
library(dplyr)
library(tidyr)
```


## Create Data Frames

There are several ways to create a dataframe using R.

The first one is to create a dataframe with vectors as inputs for every column, to do so, you need to use the following syntax: 

data.frame(x = vector_1, y = vector_2,... ,col_name = vector_n).

To avoid writing too long vectors, you might also use random data or random sampling:

- rnorm(k) will return a k random samples from a standard normal distribution

- runif(k) will return a k random samples from a [0,1] uniform distribution

- rpois(k, lambda) for a poison distribution

- rbinom(k, n, p) for a binomial distribution

Another way to create a dataframe is to use external data, either from a csv file, or using web scrapping techniques. To do so, there is a very useful package **rvest**, which is rather easy to use and which has a function html_table() which convert the html table into a dataframe. 

In the same way, the "read_csv" function takes a csv file as input and ouput a dataframe. Note that for these functions, there are a lot of parameters such as header which enables to control which rows or columns we would like to keep.

To have more information on an R function, you can just tap ?function_name.

Another useful function is write_csv(), which is rather explicit.

Here are a few other functions that can be useful to deal with data:

- to create a vector: 1:10 or c(1:10)

- to repeat 5 10 times: rep(5,10)

- it also works with strings: rep('hey',10) repeat hey 10 times

- rep(c(1,2,3),2) will repeat the vector 1:3 twice

- rep(c(1,2,3), each = 2) will repeat each value of the vector twice


```r
#dataframe with random numbers
df <- data.frame(x = rnorm(5), y = rnorm(5), z = rnorm(5))
df
```

```
##             x          y           z
## 1 -0.06539989  0.2256787 -0.19421678
## 2  0.18470422  0.3790845 -0.25926828
## 3 -0.03302085 -0.2270535  0.39218406
## 4  1.33592831  0.7596725 -0.67016045
## 5  0.28714408 -1.1602793 -0.09767826
```

## Get information on the dataframe

When dealing with dataframes, it is very useful to first look at its characteristic such as the shape or the type of data we are dealing with, here are the functions to do so.


```r
#No additional libraries required

#To look at first rows (here only the first one)
head(df,1)
```

```
##             x         y          z
## 1 -0.06539989 0.2256787 -0.1942168
```

```r
#get number of columns
ncol(df)
```

```
## [1] 3
```

```r
#get number of rows
nrow(df)
```

```
## [1] 5
```

```r
#get dimensions
dim(df)
```

```
## [1] 5 3
```

```r
#get information on each column
str(df)
```

```
## 'data.frame':	5 obs. of  3 variables:
##  $ x: num  -0.0654 0.1847 -0.033 1.3359 0.2871
##  $ y: num  0.226 0.379 -0.227 0.76 -1.16
##  $ z: num  -0.1942 -0.2593 0.3922 -0.6702 -0.0977
```

```r
#There are three main data types: numeric, string and factors (very similar to vectors 
#but very useful with nominal data because it also provides the set of possible values)
factor(c('Tomato','Tomato','Tomato','Tomato','Tomato','Apple','Apple','Apple','Apple'))
```

```
## [1] Tomato Tomato Tomato Tomato Tomato Apple  Apple  Apple  Apple 
## Levels: Apple Tomato
```

```r
#get column names
colnames(df)
```

```
## [1] "x" "y" "z"
```

```r
#get row names
rownames(df)
```

```
## [1] "1" "2" "3" "4" "5"
```

```r
#to change row names or column names with a vector
colnames(df) <- c('a','y','z')
#change only one column name without needing to write all the others
colnames(df)[colnames(df)=="a"] <- 'x' #with the column name
colnames(df)[1]<-"x" #with the column number
```


```r
#Using dplyr and tidyr

#you can rename variables with select but it will drop all the variables not explicitly mentioned
select(df, new = x)
```

```
##           new
## 1 -0.06539989
## 2  0.18470422
## 3 -0.03302085
## 4  1.33592831
## 5  0.28714408
```

```r
#rename() is more useful
rename(df, new = x)
```

```
##           new          y           z
## 1 -0.06539989  0.2256787 -0.19421678
## 2  0.18470422  0.3790845 -0.25926828
## 3 -0.03302085 -0.2270535  0.39218406
## 4  1.33592831  0.7596725 -0.67016045
## 5  0.28714408 -1.1602793 -0.09767826
```


## Concatenate dataframes

When dealing with dataframes, it can also be very useful to concatenate them. To do so, there are several functions such as rbind or cbind. In this section, I will also present functions to merge dataframe (depending on a specific key)


```r
#columns by columns
cbind(1:3,1:3)
```

```
##      [,1] [,2]
## [1,]    1    1
## [2,]    2    2
## [3,]    3    3
```

```r
#rows by rows
rbind(1:3,1:3)
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    1    2    3
```

```r
#apply multiple concatenations
list <- list(1:3, 1:3, 1:3, 1:3, 1:3)
do.call(rbind, list)
```

```
##      [,1] [,2] [,3]
## [1,]    1    2    3
## [2,]    1    2    3
## [3,]    1    2    3
## [4,]    1    2    3
## [5,]    1    2    3
```

```r
df1 <- data.frame(ID = 1:5, value = 5:1)
df2 <- data.frame(ID = 1:5, value = 6:10)
#to merge with a single key
merge(df1, df2, by = 'ID')
```

```
##   ID value.x value.y
## 1  1       5       6
## 2  2       4       7
## 3  3       3       8
## 4  4       2       9
## 5  5       1      10
```

```r
#can also merge with multiple ids: by = c(col1, col2 ...)

#merge with a key that has a different name in datasets
df3 <- data.frame(ID3 = 1:5, value = 6:10)
merge(df1, df3, by.x = 'ID', by.y = 'ID3')
```

```
##   ID value.x value.y
## 1  1       5       6
## 2  2       4       7
## 3  3       3       8
## 4  4       2       9
## 5  5       1      10
```

## Order dataframes

Ordering a dataframe means that you want to reorder the rows depending on the value of a specific colum. You can also change the order of the columns.


```r
#No additional libraries required

#order rows by variable x then y 
df[order(df$x, df$y),]
```

```
##             x          y           z
## 1 -0.06539989  0.2256787 -0.19421678
## 3 -0.03302085 -0.2270535  0.39218406
## 2  0.18470422  0.3790845 -0.25926828
## 5  0.28714408 -1.1602793 -0.09767826
## 4  1.33592831  0.7596725 -0.67016045
```

```r
df[order(df['x']),]
```

```
##             x          y           z
## 1 -0.06539989  0.2256787 -0.19421678
## 3 -0.03302085 -0.2270535  0.39218406
## 2  0.18470422  0.3790845 -0.25926828
## 5  0.28714408 -1.1602793 -0.09767826
## 4  1.33592831  0.7596725 -0.67016045
```

```r
df[order('x')] #doesn't return the whole dataframe (only the column x) and nothing is sorted
```

```
##             x
## 1 -0.06539989
## 2  0.18470422
## 3 -0.03302085
## 4  1.33592831
## 5  0.28714408
```

```r
df[order('x'),] #return the first row of the dataframe and not sorted neither
```

```
##             x         y          z
## 1 -0.06539989 0.2256787 -0.1942168
```

```r
#change columns order (use a vector)
df[,c(1,3,2)]
```

```
##             x           z          y
## 1 -0.06539989 -0.19421678  0.2256787
## 2  0.18470422 -0.25926828  0.3790845
## 3 -0.03302085  0.39218406 -0.2270535
## 4  1.33592831 -0.67016045  0.7596725
## 5  0.28714408 -0.09767826 -1.1602793
```


```r
#Using libraries dplyr and tidyr

#arrange() to reorder the dataframe
arrange(df, -x,y,z)
```

```
##             x          y           z
## 1  1.33592831  0.7596725 -0.67016045
## 2  0.28714408 -1.1602793 -0.09767826
## 3  0.18470422  0.3790845 -0.25926828
## 4 -0.03302085 -0.2270535  0.39218406
## 5 -0.06539989  0.2256787 -0.19421678
```

```r
arrange(df, x,y,z)
```

```
##             x          y           z
## 1 -0.06539989  0.2256787 -0.19421678
## 2 -0.03302085 -0.2270535  0.39218406
## 3  0.18470422  0.3790845 -0.25926828
## 4  0.28714408 -1.1602793 -0.09767826
## 5  1.33592831  0.7596725 -0.67016045
```


## Subset of data tables

Getting subset of a dataframe is very important. Those functions are like filters in a way that they will only return specific rows (or columns) of a dataframe depending on its value.


```r
#For all those functions, no additional libraries are required

#Only return specific row and column numbers
#df[row_numbers, col_numbers]
df[1:4,1:3]
```

```
##             x          y          z
## 1 -0.06539989  0.2256787 -0.1942168
## 2  0.18470422  0.3790845 -0.2592683
## 3 -0.03302085 -0.2270535  0.3921841
## 4  1.33592831  0.7596725 -0.6701605
```

```r
#trake 2 random rows from df
df[sample(1:nrow(df), 2, replace = F),]
```

```
##             x          y           z
## 3 -0.03302085 -0.2270535  0.39218406
## 5  0.28714408 -1.1602793 -0.09767826
```

```r
#get 3 first rows
df[1:3,]
```

```
##             x          y          z
## 1 -0.06539989  0.2256787 -0.1942168
## 2  0.18470422  0.3790845 -0.2592683
## 3 -0.03302085 -0.2270535  0.3921841
```

```r
#remove rows 1 and 2
df[-c(1,2),]
```

```
##             x          y           z
## 3 -0.03302085 -0.2270535  0.39218406
## 4  1.33592831  0.7596725 -0.67016045
## 5  0.28714408 -1.1602793 -0.09767826
```

```r
#select columns
df[,c('x','y')]
```

```
##             x          y
## 1 -0.06539989  0.2256787
## 2  0.18470422  0.3790845
## 3 -0.03302085 -0.2270535
## 4  1.33592831  0.7596725
## 5  0.28714408 -1.1602793
```

```r
#select rows under condition of a certain column
df[df$x<0,] #df[df$col %in% c('var1','var2','var3')]
```

```
##             x          y          z
## 1 -0.06539989  0.2256787 -0.1942168
## 3 -0.03302085 -0.2270535  0.3921841
```

```r
subset(df, x>0 & y>0)
```

```
##           x         y          z
## 2 0.1847042 0.3790845 -0.2592683
## 4 1.3359283 0.7596725 -0.6701605
```


```r
#Now, I'll show similar functions using additional libraries (dplyr and tidyr)

#sample_n() (fixed number) and sample_frac() to take random samples (fixed fraction)
sample_n(df, 1)
```

```
##             x          y         z
## 1 -0.03302085 -0.2270535 0.3921841
```

```r
sample_frac(df, 0.5)
```

```
##             x          y          z
## 1 -0.06539989  0.2256787 -0.1942168
## 2 -0.03302085 -0.2270535  0.3921841
```

```r
#filter() to select cases based on their values.
filter(df, x >0 & y>0)
```

```
##           x         y          z
## 1 0.1847042 0.3790845 -0.2592683
## 2 1.3359283 0.7596725 -0.6701605
```

```r
df %>% filter(x>0, y>0)
```

```
##           x         y          z
## 1 0.1847042 0.3790845 -0.2592683
## 2 1.3359283 0.7596725 -0.6701605
```

```r
#select() to select variables based on their names.
#select column x
select(df, x)
```

```
##             x
## 1 -0.06539989
## 2  0.18470422
## 3 -0.03302085
## 4  1.33592831
## 5  0.28714408
```

```r
#select column x and y
select(df, x, y)
```

```
##             x          y
## 1 -0.06539989  0.2256787
## 2  0.18470422  0.3790845
## 3 -0.03302085 -0.2270535
## 4  1.33592831  0.7596725
## 5  0.28714408 -1.1602793
```

```r
#select all columns from x to z
select(df, x:z)
```

```
##             x          y           z
## 1 -0.06539989  0.2256787 -0.19421678
## 2  0.18470422  0.3790845 -0.25926828
## 3 -0.03302085 -0.2270535  0.39218406
## 4  1.33592831  0.7596725 -0.67016045
## 5  0.28714408 -1.1602793 -0.09767826
```

```r
#drop colum x
select(df, -x)
```

```
##            y           z
## 1  0.2256787 -0.19421678
## 2  0.3790845 -0.25926828
## 3 -0.2270535  0.39218406
## 4  0.7596725 -0.67016045
## 5 -1.1602793 -0.09767826
```

```r
#drop columns x and y
select(df, -x, -y)
```

```
##             z
## 1 -0.19421678
## 2 -0.25926828
## 3  0.39218406
## 4 -0.67016045
## 5 -0.09767826
```

## Change dataframe shape


```r
#Without additional libraries
#to transpose a dataframe (rows become columns and inversely)
t(df)
```

```
##          [,1]       [,2]        [,3]       [,4]        [,5]
## x -0.06539989  0.1847042 -0.03302085  1.3359283  0.28714408
## y  0.22567875  0.3790845 -0.22705346  0.7596725 -1.16027931
## z -0.19421678 -0.2592683  0.39218406 -0.6701605 -0.09767826
```


```r
#Using tidyr library
#gather and spread
#gathering the column names and turning them into a pair of new variables. 
#One variable represents the column names as values, and the other variable 
#contains the values previously associated with the column names
tmp <- data.frame(col1 = 1:3, col2 = 1:3, col3 = 1:3)
df_gather <- gather(tmp, key = 'col', value = 'value', -col1)
df_gather
```

```
##   col1  col value
## 1    1 col2     1
## 2    2 col2     2
## 3    3 col2     3
## 4    1 col3     1
## 5    2 col3     2
## 6    3 col3     3
```

```r
#spread to get initial dataset
#spread is the inverse function of gather
spread(df_gather, key = col, value = value)
```

```
##   col1 col2 col3
## 1    1    1    1
## 2    2    2    2
## 3    3    3    3
```



## Transforming data

Transforming data is also very important. Indeed, when one creates a new column depending on the value of others, or if one would like to change the values of a specific column, then it transforms the dataframe.


```r
#No additional libraries required
#multiply by 100 the column x
transform(df, x =100*x)
```

```
##            x          y           z
## 1  -6.539989  0.2256787 -0.19421678
## 2  18.470422  0.3790845 -0.25926828
## 3  -3.302085 -0.2270535  0.39218406
## 4 133.592831  0.7596725 -0.67016045
## 5  28.714408 -1.1602793 -0.09767826
```

```r
#multiply x by 100 if z>0
transform(df, x = ifelse(z>0, x*100, x))
```

```
##             x          y           z
## 1 -0.06539989  0.2256787 -0.19421678
## 2  0.18470422  0.3790845 -0.25926828
## 3 -3.30208519 -0.2270535  0.39218406
## 4  1.33592831  0.7596725 -0.67016045
## 5  0.28714408 -1.1602793 -0.09767826
```

```r
#create a new column with a value of 1 or -1 depending on the sign of x
transform(df, new_col = ifelse(x>0, 1, -1))
```

```
##             x          y           z new_col
## 1 -0.06539989  0.2256787 -0.19421678      -1
## 2  0.18470422  0.3790845 -0.25926828       1
## 3 -0.03302085 -0.2270535  0.39218406      -1
## 4  1.33592831  0.7596725 -0.67016045       1
## 5  0.28714408 -1.1602793 -0.09767826       1
```

```r
#create new colum (there are several ways to do so)
df['w'] = 2*df['x'] #create a colum w whose values are twice the value of x
df[,'r'] = ifelse(df[['x']]>0, 1, -1) #create a column r whose values are 1 or -1 
#depending on the value of x 
#note that there are [[]] and not []) - df[,'r'] = ifelse(df['x']>0, 1, -1) doesn't work
df['t'] = ifelse(df[,'x']>0, 1, -1)
df$o = ifelse(df[,'x']>0, 1, -1)
df$i = ifelse(df$x>0, 1, -1)
df
```

```
##             x          y           z          w  r  t  o  i
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1
```

```r
#Note the following (there is a difference between [] and [[]])
df['x'] #is a dataframe
```

```
##             x
## 1 -0.06539989
## 2  0.18470422
## 3 -0.03302085
## 4  1.33592831
## 5  0.28714408
```

```r
df[,'x'] #is a vector
```

```
## [1] -0.06539989  0.18470422 -0.03302085  1.33592831  0.28714408
```

```r
df$x #is a vector
```

```
## [1] -0.06539989  0.18470422 -0.03302085  1.33592831  0.28714408
```

```r
df[['x']] #is a vector
```

```
## [1] -0.06539989  0.18470422 -0.03302085  1.33592831  0.28714408
```


```r
#Using dplyr and tidyr libraries

#mutate() and transmute() to add new variables that are functions of existing variables.
#dplyr::mutate() is similar to transform(), but allows you to refer to columns that you’ve just created
mutate(df,a = 2*x,b = 2*y)
```

```
##             x          y           z          w  r  t  o  i          a
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1 -0.1307998
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1  0.3694084
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1 -0.0660417
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1  2.6718566
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1  0.5742882
##            b
## 1  0.4513575
## 2  0.7581690
## 3 -0.4541069
## 4  1.5193451
## 5 -2.3205586
```

```r
mutate(df,a = 2*x,b = 2*a)
```

```
##             x          y           z          w  r  t  o  i          a
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1 -0.1307998
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1  0.3694084
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1 -0.0660417
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1  2.6718566
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1  0.5742882
##            b
## 1 -0.2615996
## 2  0.7388169
## 3 -0.1320834
## 4  5.3437132
## 5  1.1485763
```

```r
#transform(df, a = 2*X, b = 2*a) #doesn't work

#If you only want to keep the new variables, use transmute():
transmute(df,a = 2*x,b = 2*a)
```

```
##            a          b
## 1 -0.1307998 -0.2615996
## 2  0.3694084  0.7388169
## 3 -0.0660417 -0.1320834
## 4  2.6718566  5.3437132
## 5  0.5742882  1.1485763
```


## Dealing with duplicates and missing values

NA values or duplicate values can be very annoying in a dataframe. Hopefully, some functions exist to deal with them.


```r
#create NA values to show the different functions
df['NA'] = NA
df
```

```
##             x          y           z          w  r  t  o  i NA
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1 NA
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1 NA
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1 NA
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1 NA
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1 NA
```

```r
df[is.na(df)] = 0 #set NA values to 0
df
```

```
##             x          y           z          w  r  t  o  i NA
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1  0
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1  0
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1  0
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1  0
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1  0
```

```r
df[df==0] = NA #set 0 values to NA
df
```

```
##             x          y           z          w  r  t  o  i NA
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1 NA
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1 NA
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1 NA
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1 NA
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1 NA
```

```r
na.omit(df) #delete rows with NA values
```

```
## [1] x  y  z  w  r  t  o  i  NA
## <0 rows> (or 0-length row.names)
```

```r
df[!is.na(df$x),] #delete rows with missing values in column x
```

```
##             x          y           z          w  r  t  o  i NA
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1 NA
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1 NA
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1 NA
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1 NA
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1 NA
```

```r
unique(df) #remove duplicates rows
```

```
##             x          y           z          w  r  t  o  i NA
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1 NA
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1 NA
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1 NA
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1 NA
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1 NA
```

```r
df[duplicated(df),] #return duplicate rows
```

```
## [1] x  y  z  w  r  t  o  i  NA
## <0 rows> (or 0-length row.names)
```

```r
df[!duplicated(df[,c('x')]),] #remove all rows with duplicates X values (first is kept)
```

```
##             x          y           z          w  r  t  o  i NA
## 1 -0.06539989  0.2256787 -0.19421678 -0.1307998 -1 -1 -1 -1 NA
## 2  0.18470422  0.3790845 -0.25926828  0.3694084  1  1  1  1 NA
## 3 -0.03302085 -0.2270535  0.39218406 -0.0660417 -1 -1 -1 -1 NA
## 4  1.33592831  0.7596725 -0.67016045  2.6718566  1  1  1  1 NA
## 5  0.28714408 -1.1602793 -0.09767826  0.5742882  1  1  1  1 NA
```

```r
df[duplicated(df[,c('x')]),] #returns rows with duplicate X
```

```
## [1] x  y  z  w  r  t  o  i  NA
## <0 rows> (or 0-length row.names)
```

## group_by function

The group_by function is used to create groups of observations in order to apply functions to each group separately. It is equivalent to the GROUP BY function is SQL. You need the dplyr package for this section.


```r
library(nycflights13)

#summarise() to condense multiple values to a single value
#It collapses a data frame to a single row
#very useful with group by
#examples of functions: min(), max(), mean(), sum(), sd(), median()
#n(): the number of observations in the current group or n_distinct(x):the number of unique values in x
summarise(df,name_col = mean(x, na.rm = TRUE))
```

```
##    name_col
## 1 0.3418712
```

```r
#group_by() + summarize()
flights %>%
   group_by(tailnum) %>%
   summarise(count = n(), dist = mean(distance, na.rm = TRUE), delay = mean(arr_delay, na.rm = TRUE)) %>%
   filter(delay, count > 500, dist < 800)
```

```
## # A tibble: 3 x 4
##   tailnum count  dist delay
##   <chr>   <int> <dbl> <dbl>
## 1 N722MQ    513  546.  4.91
## 2 N723MQ    507  538.  6.42
## 3 N725MQ    575  559.  4.67
```

