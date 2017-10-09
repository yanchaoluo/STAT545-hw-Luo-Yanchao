README
================

Main Functions
--------------

| tidyr Function | Special Powers                         |
|----------------|----------------------------------------|
| `gather`       | long format\*                          |
| `spread`       | wide format\*                          |
| `separate()`   | Splitting a single variable into two\* |
| `unite()`      | Merging two variables into one\*       |

``` r
library(tidyr)
```

### `gather` function

![](data:image/png;base64,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)

**Description** the gather() function will take multiple columns into key-value pairs, duplicating all other columns as needed.

Function: gather(data, key, value, ..., na.rm = FALSE, convert = FALSE)

Arguments: data: data frame key: column name representing new variable value: column name representing variable values ...: names of columns to gather (or not gather) na.rm: option to remove observations with missing values (represented by NAs) convert: if TRUE will automatically convert values to logical, integer, numeric, complex or factor as appropriate

#### Example

``` r
year<-c(2010:2017)

Qtr.1<-c(10:17)
Qtr.2<-c(20:27)
Qtr.3<-c(30:37)
data<-data.frame(year,Qtr.1,Qtr.2,Qtr.3)
knitr::kable(data)
```

|  year|  Qtr.1|  Qtr.2|  Qtr.3|
|-----:|------:|------:|------:|
|  2010|     10|     20|     30|
|  2011|     11|     21|     31|
|  2012|     12|     22|     32|
|  2013|     13|     23|     33|
|  2014|     14|     24|     34|
|  2015|     15|     25|     35|
|  2016|     16|     26|     36|
|  2017|     17|     27|     37|

``` r
new <-data %>%
  gather(Quarter, value, Qtr.1:Qtr.3)

knitr::kable(new)
```

|  year| Quarter |  value|
|-----:|:--------|------:|
|  2010| Qtr.1   |     10|
|  2011| Qtr.1   |     11|
|  2012| Qtr.1   |     12|
|  2013| Qtr.1   |     13|
|  2014| Qtr.1   |     14|
|  2015| Qtr.1   |     15|
|  2016| Qtr.1   |     16|
|  2017| Qtr.1   |     17|
|  2010| Qtr.2   |     20|
|  2011| Qtr.2   |     21|
|  2012| Qtr.2   |     22|
|  2013| Qtr.2   |     23|
|  2014| Qtr.2   |     24|
|  2015| Qtr.2   |     25|
|  2016| Qtr.2   |     26|
|  2017| Qtr.2   |     27|
|  2010| Qtr.3   |     30|
|  2011| Qtr.3   |     31|
|  2012| Qtr.3   |     32|
|  2013| Qtr.3   |     33|
|  2014| Qtr.3   |     34|
|  2015| Qtr.3   |     35|
|  2016| Qtr.3   |     36|
|  2017| Qtr.3   |     37|

### `seperate()`

**Description** Many times a single column variable will capture multiple variables, so `seperate` function will split a single variable into two.

Function: separate(data, col, into, sep = " ", remove = TRUE, convert = FALSE) Same as: data %&gt;% separate(col, into, sep = " ", remove = TRUE, convert = FALSE)

Arguments: data: data frame col: column name representing current variable into: names of variables representing new variables sep: how to separate current variable (char, num, or symbol) remove: if TRUE, remove input column from output data frame convert: if TRUE will automatically convert values to logical, integer, numeric, complex or factor as appropriate

#### Example

``` r
new2 <- new %>% separate(Quarter, c("Time_Interval", "Interval_ID"))

knitr::kable(new2)
```

