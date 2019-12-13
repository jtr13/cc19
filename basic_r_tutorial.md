
# (PART) Working with data {-}

Most of the chpaters in this section are based, but there are a few Python ones as well!

# Basic R

Xin Guo, Aiden Zhang


R is a tool for data processing, it is important for us to understand the basic operations. In this cheatsheat/tutorial we will cover some basic operations of data. We will start with the building blocks of data types then go to the data structures. We try to cover the create, update(delete included), select operations for each data object following the logic of basic database operations.  

## Data types

For different data types, the attributes of an object is of most interest, we would use the following functions to explore objects.

We will classify them into two types, one is the read-only functions, and the others are writable functions. If we want to change the attributes of an object, we might use some functions to implement, and we will also cover these operations.

### (1) character 


```r
temp_char = "hellow world"
```
Let us explore the attributes of the character. The following are some of the general "read-only" functions.

```r
summary(temp_char)
```

```
##    Length     Class      Mode 
##         1 character character
```
str function returns some information, but it is less detailed than the summary.

```r
str(temp_char)
```

```
##  chr "hellow world"
```
**summary** and **str** are efficient functions to know about an object, but it is worth noticed that function **attributes** does not give us information about the variable.

```r
attributes(temp_char)
```

```
## NULL
```
Then let us explore more about the "read-only" functions and get to know the functions that can change their return values. 

**length** function will return the length of the object. 


```r
length(temp_char)
```

```
## [1] 1
```

We can change the length of the object by appending another character to it. If we want append a number to it, the number will be converted into a character to be consistent.

```r
long_temp = append(temp_char,"hahaha")
longer_test = append(temp_char,1)
length(longer_test)
```

```
## [1] 2
```

**unique** function returns the unique element in the object.

```r
unique(temp_char)
```

```
## [1] "hellow world"
```

For each unique element in the object, **table** function returns their frequencies. **range** function returns the minimum and maximum value.

```r
table(temp_char)
```

```
## temp_char
## hellow world 
##            1
```

```r
range(temp_char)
```

```
## [1] "hellow world" "hellow world"
```

We can change the value of the character by using the **substr** function. 
If we want to add more value to the end, we can use the **paste** function.It will return a longer size character object.
If we add a number using **paste**, like the **append** function, it will convert the number into character. This is useful when we have a different data to print out and the **print** function cannot support multiple items.

```r
substr(temp_char,6,7) = "? "
a = 2019
paste(temp_char,"!",a,sep ="")
```

```
## [1] "hello? world!2019"
```

We can use the class function to find out the data type of this object.

```r
class(temp_char)
```

```
## [1] "character"
```
If we want to change the class of this object, we would normally use the **as** function. We might try to turn a number into character sometimes.

```r
# To turn a number into character
temp_num = 1
class(temp_num)
```

```
## [1] "numeric"
```

```r
temp_num_new =  as.character(temp_num)
class(temp_num_new)
```

```
## [1] "character"
```
We should pay attention to that the **as** function does not modify the parameter passed into it. So we will have a new object.

Now, let us look at some writable attributes of the object.
Levels is the order for the items in the object, that is why a character object will not have order. We can set the levels though it does not have any meaning for this certain character. It will not change the data type of the object.

```r
levels(temp_char)
```

```
## NULL
```

```r
levels(temp_char) = 1
levels(temp_char)
```

```
## [1] 1
```

```r
class(temp_char)
```

```
## [1] "character"
```
**names** function will return the name of an object if it has, and we can assign value to it to name the object.
The dimension and the length of the names we want to assign must match the dimension and length of the object, otherwise it will return error.

```r
names(temp_char)
```

```
## NULL
```

```r
names(temp_char) = c('1')
```
Other attributes related to names are **rownames**, **colnames** and **dimnames**, since this object does not have dimension, so it will return values NULL and it will not allow us to make any changes to them.

```r
rownames(temp_char) 
```

```
## NULL
```

```r
colnames(temp_char)
```

```
## NULL
```

```r
dimnames(temp_char) 
```

```
## NULL
```




### (2)numeric

There are two types of numerical data in R, numeric and integer. 
We will use the numeric class as interpretation since integer can be regarded as a specific kind of numeric.

```r
temp_numer = 3.14
```
Let us explore the attributes of the numeric object. The following are some of the general "read-only" functions.
Based on different object passed into the function, the summary will give us different details about the object.

```r
summary(temp_numer)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##    3.14    3.14    3.14    3.14    3.14    3.14
```
**str** function returns the class and value information.

```r
str(temp_numer)
```

```
##  num 3.14
```
**attributes** function still does not give us information about the object.

```r
attributes(temp_numer)
```

```
## NULL
```
Then let us explore more about the "read-only" functions and get to know the functions that will change their return values. 

