homework04
================

Load the data
-------------

``` r
suppressPackageStartupMessages(library(tidyverse))  
suppressPackageStartupMessages(library(gapminder))
suppressPackageStartupMessages(library(kableExtra))
```

    ## Warning: package 'kableExtra' was built under R version 3.4.2

General data reshaping and relationship to aggregation
------------------------------------------------------

### Activity \#2

-   Make a tibble with one row per year and columns for life expectancy for two or more countries.
    -   Use knitr::kable() to make this table look pretty in your rendered homework.
    -   Take advantage of this new data shape to scatterplot life expectancy for one country against that of another.

``` r
p1<- gapminder %>% 
  filter(country %in% c("China", "Canada", "Japan")) %>% 
  select(country,lifeExp, year) %>% 
  spread(key =country, value =lifeExp)
knitr::kable(p1) %>% 
  kable_styling(bootstrap_options = c("striped", "hover")) %>% 
    row_spec(12, bold = T, color = "white", background = "#D7261E")
```

    ## Currently generic markdown table using pandoc is not supported.
    ## Currently generic markdown table using pandoc is not supported.

|  year|  Canada|     China|   Japan|
|-----:|-------:|---------:|-------:|
|  1952|  68.750|  44.00000|  63.030|
|  1957|  69.960|  50.54896|  65.500|
|  1962|  71.300|  44.50136|  68.730|
|  1967|  72.130|  58.38112|  71.430|
|  1972|  72.880|  63.11888|  73.420|
|  1977|  74.210|  63.96736|  75.380|
|  1982|  75.760|  65.52500|  77.110|
|  1987|  76.860|  67.27400|  78.670|
|  1992|  77.950|  68.69000|  79.360|
|  1997|  78.610|  70.42600|  80.690|
|  2002|  79.770|  72.02800|  82.000|
|  2007|  80.653|  72.96100|  82.603|

From the table above, it very easy to compare the life expectancy for different countries in different years. And the same time, it can find some trends in each country's column. Moreover, I find the highest life expectancy for these three countries are in 2007.