|  year| Time\_Interval | Interval\_ID |  value|
|-----:|:---------------|:-------------|------:|
|  2010| Qtr            | 1            |     10|
|  2011| Qtr            | 1            |     11|
|  2012| Qtr            | 1            |     12|
|  2013| Qtr            | 1            |     13|
|  2014| Qtr            | 1            |     14|
|  2015| Qtr            | 1            |     15|
|  2016| Qtr            | 1            |     16|
|  2017| Qtr            | 1            |     17|
|  2010| Qtr            | 2            |     20|
|  2011| Qtr            | 2            |     21|
|  2012| Qtr            | 2            |     22|
|  2013| Qtr            | 2            |     23|
|  2014| Qtr            | 2            |     24|
|  2015| Qtr            | 2            |     25|
|  2016| Qtr            | 2            |     26|
|  2017| Qtr            | 2            |     27|
|  2010| Qtr            | 3            |     30|
|  2011| Qtr            | 3            |     31|
|  2012| Qtr            | 3            |     32|
|  2013| Qtr            | 3            |     33|
|  2014| Qtr            | 3            |     34|
|  2015| Qtr            | 3            |     35|
|  2016| Qtr            | 3            |     36|
|  2017| Qtr            | 3            |     37|

### `seperate()`

**Description** There may be a time in which we would like to combine the values of two variables, so `unite` function will merge two variables into one.

Function: unite(data, col, ..., sep = " ", remove = TRUE) Same as: data %&gt;% unite(col, ..., sep = " ", remove = TRUE)

Arguments: data: data frame col: column name of new "merged" column ...: names of columns to merge sep: separator to use between merged values remove: if TRUE, remove input column from output data frame

#### Example

``` r
new3 <- new2 %>% unite(Quarter, Time_Interval, Interval_ID, sep = ".")

knitr::kable(new3)
```

|  year| Quarter |  value|
|-----:|:--------|------:|
|  2010| Qtr.1   |     10|
|  2011| Qtr.1   |     11|
|  2012| Qtr.1   |     12|
|  2013| Qtr.1   |     13|
|  2014| Qtr.1   |     14|
|  2015| Qtr.1   |     15|
|  2016| Qtr.1   |     16|
|  2017| Qtr.1   |     17|
|  2010| Qtr.2   |     20|
|  2011| Qtr.2   |     21|
|  2012| Qtr.2   |     22|
|  2013| Qtr.2   |     23|
|  2014| Qtr.2   |     24|
|  2015| Qtr.2   |     25|
|  2016| Qtr.2   |     26|
|  2017| Qtr.2   |     27|
|  2010| Qtr.3   |     30|
|  2011| Qtr.3   |     31|
|  2012| Qtr.3   |     32|
|  2013| Qtr.3   |     33|
|  2014| Qtr.3   |     34|
|  2015| Qtr.3   |     35|
|  2016| Qtr.3   |     36|
|  2017| Qtr.3   |     37|

### `spread( )` function:

**Description** There are times when we are required to turn long formatted data into wide formatted data. The `spread()` function spreads a key-value pair across multiple columns.

Function: spread(data, key, value, fill = NA, convert = FALSE) Same as: data %&gt;% spread(key, value, fill = NA, convert = FALSE)

Arguments: data: data frame key: column values to convert to multiple columns value: single column values to convert to multiple columns' values fill: If there isn't a value for every combination of the other variables and the key column, this value will be substituted convert: if TRUE will automatically convert values to logical, integer, numeric, complex or factor as appropriate

#### Example

``` r
new4<- spread(new, Quarter,value )


knitr::kable(new4)
```

|  year|  Qtr.1|  Qtr.2|  Qtr.3|
|-----:|------:|------:|------:|
|  2010|     10|     20|     30|
|  2011|     11|     21|     31|
|  2012|     12|     22|     32|
|  2013|     13|     23|     33|
|  2014|     14|     24|     34|
|  2015|     15|     25|     35|
|  2016|     16|     26|     36|
|  2017|     17|     27|     37|

Related link
------------

-   [tidyr](https://rpubs.com/bradleyboehmke/data_wrangling)

-   [tidyr2](https://blog.rstudio.com/2014/07/22/introducing-tidyr/)

-   [tidyr3](https://www.rdocumentation.org/packages/tidyr/versions/0.7.1/topics/gather)