**length** function will return the length of the object. 


```r
length(temp_numer)
```

```
## [1] 1
```

We can change the length of the object by appending another numeric number to it. 

```r
long_temp = append(temp_numer,2.72)
class(long_temp)
```

```
## [1] "numeric"
```

```r
length(long_temp)
```

```
## [1] 2
```

**unique** function returns the unique element in the object.

```r
unique(temp_numer)
```

```
## [1] 3.14
```

For each unique element in the object, **table** function returns their frequencies. **range** function returns the lowest and largest values in the input vector

```r
table(temp_numer)
```

```
## temp_numer
## 3.14 
##    1
```

```r
range(temp_numer)
```

```
## [1] 3.14 3.14
```

To change the value of a numeric object, we usually reassign the value of it.

```r
temp_numer = 2.72
```

**class** function can find out the data type of this object.

```r
class(temp_numer)
```

```
## [1] "numeric"
```
If we want to change the class of this object, we would normally use the **as** function. We might try to turn character into a numeric data. 
The function only works if it makes sense. We cannot turn a character of "hello world" into a number, the function will return error.

```r
# To turn a number into character
temp_ch = "3.14"
temp_num_new =  as.numeric(temp_ch)
temp_num_new 
```

```
## [1] 3.14
```

```r
class(temp_num_new)
```

```
## [1] "numeric"
```
We should pay attention to that the **as** function does not modify the parameter passed into it. So we will have a new object.

And if we try to turn a character into a integer, we can see that if it is a real number in meaning, it will be converted into a integer at the output.

```r
as.integer("2.7")
```

```
## [1] 2
```

It will have problem when the character is not in a good format, for example with a comma.
We need to fix the comma problem before we transform the class type. Here, **gsub** and **sub** does not have a functional difference, because the matching pattern is not a regular expression. **gsub** is more powerful and strict in matching pattern when regular expression is used.


```r
as.integer("1,234")
```

```
## [1] NA
```

```r
as.numeric("1,234")
```

```
## [1] NA
```

```r
as.numeric(gsub(",","","1,234"))
```

```
## [1] 1234
```

```r
as.numeric(sub(",","","1,234"))
```

```
## [1] 1234
```

Now, let us look at some writable attributes of the object.
Levels can be modified but still does not effect the class type of the numeric object.

```r
levels(temp_numer)
```

```
## NULL
```

```r
levels(temp_numer) = 1
levels(temp_numer)
```

```
## [1] 1
```

```r
class(temp_numer)
```

```
## [1] "numeric"
```
**names** function will return the name of an object if it has, and we can assign value to it to name the object.

```r
names(temp_numer)
```

```
## NULL
```

```r
names(temp_numer) = c('1')
```
Other attributes related to names are **rownames**, **colnames** and **dimnames**, since this object does not have dimension, so it will return values NULL and it will not allow us to make any changes to them.

```r
rownames(temp_numer) 
```

```
## NULL
```

```r
colnames(temp_numer)
```

```
## NULL
```

```r
dimnames(temp_numer) 
```

```
## NULL
```

### (3)Logical

logical data is the data that contains `TRUE` and `FALSE`, or you can abbreviate them as `T` and `F` in R. We can easily convert between logicals and numericals with 1 and 0.


```r
temp_logical = c(TRUE, FALSE, T, T, F)
as.numeric(temp_logical)
```

```
## [1] 1 0 1 1 0
```

```r
as.logical(temp_logical)
```

```
## [1]  TRUE FALSE  TRUE  TRUE FALSE
```

Let us explore the attributes of the logicals. The following are some of the general “read-only” functions. Based on different object passed into the function, the summary will give us different details about the object.


```r
summary(temp_logical)
```

```
##    Mode   FALSE    TRUE 
## logical       2       3
```
**str** function returns the some information, it is less detailed than the summary.

```r
str(temp_logical)
```

```
##  logi [1:5] TRUE FALSE TRUE TRUE FALSE
```
For each unique element in the object, table function returns their frequencies. range function returns the lowest and largest values in the input vector.

```r
range(temp_logical)
```

```
## [1] 0 1
```

```r
table(temp_logical)
```

```
## temp_logical
## FALSE  TRUE 
##     2     3
```
There are many useful functions related to logicals. We will illustrate a few here:

**ifelse**(\<logical\>, value1, value2)  returns value1 if logical is true, return value2 if logical is false. It is especially useful when we need to inspect or modify data based on its value. Note that this function takes a vector.


```r
temp <- c(1,NA,1,NA,2,2,3,4)
is.na(temp)
```

```
## [1] FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
```

```r
temp <- ifelse(is.na(temp), 0, temp)
temp
```

```
## [1] 1 0 1 0 2 2 3 4
```
Now we have all NA values changed to 0.

**all**(\<logical vector\>)  returns if all the logical values are true.

```r
temp <- c(1,NA,1,NA,2,2,3,4)
all(is.na(temp))
```

```
## [1] FALSE
```
Not all values of `temp` are NAs.

**any**(\<logical vector\>)  returns if any of the logical values are true

```r
temp <- c(1,NA,1,NA,2,2,3,4)
any(is.na(temp))
```

```
## [1] TRUE
```
There exists an NA value in `temp`.

**which**(\<logical vector\>) return the index which the logical value is true

```r
temp <- c(1,NA,1,NA,2,2,3,4)
which(is.na(temp))
```

```
## [1] 2 4
```
The element at indexes 2 and 4 of `temp` are NAs.


The basic classes of R includes numeric, logical, character, integer, complex, since numeric, character, logical are the most common ones, so we illustrated these 3 classes. Complex is a broader range than the real number, in reality, the data we collect will rarely relate to it.


Now we will head to different data structures.

## data structure

### (1) vector:

A vector can only contain objects from the same class.
We can use these two ways to create a vector. It will lead different operations when we want to update this vector object. There is no better between these two methods, they should be used according to our coding needs.

```r
temp_vector = c(1,2,3)
temp_vector2 = c("a","b","c")
num_vec = vector("numeric", length = 10)
char_vec = vector("character",length = 10)
```
Let us explore the attributes of the vector. The following are some of the general "read-only" functions.

```r
summary(temp_vector)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     1.0     1.5     2.0     2.0     2.5     3.0
```

```r
str(temp_vector)
```

```
##  num [1:3] 1 2 3
```


```r
attributes(temp_vector)
```

```
## NULL
```

Then let us explore more about the "read-only" functions and get to know the functions that will change their return values. 

**length** function will return the length of the object. 


```r
length(temp_vector)
```

```
## [1] 3
```

We can change the length of the object by appending another character to it. If we want append a number to a character vector, the number will be converted into a character to be consistent.

```r
long_temp = append(temp_vector,2.72)
class(long_temp)
```

```
## [1] "numeric"
```

```r
length(long_temp)
```

```
## [1] 4
```


**unique** function returns the unique element in the object.

```r
unique(temp_vector)
```

```
## [1] 1 2 3
```

For each unique element in the object, **table** function returns their frequencies. **range** function returns the maximum and minimum values.

```r
table(temp_vector)
```

```
## temp_vector
## 1 2 3 
## 1 1 1
```

```r
range(temp_vector)
```

```
## [1] 1 3
```

```r
range(temp_vector2)
```

```
## [1] "a" "c"
```

To update the value of a vector object, we use the index to access and change that value.

```r
temp_vector[1] = 1.1
temp_vector
```

```
## [1] 1.1 2.0 3.0
```
**match** function can be used to find the corresponding item based on value and update its values.
**which** function can be used to find all the matches.

This is like the relationship between **regexpr** and **gregexpr**, where
**regexpr** only gives you the first match of the string (reading left to right) and **gregexpr** will return all of the matches in a given string if there are is more than one match.

For character vector, we might also use gregexpr if we look for certain items with some patterns.

```r
temp_vector[match(c(1.1,2,3),temp_vector)] 
```

```
## [1] 1.1 2.0 3.0
```

```r
temp_vector[which(temp_vector %in% c(1.1,2,3))]
```

```
## [1] 1.1 2.0 3.0
```

```r
temp_vector2[match(c("a","b"),temp_vector2)]  
```

```
## [1] "a" "b"
```

```r
temp_vector2[which(temp_vector2 %in% c("a","b"))]  
```

```
## [1] "a" "b"
```

If we want to change the values of some items within specific range of values, we can use the logical expression to subset them.

```r
temp_vector[temp_vector <= 2]
```

```
## [1] 1.1 2.0
```

```r
sapply(temp_vector[temp_vector <= 2],FUN = function(x){x=1})
```

```
## [1] 1 1
```

```r
sapply(temp_vector[temp_vector <= 2],FUN = function(x){x+1})
```

```
## [1] 2.1 3.0
```

**class** function can find out the data type of this object.

We can see that the class type for vector is not vector but the data type of the item inside the vector.

```r
class(temp_vector)
```

```
## [1] "numeric"
```

```r
class(num_vec)
```

```
## [1] "numeric"
```

```r
class(char_vec)
```

```
## [1] "character"
```
If we want to change the class of this object, we would normally use the **as** function. We might try to use the **sapply** functions. We might try to turn character into a numeric data. 
The function only works if it makes sense.

The **sapply** function behaves similarly to **lapply**; the only real difference is in the return value. **sapply** will try to simplify the result of **lapply**.

```r
vec_char = c("3.14","2.72")
sapply(vec_char, as.numeric)
```

```
## 3.14 2.72 
## 3.14 2.72
```

```r
lapply(vec_char,as.numeric)
```

```
## [[1]]
## [1] 3.14
## 
## [[2]]
## [1] 2.72
```
We should pay attention to that the **as** function does not modify the parameter passed into it. So we will have a new object.

Now, let us look at some writable attributes of the object.
Levels is NULL and can be modified but still does not effect the class type of the numeric object.

```r
levels(temp_vector)
```

```
## NULL
```

```r
levels(temp_vector) = 1
class(temp_vector)
```

```
## [1] "numeric"
```
**names** function will return the name of an object if it has, and we can assign value to it to name the object. Then we will be able to access the items with their names.

```r
names(temp_vector)
```

```
## NULL
```

```r
names(temp_vector) = c('alpha','beta','ceta')
temp_vector['alpha']
```

```
## alpha 
##   1.1
```
If we want to find some items with certain names, we can find them in the following ways.

```r
temp_vector[names(temp_vector) %in% c("hello","world","alpha") ]
```

```
## alpha 
##   1.1
```

Other attributes related to names are **rownames**, **colnames** and **dimnames**, since this object does not have dimension, so it will return values NULL and it will not allow us to make any changes to them.

```r
rownames(temp_numer) 
```

```
## NULL
```

```r
colnames(temp_numer)
```

```
## NULL
```

```r
dimnames(temp_numer) 
```

```
## NULL
```


### (2)list:

A list can contain objects from the different classes.
We can use two ways to create a list. 


```r
temp_list = list("a" = c(1,2), 2.72,"pi" = 3.14, "c" = "hello world")
list_vec = vector("list", length = 5)
```
Let us explore the attributes of the list. The following are some of the general "read-only" functions.

```r
summary(temp_list)
```

```
##    Length Class  Mode     
## a  2      -none- numeric  
##    1      -none- numeric  
## pi 1      -none- numeric  
## c  1      -none- character
```

```r
str(temp_list)
```

```
## List of 4
##  $ a : num [1:2] 1 2
##  $   : num 2.72
##  $ pi: num 3.14
##  $ c : chr "hello world"
```

```r
str(list_vec)
```

```
## List of 5
##  $ : NULL
##  $ : NULL
##  $ : NULL
##  $ : NULL
##  $ : NULL
```


```r
attributes(temp_list)
```

```
## $names
## [1] "a"  ""   "pi" "c"
```

Then let us explore more about the "read-only" functions and get to know the functions that will change their return values. 

**length** function will return the length of the object. 


```r
length(temp_list)
```

```
## [1] 4
```

We can change the length of the object by **append** function.

```r
long_temp = append(temp_list,0)
class(long_temp)
```

```
## [1] "list"
```

```r
length(long_temp)
```

```
## [1] 5
```


**unique** function returns the unique element in the object.

```r
unique(temp_list)
```

```
## [[1]]
## [1] 1 2
## 
## [[2]]
## [1] 2.72
## 
## [[3]]
## [1] 3.14
## 
## [[4]]
## [1] "hello world"
```

For each unique element in the object,we cannot use the **table** function directly but to apply it to each item of the the object. **range** function returns the maximum and minimum values.

```r
sapply(temp_list,table) 
```

```
## $a
## 
## 1 2 
## 1 1 
## 
## [[2]]
## 
## 2.72 
##    1 
## 
## $pi
## 
## 3.14 
##    1 
## 
## $c
## 
## hello world 
##           1
```

```r
range(temp_list)
```

```
## [1] "1"           "hello world"
```

To update the value of a vector object, we use the index/name to access and change that value.

The following three ways can be used to acces and modify an object in the list.

```r
temp_list[["a"]]
```

```
## [1] 1 2
```

```r
temp_list$a = c(1,3)
temp_list[[1]]
```

```
## [1] 1 3
```

The following indexings are used to access the first item, it is worth noticed that it returns the whole item including its value.

```r
temp_list["a"]
```

```
## $a
## [1] 1 3
```

```r
temp_list[1]
```

```
## $a
## [1] 1 3
```

```r
temp_list[1][1]
```

```
## $a
## [1] 1 3
```
If we want to find the nested element in an item of a list, we will use the following ways to select.

```r
temp_list[[c(1,1)]]
```

```
## [1] 1
```

```r
temp_list[[1]][[2]] = 2 
temp_list[[1]][2]
```

```
## [1] 2
```

**class** function can find out the data type of this object.


```r
class(temp_list)
```

```
## [1] "list"
```

Now, let us look at some writable attributes of the object.
Levels is NULL and can be modified but still does not effect the class type of the numeric object.

```r
levels(temp_list)
```

```
## NULL
```

```r
levels(temp_list) = 1
class(temp_list)
```

```
## [1] "list"
```
**names** function will return the name of an object if it has, and we can assign value to it to name the object. Recall previously that we cannot name the item when appending it, but we can name it later. 

```r
names(temp_list)
```

```
## [1] "a"  ""   "pi" "c"
```

```r
names(temp_list)[2] = "e"
```
If we want to find some items with certain names, we can find them in the following ways.

```r
temp_list[names(temp_list) %in% c("hello","world","e","c") ]
```

```
## $e
## [1] 2.72
## 
## $c
## [1] "hello world"
```
Other attributes related to names are **rownames**, **colnames** and **dimnames**, since this object does not have dimension, so it will return values NULL and it will not allow us to make any changes to them.

```r
rownames(temp_list) 
```

```
## NULL
```

```r
colnames(temp_list)
```

```
## NULL
```

```r
dimnames(temp_list) 
```

```
## NULL
```

### (3)factor

Often factors will be automatically created when we read a dataset in using a function like read.table(). 

**factor** function will create a factor array.

```r
temp_factor = factor(c("yes", "yes", "no", "yes", "no"))
```
Let us explore the attributes of the factor. The following are some of the general "read-only" functions.

```r
summary(temp_factor)
```

```
##  no yes 
##   2   3
```

```r
str(temp_factor)
```

```
##  Factor w/ 2 levels "no","yes": 2 2 1 2 1
```
**attributes** function tells us the levels of the factor, it is set by default. And we can know from the **str** function that "no" corresponds to the level 1 and "yes" to 2. 

```r
attributes(temp_factor)
```

```
## $levels
## [1] "no"  "yes"
## 
## $class
## [1] "factor"
```

Then let us explore more about the "read-only" functions and get to know the functions that will change their return values. 

**length** function will return the length of the object. 


```r
length(temp_factor)
```

```
## [1] 5
```

It is not common to add new item into a factor, we can try using the append function to do it. And we have found that during the append operation, the function takes the levels attribute to do the work. So if we append a character to it, the resulting object is a character vector and so does the numeric object. So this is not a proper operation and it would be better if we create a vector than turn it into a factor with **as.factor** or **factor** function.

```r
temp_factor
```

```
## [1] yes yes no  yes no 
## Levels: no yes
```

```r
class(temp_factor)
```

```
## [1] "factor"
```

```r
long_temp_char = append(temp_factor,"no")
long_temp_num = append(temp_factor,2019)
long_temp_char
```

```
## [1] "2"  "2"  "1"  "2"  "1"  "no"
```

```r
long_temp
```

```
## $a
## [1] 1 2
## 
## [[2]]
## [1] 2.72
## 
## $pi
## [1] 3.14
## 
## $c
## [1] "hello world"
## 
## [[5]]
## [1] 0
```

**unique** function returns the unique element in the object.

```r
unique(temp_factor)
```

```
## [1] yes no 
## Levels: no yes
```

For each unique element in the object, **table** function returns their frequencies. **range** function does not have meanings under the level order, so it will return error.

```r
table(temp_factor)
```

```
## temp_factor
##  no yes 
##   2   3
```

```r
#range(temp_factor)
```

To update the value of a vector object, we use the index to access and change that value. We can only modify the value within the current levels, out of scope modification will return error, which means we cannot assign value like "neutral" to the item inside the factor.

```r
temp_factor[1] = "no"
temp_factor
```

```
## [1] no  yes no  yes no 
## Levels: no yes
```
**match** function can be used to find the corresponding item based on value and update its values.
**which** function can be used to find all the matches.
Then we can use the **sapply** function to modify the value of the elements.

```r
temp_factor
```

```
## [1] no  yes no  yes no 
## Levels: no yes
```

```r
temp_factor[match(c("yes","no"),temp_factor)]
```

```
## [1] yes no 
## Levels: no yes
```

```r
temp_factor[which(temp_factor %in% c("yes","no"))]
```

```
## [1] no  yes no  yes no 
## Levels: no yes
```


**class** function can find out the data type of this object.

```r
class(temp_factor)
```

```
## [1] "factor"
```

Now, let us look at some writable attributes of the object.
levels function returns the default level, we would try to reset the order with the **factor** function. We should notice that though we can modify the levels directly, but this will not return the desired result, so we should not use this way to modify it. 

```r
temp_factor = factor(c("yes", "yes", "no", "yes", "no"))
levels(temp_factor)
```

```
## [1] "no"  "yes"
```

```r
sort(temp_factor)
```

```
## [1] no  no  yes yes yes
## Levels: no yes
```

```r
# build a new factor
sort(factor(temp_factor,levels = c("yes","no")))
```

```
## [1] yes yes yes no  no 
## Levels: yes no
```

```r
# directly change the level
levels(temp_factor) = c("yes","no")
sort(temp_factor)
```

```
## [1] yes yes no  no  no 
## Levels: yes no
```

```r
# build a new factor
sort(factor(c("yes", "yes", "no", "yes", "no"), levels = c("yes", "no")) )
```

```
## [1] yes yes yes no  no 
## Levels: yes no
```
**names** function will return the name of an object if it has, and we can assign value to it to name the object. Then we will be able to access the items with their names.

```r
temp_factor = factor(c("yes", "yes", "no", "yes", "no"))
names(temp_factor)
```

```
## NULL
```

```r
names(temp_factor) = c('alpha','beta','ceta','gamma','omega')
temp_factor['alpha']
```

```
## alpha 
##   yes 
## Levels: no yes
```
If we want to find some items with certain names, we can find them in the following ways.

```r
temp_factor[names(temp_factor) %in% c("hello","world","alpha") ]
```

```
## alpha 
##   yes 
## Levels: no yes
```

Other attributes related to names are **rownames**, **colnames** and **dimnames**, since this object does not have dimension, so it will return values NULL and it will not allow us to make any changes to them.

```r
rownames(temp_factor) 
```

```
## NULL
```

```r
colnames(temp_factor)
```

```
## NULL
```

```r
dimnames(temp_factor) 
```

```
## NULL
```


### (4)matrix

matrix is a data structure with dimensions.
**matrix** function will create a matrix.

```r
temp_matrix <- matrix(0, nrow = 2, ncol = 5)
```

Let us explore the attributes of the factor. The following are some of the general "read-only" functions.

```r
summary(temp_matrix)
```

```
##        V1          V2          V3          V4          V5   
##  Min.   :0   Min.   :0   Min.   :0   Min.   :0   Min.   :0  
##  1st Qu.:0   1st Qu.:0   1st Qu.:0   1st Qu.:0   1st Qu.:0  
##  Median :0   Median :0   Median :0   Median :0   Median :0  
##  Mean   :0   Mean   :0   Mean   :0   Mean   :0   Mean   :0  
##  3rd Qu.:0   3rd Qu.:0   3rd Qu.:0   3rd Qu.:0   3rd Qu.:0  
##  Max.   :0   Max.   :0   Max.   :0   Max.   :0   Max.   :0
```

```r
str(temp_matrix)
```

```
##  num [1:2, 1:5] 0 0 0 0 0 0 0 0 0 0
```

```r
attributes(temp_matrix)
```

```
## $dim
## [1] 2 5
```

Then let us explore more about the "read-only" functions and get to know the functions that will change their return values. 

**length** function will return the length of the object, the length is calculated by multiplying dimensions. 


```r
length(temp_matrix)
```

```
## [1] 10
```

```r
nrow(temp_matrix)
```

```
## [1] 2
```

```r
ncol(temp_matrix)
```

```
## [1] 5
```

```r
length(temp_matrix)
```

```
## [1] 10
```

If we want to add another matrix into the current matrix, we will use the **rbind** and **cbind** functions.
**rbind** means binding along the row, so it will require the column sizes of two matrices are the same.
**cbind** means binding along the column, so it will require the row sizes of two matrices are the same.

**append** function does not work, because it would turn the matrix into a 1 dimensions data structure which is not we want.


```r
long_temp = append(temp_matrix,cbind(1,2,3,4,5))
attributes(long_temp)
```

```
## NULL
```

```r
temp_matrix
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    0    0    0    0    0
## [2,]    0    0    0    0    0
```

```r
long_temp_row = rbind(temp_matrix,cbind(1,2,3,4,5))
long_temp_col = cbind(temp_matrix,rbind(1,2))
```

**unique** function returns the unique element in the object.

```r
temp_matrix[2,2] = 3
unique(temp_matrix)
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    0    0    0    0    0
## [2,]    0    3    0    0    0
```

For each unique element in the object, **table** function returns their frequencies. **range** will return the minimum and maximum object. The operations are done across the matrix, not confined to certain row or column.

```r
table(temp_matrix)
```

```
## temp_matrix
## 0 3 
## 9 1
```

```r
range(temp_matrix)
```

```
## [1] 0 3
```

To update the value of a matrix object, we use the index to access and change that value. We cannot update with a different data type. 

```r
# this is not valid:
# temp_matrix[1][2]
temp_matrix
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    0    0    0    0    0
## [2,]    0    3    0    0    0
```

```r
temp_matrix[1,2] = 1
#for a row
temp_matrix[2,]
```

```
## [1] 0 3 0 0 0
```

```r
#for a column
temp_matrix[,2]
```

```
## [1] 1 3
```
Random access item like this will return value by spreading the matrix. 

```r
temp_matrix[4]
```

```
## [1] 3
```
The **in** function can help us to determine if an value falls into our criteria, we directly use the TRUE and False result to subset the matrix we want. When using the **which** function, we need to be careful that we are selecting rows so that the subset format should be correct.

Then we can use the **sapply** function to modify the value of the elements.

```r
temp_matrix
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    0    1    0    0    0
## [2,]    0    3    0    0    0
```

```r
temp_matrix[,2] %in% c(2,3,4) 
```

```
## [1] FALSE  TRUE
```

```r
temp_matrix[temp_matrix[,2] %in% c(2,3,4)] 
```

```
## [1] 0 3 0 0 0
```

```r
which(temp_matrix[,2] %in% c(2,3,4) )
```

```
## [1] 2
```

```r
temp_matrix[which(temp_matrix[,2] %in% c(2,3,4)),] 
```

```
## [1] 0 3 0 0 0
```


**class** function can find out the data type of this object.

```r
class(temp_matrix)
```

```
## [1] "matrix"
```

Now, let us look at some writable attributes of the object.
levels function returns NULL because this is not a factor matrix. We create a factor matrix but it will lose the attributes as a factor when we apply matrix operations to it. So levels does not have significant meaning in matrix.

```r
levels(temp_matrix)
```

```
## NULL
```
**names** function will return the name of an object if it has, and we can assign value to it to name the object. Then we will be able to access the items with their names.

```r
names(temp_matrix) = c('1','2','3','4','5','6','7','8')
temp_matrix
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    0    1    0    0    0
## [2,]    0    3    0    0    0
## attr(,"names")
##  [1] "1" "2" "3" "4" "5" "6" "7" "8" NA  NA
```

```r
temp_matrix['3']
```

```
## 3 
## 1
```
If we want to find some items with certain names, we can find them in the following ways.

```r
temp_matrix[names(temp_matrix) %in% c('4','5','6') ]
```

```
## 4 5 6 
## 3 0 0
```
But selecting a single item is not usually what we want, we might want to select a whole column/row based on its name.

Other attributes related to names are **rownames**, **colnames** and **dimnames**, the dimensions of the assignment value must match the matrix size.

```r
rownames(temp_matrix) = c("1",'2')
colnames(temp_matrix) = c('a','b','c','d','e')
temp_matrix
```

```
##   a b c d e
## 1 0 1 0 0 0
## 2 0 3 0 0 0
## attr(,"names")
##  [1] "1" "2" "3" "4" "5" "6" "7" "8" NA  NA
```

```r
dimnames(temp_matrix) = list(c("1",'2'),c('a','b','c','d','e'))
```
To access or update value with their names we use the following format.

```r
temp_matrix['1',]
```

```
## a b c d e 
## 0 1 0 0 0
```

```r
temp_matrix[,'a']
```

```
## 1 2 
## 0 0
```


### (5) dataframe

Data frames are usually created by reading in a dataset using the read.table() or read.csv(). Each column can be viewed as a vector. And can be viewed as list with vectors of same length.
We load a dataframe from the basic R **data** function

```r
data("women")
```

Let us explore the attributes of the factor. The following are some of the general "read-only" functions.

```r
summary(women)
```

```
##      height         weight     
##  Min.   :58.0   Min.   :115.0  
##  1st Qu.:61.5   1st Qu.:124.5  
##  Median :65.0   Median :135.0  
##  Mean   :65.0   Mean   :136.7  
##  3rd Qu.:68.5   3rd Qu.:148.0  
##  Max.   :72.0   Max.   :164.0
```

```r
str(women)
```

```
## 'data.frame':	15 obs. of  2 variables:
##  $ height: num  58 59 60 61 62 63 64 65 66 67 ...
##  $ weight: num  115 117 120 123 126 129 132 135 139 142 ...
```

```r
attributes(women)
```

```
## $names
## [1] "height" "weight"
## 
## $class
## [1] "data.frame"
## 
## $row.names
##  [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
```

Then let us explore more about the "read-only" functions and get to know the functions that will change their return values. 

**length** function will return the length of the object, the length is calculated by multiplying dimensions. 


```r
length(women)
```

```
## [1] 2
```

```r
nrow(women)
```

```
## [1] 15
```

```r
ncol(women)
```

```
## [1] 2
```

```r
dim(women)
```

```
## [1] 15  2
```

If we want to add another dataframe into the current matrix, we will use the **rbind** method because this is a new observation. If we want to add a new variable then we will use **cbind**.


```r
long_temp_row = rbind(women,data.frame(height=c(110), weight=c(77)))
dim(long_temp_row)
```

```
## [1] 16  2
```

**unique** function returns the unique element in the object.

```r
unique(women)
```

```
##    height weight
## 1      58    115
## 2      59    117
## 3      60    120
## 4      61    123
## 5      62    126
## 6      63    129
## 7      64    132
## 8      65    135
## 9      66    139
## 10     67    142
## 11     68    146
## 12     69    150
## 13     70    154
## 14     71    159
## 15     72    164
```

For each unique element in the object, **table** function returns their frequencies. **range** will return the minimum and maximum object. The operations are done across the matrix, not confined to certain row or column.

```r
table(women)
```

```
##       weight
## height 115 117 120 123 126 129 132 135 139 142 146 150 154 159 164
##     58   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0
##     59   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0
##     60   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0
##     61   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0
##     62   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0
##     63   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0
##     64   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0
##     65   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0
##     66   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0
##     67   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0
##     68   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0
##     69   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0
##     70   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0
##     71   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0
##     72   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1
```

```r
range(women)
```

```
## [1]  58 164
```

To update the value of a dataframe item, we use the index to access and change that value. We cannot update with a different data type. 

```r
women[3,2]
```

```
## [1] 120
```

```r
#for a row
women[2,]
```

```
##   height weight
## 2     59    117
```

```r
#for a column
women[,2]
```

```
##  [1] 115 117 120 123 126 129 132 135 139 142 146 150 154 159 164
```
Random access item like this will return the 1st column value of the dataframe which is different from the matrix operation. 

```r
women[1]
```

```
##    height
## 1      58
## 2      59
## 3      60
## 4      61
## 5      62
## 6      63
## 7      64
## 8      65
## 9      66
## 10     67
## 11     68
## 12     69
## 13     70
## 14     71
## 15     72
```
To change the values in a row or in a column, we can use **sapply** function or vectorized function to modify the data.
And if we want to apply changes to all the rows/columns, we will use the **apply** function. To create new variable based on the other variables, we will use the **mapply** function.


```r
women[,2] = as.factor(women[,2])
women
```

```
##    height weight
## 1      58    115
## 2      59    117
## 3      60    120
## 4      61    123
## 5      62    126
## 6      63    129
## 7      64    132
## 8      65    135
## 9      66    139
## 10     67    142
## 11     68    146
## 12     69    150
## 13     70    154
## 14     71    159
## 15     72    164
```

```r
data.frame(apply(women,2,as.numeric) ) # 1 for row statistics, 2 for column statistics
```

```
##    height weight
## 1      58    115
## 2      59    117
## 3      60    120
## 4      61    123
## 5      62    126
## 6      63    129
## 7      64    132
## 8      65    135
## 9      66    139
## 10     67    142
## 11     68    146
## 12     69    150
## 13     70    154
## 14     71    159
## 15     72    164
```

```r
data("women")
mapply(function(h,w){w/(h*h)},women[,1],women[,2])
```

```
##  [1] 0.03418549 0.03361103 0.03333333 0.03305563 0.03277836 0.03250189
##  [7] 0.03222656 0.03195266 0.03191001 0.03163288 0.03157439 0.03150599
## [13] 0.03142857 0.03154136 0.03163580
```

To subset some dataframe, we use the **in** function and the **which** function. We need to be careful that we are selecting rows so that the subset format should be correct, unlike matrix, when **in** function can be easily converted to the result we want.

And we can also use the split function and then access the part we want with corresponding index.


```r
#split(women,women[,2]) 
women[women[,2] %in% c(117,120),] 
```

```
##   height weight
## 2     59    117
## 3     60    120
```

```r
women[which(women [,2] %in% c(117,120)),] 
```

```
##   height weight
## 2     59    117
## 3     60    120
```


**class** function can find out the data type of this object.

```r
class(women)
```

```
## [1] "data.frame"
```

Now, let us look at some writable attributes of the object.
levels function returns NULL even if the dataframe contains factor variables.

```r
levels(women)
```

```
## NULL
```
**names** function will return the name of an object if it has, and we can assign value to it to name the object. Then we will be able to access the items with their names. Unlike matrix, in dataframe the names is for the column names, so by names, we will access a column.

```r
names(women)
```

```
## [1] "height" "weight"
```

```r
names(women) = c('1')
women['1']
```

```
##     1
## 1  58
## 2  59
## 3  60
## 4  61
## 5  62
## 6  63
## 7  64
## 8  65
## 9  66
## 10 67
## 11 68
## 12 69
## 13 70
## 14 71
## 15 72
```

Other attributes related to names are **rownames**, **colnames** and **dimnames**, the dimensions of the assignment value must match the matrix size.

```r
rownames(women)
```

```
##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15"
```

```r
colnames(women) 
```

```
## [1] "1" NA
```

```r
dimnames(women) 
```

```
## [[1]]
##  [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14" "15"
## 
## [[2]]
## [1] "1" NA
```
To access or update value with their names we use the following format.

```r
women['1',]
```

```
##    1  NA
## 1 58 115
```

```r
women[,'1']
```

```
##  [1] 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72
```
