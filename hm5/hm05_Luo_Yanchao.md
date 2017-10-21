hm05\_Luo\_yanchao
================

Load the data
-------------

``` r
library(gapminder)
library(tidyverse)
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
library(forcats)
```

    ## Warning: package 'forcats' was built under R version 3.4.2

``` r
library(singer)
library(reshape2)
```

    ## Warning: package 'reshape2' was built under R version 3.4.2

    ## 
    ## Attaching package: 'reshape2'

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     smiths

``` r
library(RColorBrewer)
library(dplyr)
library(grid)
```

Factor management
-----------------

**Step goals:**

-   Define factor variables;
-   Drop factor / levels;
-   Reorder levels based on knowledge from data.

I choose the Joey’s Singer data.

#### Factorise

*Transform some of the variable in the singer\_locations dataframe into factors: pay attention at what levels you introduce and their order. Try and consider the difference between the base R as.factor and the forcats-provided functions.*

#### Factor inspection

``` r
singer_locations
```

    ## # A tibble: 10,100 x 14
    ##              track_id                       title            song_id
    ##                 <chr>                       <chr>              <chr>
    ##  1 TRWICRA128F42368DB       The Conversation (Cd) SOSURTI12A81C22FB8
    ##  2 TRXJANY128F42246FC               Lonely Island SODESQP12A6D4F98EF
    ##  3 TRIKPCA128F424A553       Here's That Rainy Day SOQUYQD12A8C131619
    ##  4 TRYEATD128F92F87C9             Rego Park Blues SOEZGRC12AB017F1AC
    ##  5 TRBYYXH128F4264585                       Games SOPIOCP12A8C13A322
    ##  6 TRKFFKR128F9303AE3                  More Pipes SOHQSPY12AB0181325
    ##  7 TRSSNNI128F42661D8              out OF my MIND SOIHOMM12A8C139A02
    ##  8 TRXSSXI128F428FAD4 Endlich Ein Grund Zur Panik SODTXQY12A6D4F748E
    ##  9 TRDKANB128F4261BDE                 I Am A Rock SOCZZEQ12A8C1318A9
    ## 10 TRJQSXM128F932A05B             A perfect world SOFJTIS12AB0184236
    ## # ... with 10,090 more rows, and 11 more variables: release <chr>,
    ## #   artist_id <chr>, artist_name <chr>, year <int>, duration <dbl>,
    ## #   artist_hotttnesss <dbl>, artist_familiarity <dbl>, latitude <dbl>,
    ## #   longitude <dbl>, name <chr>, city <chr>

``` r
str(singer_locations)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    10100 obs. of  14 variables:
    ##  $ track_id          : chr  "TRWICRA128F42368DB" "TRXJANY128F42246FC" "TRIKPCA128F424A553" "TRYEATD128F92F87C9" ...
    ##  $ title             : chr  "The Conversation (Cd)" "Lonely Island" "Here's That Rainy Day" "Rego Park Blues" ...
    ##  $ song_id           : chr  "SOSURTI12A81C22FB8" "SODESQP12A6D4F98EF" "SOQUYQD12A8C131619" "SOEZGRC12AB017F1AC" ...
    ##  $ release           : chr  "Even If It Kills Me" "The Duke Of Earl" "Imprompture" "Still River" ...
    ##  $ artist_id         : chr  "ARACDPV1187FB58DF4" "ARYBUAO1187FB3F4EB" "AR4111G1187B9B58AB" "ARQDZP31187B98D623" ...
    ##  $ artist_name       : chr  "Motion City Soundtrack" "Gene Chandler" "Paul Horn" "Ronnie Earl & the Broadcasters" ...
    ##  $ year              : int  2007 2004 1998 1995 1968 2006 2003 2007 1966 2006 ...
    ##  $ duration          : num  170 107 528 695 237 ...
    ##  $ artist_hotttnesss : num  0.641 0.394 0.431 0.362 0.411 ...
    ##  $ artist_familiarity: num  0.823 0.57 0.504 0.477 0.53 ...
    ##  $ latitude          : num  NA 41.9 40.7 NA 42.3 ...
    ##  $ longitude         : num  NA -87.6 -74 NA -83 ...
    ##  $ name              : chr  NA "Gene Chandler" "Paul Horn" NA ...
    ##  $ city              : chr  NA "Chicago, IL" "New York, NY" NA ...
    ##  - attr(*, "spec")=List of 2
    ##   ..$ cols   :List of 14
    ##   .. ..$ track_id          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ title             : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ song_id           : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ release           : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ artist_id         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ artist_name       : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ year              : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ duration          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ artist_hotttnesss : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ artist_familiarity: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ latitude          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ longitude         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ name              : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ city              : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   ..$ default: list()
    ##   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
    ##   ..- attr(*, "class")= chr "col_spec"

``` r
nrow(singer_locations)
```

    ## [1] 10100

``` r
length(unique(singer_locations$artist_name))
```

    ## [1] 7498

``` r
length(unique(singer_locations$name))
```

    ## [1] 2913

``` r
length(unique(singer_locations$artist_id))
```

    ## [1] 7346

From the R output above. `str(singer_locations)` shows that no variable is vector. And `nrow(singer_locations)` shows that there are 10100 rows in total. I found unique of `artist_id`, `artist_name`,`name` are less than total `nrows`, so I want to factorize `artist_id`, `artist_name`,`name`.

Using `as.factor`.

``` r
newsinger_locations <- singer_locations %>%
  mutate(factor_name = as.factor(singer_locations$name), 
         factor_artist_name = as.factor(singer_locations$artist_name), 
         factor_artist_id = as.factor(singer_locations$artist_id))
head(newsinger_locations)
```

    ## # A tibble: 6 x 17
    ##             track_id                 title            song_id
    ##                <chr>                 <chr>              <chr>
    ## 1 TRWICRA128F42368DB The Conversation (Cd) SOSURTI12A81C22FB8
    ## 2 TRXJANY128F42246FC         Lonely Island SODESQP12A6D4F98EF
    ## 3 TRIKPCA128F424A553 Here's That Rainy Day SOQUYQD12A8C131619
    ## 4 TRYEATD128F92F87C9       Rego Park Blues SOEZGRC12AB017F1AC
    ## 5 TRBYYXH128F4264585                 Games SOPIOCP12A8C13A322
    ## 6 TRKFFKR128F9303AE3            More Pipes SOHQSPY12AB0181325
    ## # ... with 14 more variables: release <chr>, artist_id <chr>,
    ## #   artist_name <chr>, year <int>, duration <dbl>,
    ## #   artist_hotttnesss <dbl>, artist_familiarity <dbl>, latitude <dbl>,
    ## #   longitude <dbl>, name <chr>, city <chr>, factor_name <fctr>,
    ## #   factor_artist_name <fctr>, factor_artist_id <fctr>

Using `forcats`

    newsinger_locations2 <- singer_locations %>%
      mutate(factor_name = as_factor(singer_locations$name),
             factor_artist_name = as_factor(singer_locations$artist_name), 
             factor_artist_id = as_factor(singer_locations$artist_id)) 
    head(newsinger_locations2)

At this time, the `as_factor` does not work. So I checked the data and found that the reason of not working may be due to many `NA` in the data.

Check the "NA"

``` r
if(sum(is.na(singer_locations$name)!=0)) print("variable `name` has NA")
```

    ## [1] "variable `name` has NA"

``` r
if(sum(is.na(singer_locations$artist_name)!=0)) print("variable `artist_name` has NA")
if(sum(is.na(singer_locations$artist_id)!=0)) print("variable `artist_id` has NA")
```

From the code above, I found variable `name` has "NA"s.

Assign "no information" for "NA".

``` r
newsinger_locations3 <- singer_locations %>%
  mutate(name= ifelse(is.na(name), "no information", singer_locations$name)) %>% 
  mutate(factor_name = as_factor(name), 
         factor_artist_name = as_factor(artist_name),
         factor_artist_id = as_factor(artist_id))
head(newsinger_locations3)
```

    ## # A tibble: 6 x 17
    ##             track_id                 title            song_id
    ##                <chr>                 <chr>              <chr>
    ## 1 TRWICRA128F42368DB The Conversation (Cd) SOSURTI12A81C22FB8
    ## 2 TRXJANY128F42246FC         Lonely Island SODESQP12A6D4F98EF
    ## 3 TRIKPCA128F424A553 Here's That Rainy Day SOQUYQD12A8C131619
    ## 4 TRYEATD128F92F87C9       Rego Park Blues SOEZGRC12AB017F1AC
    ## 5 TRBYYXH128F4264585                 Games SOPIOCP12A8C13A322
    ## 6 TRKFFKR128F9303AE3            More Pipes SOHQSPY12AB0181325
    ## # ... with 14 more variables: release <chr>, artist_id <chr>,
    ## #   artist_name <chr>, year <int>, duration <dbl>,
    ## #   artist_hotttnesss <dbl>, artist_familiarity <dbl>, latitude <dbl>,
    ## #   longitude <dbl>, name <chr>, city <chr>, factor_name <fctr>,
    ## #   factor_artist_name <fctr>, factor_artist_id <fctr>

The `as_factor` worked after we have removed the "NA"s.

-   Name

``` r
nlevels(newsinger_locations$factor_name)
```

    ## [1] 2912

``` r
nlevels(newsinger_locations3$factor_name)
```

    ## [1] 2913

``` r
head(levels(newsinger_locations$factor_name))
```

    ## [1] "<U+00C4>I-TIEM" "10 Years"    "10cc"        "11/5_ Billy" "13 Cats"    
    ## [6] "17 Hippies"

``` r
head(levels(newsinger_locations3$factor_name))
```

    ## [1] "no information" "Gene Chandler"  "Paul Horn"      "Dorothy Ashby" 
    ## [5] "Barleyjuice"    "Madlib"

-   artist\_name

Compare nlevels between `as.factor` and `as_factor`.

``` r
nlevels(newsinger_locations$factor_artist_name)
```

    ## [1] 7498

``` r
nlevels(newsinger_locations3$factor_artist_name)
```

    ## [1] 7498

``` r
head(levels(newsinger_locations$factor_artist_name))
```

    ## [1] "'t Hof Van Commerce" "'Til Tuesday"        "*Shels"             
    ## [4] "[re:jazz]"           "+44"                 "<U+00C4>I-TIEM"

``` r
head(levels(newsinger_locations3$factor_artist_name))
```

    ## [1] "Motion City Soundtrack"         "Gene Chandler"                 
    ## [3] "Paul Horn"                      "Ronnie Earl & the Broadcasters"
    ## [5] "Dorothy Ashby"                  "Barleyjuice"

-   artist\_id

``` r
nlevels(newsinger_locations$factor_artist_id)
```

    ## [1] 7346

``` r
nlevels(newsinger_locations3$factor_artist_id)
```

    ## [1] 7346

``` r
head(levels(newsinger_locations$factor_artist_id))
```

    ## [1] "AR002UA1187B9A637D" "AR00DG71187B9B7FCB" "AR00J9R1187B98D920"
    ## [4] "AR00JIO1187B9A5A15" "AR00L9V1187FB4353A" "AR00MBZ1187B9B5DB1"

``` r
head(levels(newsinger_locations3$factor_artist_id))
```

    ## [1] "ARACDPV1187FB58DF4" "ARYBUAO1187FB3F4EB" "AR4111G1187B9B58AB"
    ## [4] "ARQDZP31187B98D623" "AR75GYU1187B9AE47A" "ARCENE01187B9AF929"

Actually,`as_factor`creates levels in order in which they appear, and it will be the same as the original data. On the other hand, `as.factor` will change the levels order of the factor. Therefore, if there is no "NA"s `as_factor` is better than `as.factor`, because it will keep the data's original order.

#### Drop 0

*Filter the singer\_locations data to remove observations associated with the uncorrectly inputed year 0. Additionally, remove unused factor levels. Provide concrete information on the data before and after removing these rows and levels; address the number of rows and the levels of the affected factors.*

Using the new dataset `newsinger_locations3`

``` r
Check_0<-newsinger_locations3 %>%
  filter(year==0) 

nrow(Check_0)
```

    ## [1] 100

We had 100 observations which the "year" equal to "0".

`droplevels()` operates on all the factors in a data frame or on a single factor.

``` r
remove_0 <- newsinger_locations3 %>%
  filter(year != 0) %>%
  droplevels()
nrow(remove_0)
```

    ## [1] 10000

There are 100 rows have been removed compared with the previous data.

Checked how many levels changed after removing "0".

-   name

``` r
nlevels(remove_0$factor_name)
```

    ## [1] 2879

``` r
nlevels(newsinger_locations3$factor_name)-nlevels(remove_0$factor_name)
```

    ## [1] 34

We used to have 2913 levels of variable `name`, and left 2879 levels after removing "0". So it totally reduced 34 levels.

-   artist\_name

``` r
nlevels(remove_0$factor_artist_name)
```

    ## [1] 7408

``` r
nlevels(newsinger_locations3$factor_artist_name)-nlevels(remove_0$factor_artist_name)
```

    ## [1] 90

We used to have 7498 levels of variable `name`, and left 7408 levels after removing "0". So it totally reduced 90 levels.

-   artist\_id

``` r
nlevels(remove_0$factor_artist_id)
```

    ## [1] 7258

``` r
nlevels(newsinger_locations3$factor_artist_id)-nlevels(remove_0$factor_artist_id)
```

    ## [1] 88

We used to have 7346 levels of variable `name`, and left 7258 levels after removing "0". So it totally reduced 88 levels.

``` r
table <- data.frame( nlevels(newsinger_locations3$factor_name), nlevels(remove_0$factor_name), nlevels(newsinger_locations3$factor_artist_name), nlevels(remove_0$factor_artist_name), nlevels(newsinger_locations3$factor_artist_id), nlevels(remove_0$factor_artist_id))
names(table) <- c("`name` before", "`name` after ", "`artist_name` before", "`artist_name` after","`artist_id` before","`artist_id` after")
knitr::kable(table)
```

|  `name` before| `name` after |  `artist_name` before|  `artist_name` after|  `artist_id` before|  `artist_id` after|
|--------------:|:------------:|---------------------:|--------------------:|-------------------:|------------------:|
|           2913|     2879     |                  7498|                 7408|                7346|               7258|

#### Reorder the levels of year, artist\_name or title.

*Use the forcats package to change the order of the factor levels, based on a principled summary of one of the quantitative variables. Consider experimenting with a summary statistic beyond the most basic choice of the median.*

Factor variables `artist_name` `year` `title`.

``` r
newsinger_locations4 <- singer_locations %>%
  mutate(factor_artist_name = as_factor(artist_name),
         factor_title = as_factor(title))
```

-   Reorder the `title` by another variable `artist_hotttnesss`.

1.  Original order

``` r
head(levels(newsinger_locations4$factor_title))
```

    ## [1] "The Conversation (Cd)" "Lonely Island"         "Here's That Rainy Day"
    ## [4] "Rego Park Blues"       "Games"                 "More Pipes"

1.  Order the mean value instead of median value and using backwards.

``` r
fct_reorder(newsinger_locations4$factor_title, newsinger_locations4$artist_hotttnesss, mean, desc = TRUE) %>% 
  levels() %>%  head() 
```

    ## [1] "Weightlessness"       "Farmers Earn Livings" "Hello There Babushka"
    ## [4] "Stop That Thing"      "Session 1"            "Cryin' Alone"

The levels of `title` are reordered, so that the mean of artist\_hotttnesss are in descending order.

-   Reorder the `artist_name` by another variable `artist_hotttnesss`

1.  Original order

``` r
head(levels(newsinger_locations4$factor_artist_name))
```

    ## [1] "Motion City Soundtrack"         "Gene Chandler"                 
    ## [3] "Paul Horn"                      "Ronnie Earl & the Broadcasters"
    ## [5] "Dorothy Ashby"                  "Barleyjuice"

1.  Order the minimum value of artist\_hotttnesss.

``` r
fct_reorder(newsinger_locations4$factor_artist_name, newsinger_locations4$artist_hotttnesss, min) %>% 
  levels() %>%  head()
```

    ## [1] "The Freelance Hellraiser"                  
    ## [2] "Col. Bruce Hampton and the Late Bronze Age"
    ## [3] "The Jancee Pornick Casino"                 
    ## [4] "Elliott Sharp`s Terraplane"                
    ## [5] "Main Concept"                              
    ## [6] "Jessie Lee Miller"

The levels of `artist_name` are reordered follow by the minimum of artist\_hotttnesss.

#### Common part:

*Characterize the (derived) data before and after your factor re-leveling.*

*Explore the effects of arrange(). Does merely arranging the data have any effect on, say, a figure?* *Explore the effects of reordering a factor and factor reordering coupled with arrange(). Especially, what effect does this have on a figure?*

-   Using `arrange` function to see how to change the factor `title` and `artist_name`.

Because the data is so large, I want to consider subset of data(only see the artist\_hotttnesss larger than 0.840 ).

Plot before `arrange`.

``` r
newsinger_locations4 %>% 
  filter(artist_hotttnesss>0.840) %>% 
  ggplot(aes(x=factor_artist_name,y=artist_hotttnesss)) + 
  geom_point(aes(colour=artist_name)) +
 labs(y="artist_hotttnesss", 
          x="artist_name",
          title=" Using `arrange` to compare factor_artist_name based on artist_hotttnesss")+
  theme_bw()+
  theme( axis.title = element_text(size=14))
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-20-1.png)

``` r
newsinger_locations4 %>% 
  arrange(artist_hotttnesss) %>% 
  filter(artist_hotttnesss>0.840) %>% 
  ggplot(aes(x=factor_artist_name,y=artist_hotttnesss)) + 
  geom_point(aes(colour=artist_name)) +
 labs(y="artist_hotttnesss", 
          x="artist_name",
          title=" Using `arrange` to compare factor_artist_name based on artist_hotttnesss")+
  theme_bw()+
  theme( axis.title = element_text(size=14))
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-21-1.png)

We can see that `arrange` does not has any effect on the plots, and the levels are the same as before and after arranged.

-   Using `reordering` function to see how the factor `title` and `artist_name`changed.

``` r
newsinger_locations4 %>% 
  filter(artist_hotttnesss>0.840) %>% 
  ggplot(aes(x=fct_reorder(factor_artist_name, artist_hotttnesss,max,desc = TRUE),y=artist_hotttnesss)) + 
  geom_point(aes(colour=artist_name)) +
 labs( y="artist_hotttnesss", 
          x="artist_name",
          title=" Using ``reorder` to arrange factor_artist_name based on artist_hotttnesss")+
  theme_bw()+
  theme( axis.title = element_text(size=14))
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-22-1.png)

Using `reorder` often makes plots much better. We could see who is the most popular artist and how hot he is.

-   Using `reorder` and `arrange` function to see how the factor `title` and `artist_name` changed.

``` r
newsinger_locations4 %>% 
  arrange(artist_hotttnesss) %>% 
  filter(artist_hotttnesss>0.840) %>% 
  ggplot(aes(x=fct_reorder(factor_artist_name, artist_hotttnesss,max,desc = TRUE),y=artist_hotttnesss)) + 
  geom_point(aes(colour=artist_name)) +
 labs(y="artist_hotttnesss", 
          x="artist_name",
          title=" Compare the  factor_artist_name based on artist_hotttnesss")+
  theme_bw()+
  theme( axis.title = element_text(size=14))
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-23-1.png) `arrange()` does not change the order of the levels and has no effect on the plots. There is no change for the above plot compared with the graph, which only uses `reorder` function.

File I/O
--------

*Experiment with one or more of `write_csv()`/`read_csv()` (and/or TSV friends), `saveRDS()`/`readRDS()`, `dput()`/`dget()`. Create something new, probably by filtering or grouped-summarization of Singer or Gapminder. I highly recommend you fiddle with the factor levels, i.e. make them non-alphabetical (see previous section). Explore whether this survives the round trip of writing to file then reading back in.*

#### Using `write_csv` and `read_csv()`.

``` r
## When year larger than 2009, summary the maximum of hotness for each artist.
artist_hotttnesss_max <- newsinger_locations4 %>%
  select(year,factor_artist_name,artist_hotttnesss) %>%
  filter(year>2009) %>%
  group_by(factor_artist_name) %>% 
  summarise(max_artist_hotttnesss=max(artist_hotttnesss))
```

``` r
readr::write_csv(artist_hotttnesss_max, "artist_hotttnesss")
```

``` r
head(readr::read_csv("artist_hotttnesss"))
```

    ## Parsed with column specification:
    ## cols(
    ##   factor_artist_name = col_character(),
    ##   max_artist_hotttnesss = col_double()
    ## )

    ## # A tibble: 6 x 2
    ##      factor_artist_name max_artist_hotttnesss
    ##                   <chr>                 <dbl>
    ## 1    Coheed and Cambria             0.6034302
    ## 2          Justin Faust             0.4125170
    ## 3 Mary Chapin Carpenter             0.4920317
    ## 4            Riva Starr             0.4603628
    ## 5              Hot Chip             0.5357632
    ## 6 Boy Eats Drum Machine             0.4394676

``` r
str(readr::read_csv("artist_hotttnesss"))
```

    ## Parsed with column specification:
    ## cols(
    ##   factor_artist_name = col_character(),
    ##   max_artist_hotttnesss = col_double()
    ## )

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    173 obs. of  2 variables:
    ##  $ factor_artist_name   : chr  "Coheed and Cambria" "Justin Faust" "Mary Chapin Carpenter" "Riva Starr" ...
    ##  $ max_artist_hotttnesss: num  0.603 0.413 0.492 0.46 0.536 ...
    ##  - attr(*, "spec")=List of 2
    ##   ..$ cols   :List of 2
    ##   .. ..$ factor_artist_name   : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ max_artist_hotttnesss: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   ..$ default: list()
    ##   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
    ##   ..- attr(*, "class")= chr "col_spec"

I found that `artist_name` is considered as a character instead of factor, when using `read_csv` functions.

#### Using `saveRDS()` and `readRDS()`

`saveRDS()` serializes an R object to a binary file. `saveRDS()` has more arguments, in particular compress for controlling compression, so I read the help for more advanced usage.

``` r
saveRDS(artist_hotttnesss_max, "artist_hotttnesss_max.rds")
artist_hotttnesss_max1<-readRDS("artist_hotttnesss_max.rds")
str(artist_hotttnesss_max1)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    173 obs. of  2 variables:
    ##  $ factor_artist_name   : Factor w/ 7498 levels "Motion City Soundtrack",..: 13 47 62 77 85 113 144 180 235 245 ...
    ##  $ max_artist_hotttnesss: num  0.603 0.413 0.492 0.46 0.536 ...

I found that we have changed the `artist_name` to be a factor at this time.

#### Using `dput()`/`dget()`

``` r
dput(artist_hotttnesss_max, "artist_hotttnesss_max_dput.txt")
artist_hotttnesss_max2 <- dget("artist_hotttnesss_max_dput.txt")
str(artist_hotttnesss_max2)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    173 obs. of  2 variables:
    ##  $ factor_artist_name   : Factor w/ 7498 levels "Motion City Soundtrack",..: 13 47 62 77 85 113 144 180 235 245 ...
    ##  $ max_artist_hotttnesss: num  0.603 0.413 0.492 0.46 0.536 ...

Using `dget` will change the `artist_name` to be a factor. There is no difference between `dget()` and `saveRDS()` at this time.

#### Testing whether reordering levels of `artist_name` after reading in and out:

``` r
newsinger_locations_test <- singer_locations %>%
  mutate(factor_artist_name = as_factor(artist_name),
         factor_title = as_factor(title))
head(levels(newsinger_locations_test$factor_artist_name))
```

    ## [1] "Motion City Soundtrack"         "Gene Chandler"                 
    ## [3] "Paul Horn"                      "Ronnie Earl & the Broadcasters"
    ## [5] "Dorothy Ashby"                  "Barleyjuice"

``` r
newsinger_locations_test$factor_artist_name<-fct_reorder(newsinger_locations_test$factor_artist_name,newsinger_locations_test$artist_hotttnesss,max)

head(levels(newsinger_locations_test$factor_artist_name))
```

    ## [1] "The Freelance Hellraiser"                  
    ## [2] "Col. Bruce Hampton and the Late Bronze Age"
    ## [3] "The Jancee Pornick Casino"                 
    ## [4] "Elliott Sharp`s Terraplane"                
    ## [5] "Main Concept"                              
    ## [6] "Jessie Lee Miller"

We could find that `artist_name` are changed by `artist_hotttnesss`. So I save it to file,and reopen it to see whether the order is changed or not.

-   `write_csv` and `read_csv`

``` r
write_csv(newsinger_locations_test, "reorder_singer_locations.csv")
reorder_singer_locations_csv <- read_csv("reorder_singer_locations.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   track_id = col_character(),
    ##   title = col_character(),
    ##   song_id = col_character(),
    ##   release = col_character(),
    ##   artist_id = col_character(),
    ##   artist_name = col_character(),
    ##   year = col_integer(),
    ##   duration = col_double(),
    ##   artist_hotttnesss = col_double(),
    ##   artist_familiarity = col_double(),
    ##   latitude = col_double(),
    ##   longitude = col_double(),
    ##   name = col_character(),
    ##   city = col_character(),
    ##   factor_artist_name = col_character(),
    ##   factor_title = col_character()
    ## )

``` r
reorder_singer_locations_csv$factor_artist_name <- as.factor(reorder_singer_locations_csv$factor_artist_name)
head(levels(reorder_singer_locations_csv$factor_artist_name))
```

    ## [1] "'t Hof Van Commerce" "'Til Tuesday"        "*Shels"             
    ## [4] "[re:jazz]"           "+44"                 "<U+00C4>I-TIEM"

Note that the order of output should not reorder the levels.

-   `saveRDS` and `readRDS`

``` r
saveRDS(newsinger_locations_test, "reorder_newsinger_locations_test.rds")
reorder_singer_locations_rds <- readRDS("reorder_newsinger_locations_test.rds")
head(levels(reorder_singer_locations_rds$factor_artist_name))
```

    ## [1] "The Freelance Hellraiser"                  
    ## [2] "Col. Bruce Hampton and the Late Bronze Age"
    ## [3] "The Jancee Pornick Casino"                 
    ## [4] "Elliott Sharp`s Terraplane"                
    ## [5] "Main Concept"                              
    ## [6] "Jessie Lee Miller"

We can see that how reordering works using `saveRDS` / `readRDS`.

-   `dput()`/`dget()`

``` r
dput(newsinger_locations_test, "reorder_newsinger_locations_test.txt")
reorder_singer_locations_txt <- dget("reorder_newsinger_locations_test.txt")
head(levels(reorder_singer_locations_txt$factor_artist_name))
```

    ## [1] "The Freelance Hellraiser"                  
    ## [2] "Col. Bruce Hampton and the Late Bronze Age"
    ## [3] "The Jancee Pornick Casino"                 
    ## [4] "Elliott Sharp`s Terraplane"                
    ## [5] "Main Concept"                              
    ## [6] "Jessie Lee Miller"

We can see that how reordering works using `dput()`/`dget()`.

``` r
artist_name_level <- tibble(original = head(levels(newsinger_locations_test$factor_artist_name)))
artist_name_level <- artist_name_level %>% 
  mutate(use_csv = head(levels(reorder_singer_locations_csv$factor_artist_name)),
         use_rds = head(levels(reorder_singer_locations_rds$factor_artist_name)),
         use_txt = head(levels(reorder_singer_locations_txt$factor_artist_name)))
knitr::kable(artist_name_level)
```

| original                                   | use\_csv            | use\_rds                                   | use\_txt                                   |
|:-------------------------------------------|:--------------------|:-------------------------------------------|:-------------------------------------------|
| The Freelance Hellraiser                   | 't Hof Van Commerce | The Freelance Hellraiser                   | The Freelance Hellraiser                   |
| Col. Bruce Hampton and the Late Bronze Age | 'Til Tuesday        | Col. Bruce Hampton and the Late Bronze Age | Col. Bruce Hampton and the Late Bronze Age |
| The Jancee Pornick Casino                  | \*Shels             | The Jancee Pornick Casino                  | The Jancee Pornick Casino                  |
| Elliott Sharp\`s Terraplane                | \[re:jazz\]         | Elliott Sharp\`s Terraplane                | Elliott Sharp\`s Terraplane                |
| Main Concept                               | +44                 | Main Concept                               | Main Concept                               |
| Jessie Lee Miller                          | <U+00C4>I-TIEM      | Jessie Lee Miller                          | Jessie Lee Miller                          |

Note that compared with the original levels, post-reordering country factor levels are restored by using the `saveRDS()` / `readRDS()` and `dput()`/`dget()` strategy. But they should be reverted to alphabetical ordering by using `write_csv()` / `read_csv()`.

Visualization design
--------------------

*Remake at least one figure or create a new one, in light of something you learned in the recent class meetings about visualization design and color. Maybe juxtapose your first attempt and what you obtained after some time spent working on it. Reflect on the differences.*

I am interested in `hotttnesss` for different artists and their hottness `duration` as the time change. Randomly picked an artist "Cannibal Corpse" to highlight her/his `duration`.

#### The first graph:

``` r
colour_layer <- scale_colour_manual("", 
                        labels=c("Other artist", "Cannibal Corpse"),
                        values=c("black", "red"))
                        
 p<-newsinger_locations4%>% 
   filter(year>1980) %>% 
  ggplot(aes(year, duration))+
  geom_line(aes(group=factor_artist_name,
                color=factor_artist_name=="Cannibal Corpse",
                alpha=factor_artist_name=="Cannibal Corpse"))+
    colour_layer +
    scale_alpha_discrete(range=c(0.1, 1),
                         guide=FALSE)+
 labs(x="year", 
          y="duration",
          title="duration as the time change")+
  theme_bw()+
  theme( axis.title = element_text(size=14))
 p
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-34-1.png)

#### The second graphs:

First I try to subset the data, only looked at the hotness larger than 0.6 and the year after 1999. The I plot the `factor_artist_name` vs related `artist_hotttnesss`. By the same time, colored the `year` and scaled artists `familiarity`.

``` r
newsinger_locations4 %>% 
   arrange(artist_hotttnesss) %>% 
   mutate(factor_artist_name = fct_reorder(factor_artist_name, artist_hotttnesss,max, desc = TRUE)) %>%
  filter(artist_hotttnesss>0.6, year>1999) %>% 
ggplot( aes(x=factor_artist_name,y= artist_hotttnesss, size=artist_familiarity,colour=year)) +
    geom_point(alpha=0.5) +
  scale_colour_distiller(palette="Spectral")+
  theme_bw() +
  labs(x="artist name", y="artist hotness", title="artists hotness and their familiarity")+
      theme( axis.title = element_text(size=14))
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-35-1.png)

In the picture, it is very hard to find the artist and his related hotness.

using `fct_lump` function to find the top 3 artists .

``` r
newsinger_locations4 %>% 
   arrange(artist_hotttnesss) %>% 
   mutate(factor_artist_name1 = fct_reorder(factor_artist_name, artist_hotttnesss, desc = TRUE)) %>%
  filter(artist_hotttnesss>0.6, year>1999) %>% 
  mutate(topartist_names = fct_lump(factor_artist_name1, n=3)) %>% 
ggplot( aes(x=fct_reorder(topartist_names,artist_hotttnesss),y= artist_hotttnesss, size=artist_familiarity,colour=year)) +
    geom_point(alpha=0.5) +
    scale_colour_distiller( palette="Spectral")+
theme_bw() +
  labs(x="artist name", y="artist hotness", title="artists hotness and their familiarity")+
      theme( axis.title = element_text(size=14))
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-36-1.png)

In the graph we can see too much information which is not useful when I only want to find the top 3 `artists`. Therefore, I will remove the "usefulless" features `other` in the plots.

``` r
newsinger_locations4 %>% 
   arrange(artist_hotttnesss) %>% 
   mutate(factor_artist_name1 = fct_reorder(factor_artist_name, artist_hotttnesss, desc = TRUE)) %>%
  filter(artist_hotttnesss>0.6, year>1999) %>% 
  mutate(topartist_names = fct_lump(factor_artist_name1, n=3)) %>% 
    filter(topartist_names != "Other") %>%
  droplevels() %>% 
ggplot( aes(x=fct_reorder(topartist_names,artist_hotttnesss),y= artist_hotttnesss, size=artist_familiarity,colour=year)) +
    geom_point(alpha=0.5) +
    scale_colour_distiller( palette="Spectral")+
theme_bw() +
  labs(x="artist name", y="artist hotness", title="artists hotness and their familiarity")+
      theme( axis.title = element_text(size=14))
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-37-1.png)

Removing the `other`, which `artist` hotness are not in the top three. From the graph above, we can easily find that "Alicia Keys" has the highest artist hotness, and she also has higher familiarity happened after 2007. And "Joe Satriani" hotness ranks three and he has the lower familiarity happened in 2000.

Try to use `multiplot` function

``` r
 p1<-singer_locations %>%
  mutate(factor_artist_name=as_factor(artist_name))%>% 
  filter(year!=0)%>%
  droplevels() %>%
  mutate (factor_artist_name=fct_reorder(factor_artist_name, artist_hotttnesss, desc = TRUE)) %>% 
  mutate(top_artist_name = fct_lump(factor_artist_name, n=3)) %>%
  filter(top_artist_name != "Other") %>%
  select(top_artist_name,year, artist_hotttnesss) %>%
  ggplot(aes(x = year, y = artist_hotttnesss, colour=top_artist_name)) + 
    geom_point(alpha=0.9)+
  theme_bw() +
    theme(axis.title = element_text(size=14))
p1
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-38-1.png)

``` r
 p2<-singer_locations %>%
  mutate(factor_artist_name=as_factor(artist_name))%>% 
  filter(year!=0)%>%
  droplevels() %>%
  mutate (factor_artist_name=fct_reorder(factor_artist_name, artist_hotttnesss, desc = TRUE)) %>% 
  mutate(top_artist_name = fct_lump(factor_artist_name, n=3)) %>%
  filter(top_artist_name != "Other") %>%
  select(top_artist_name,year, artist_familiarity) %>%
  ggplot(aes(x = year, y = artist_familiarity, colour=top_artist_name)) + 
    geom_point(alpha=0.9)+
     theme_bw() +
    theme(axis.title = element_text(size=14))
p2
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-38-2.png)

Now use multiplot function.

``` r
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
multiplot(p1,p2,cols = 2)
```

![](hm05_Luo_Yanchao_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-39-1.png)

Firstly, I reorder the `artist_name` by another variable `artist_hotttnesss`. At the same time I also use `fct_lump` to found top three "artist\_name".(I only focus on top 3 artist\_name, and gives 8 outcomes, which means that there are some artists have the same order) Then "p1" graph compare `year` with `artist_hotttnesss` and "p2" graph compare `year` with `artist_familiarity`. Finally, I use `multiplot` to put "p1" graph and "p2" graph together.

Writing figures to file
-----------------------

`ggsave` and plot again.

``` r
ggsave("my plot.png", width=12, height=8, plot=p)
```

![plot](my%20plot.png)

``` r
ggsave("my plot.pdf", width=12, height=8, plot=p)
```

![plot](my%20plot.pdf)

But I want to do more!
----------------------

*Make a deeper exploration of the forcats packages, i.e. try more of the factor level reordering functions.*

*Revalue a factor, e.g.:*

*Singer version: Pick a handful of locations (they are named city, try using distinct()) that you can pinpoint to a geographical place (city, region, country, continent,…). Create an excerpt of the Singer data, filtered to just those rows. Create a (couple of) new factor(s) – you pick the name(s)! – by mapping the existing city factor levels to the new (city, region, country…) levels.* *Examples: “London, England” –&gt; “London”, “England”, “UK”, “Europe”;* *“Los Angeles, CA” –&gt; “Los Angeles”, “California”, “USA”, “Americas”;...*

*“310, Louisiana” –&gt; “New Orleans”, “Louisiana”, “USA”, “Americas”.* *When you get tired, if you still have time on your hand, try to make this process of geolocalization more streamlined: you may want to try and use the separate function from tidyr.*

``` r
But_I_want_do_more <- singer_locations %>%
  mutate(city= ifelse(is.na(city), "no information", singer_locations$city)) %>% 
 mutate(factor_city = as_factor(city)) 

p<- But_I_want_do_more%>%
  filter(factor_city %in% c("Oxnard, CA","Los Angeles, CA","Portland, OR","Berlin, Germany","New York, NY")) %>%
  droplevels() %>%
  mutate(cityname = fct_recode(factor_city, "Oxnard" = "Oxnard, CA", "Los Angeles" = "Los Angeles, CA", "Portland" = "Portland, OR", "Berlin" = "Berlin, Germany", "New York" = "New York, NY")) %>% 
  select(title, artist_name, city, cityname)
knitr::kable(head(p))
```

| title                    | artist\_name | city            | cityname    |
|:-------------------------|:-------------|:----------------|:------------|
| Here's That Rainy Day    | Paul Horn    | New York, NY    | New York    |
| Indian Deli              | Madlib       | Oxnard, CA      | Oxnard      |
| The Ingenue (LP Version) | Little Feat  | Los Angeles, CA | Los Angeles |
| The Breaks               | 31Knots      | Portland, OR    | Portland    |
| At The End               | iio          | New York, NY    | New York    |
| The Hunting Song         | Tom Lehrer   | New York, NY    | New York    |

Using the `separate` function from tidyr.

``` r
p1<- But_I_want_do_more%>%
  filter(city %in% c("Oxnard, CA","Los Angeles, CA","Portland, OR","Berlin, Germany","New York, NY")) %>%
  droplevels() %>% 
  select(title, artist_name, city)%>% 
  separate(city,c("city", "state/country"), sep = ",") 
  
knitr::kable(head(p1))
```

| title                    | artist\_name | city        | state/country |
|:-------------------------|:-------------|:------------|:--------------|
| Here's That Rainy Day    | Paul Horn    | New York    | NY            |
| Indian Deli              | Madlib       | Oxnard      | CA            |
| The Ingenue (LP Version) | Little Feat  | Los Angeles | CA            |
| The Breaks               | 31Knots      | Portland    | OR            |
| At The End               | iio          | New York    | NY            |
| The Hunting Song         | Tom Lehrer   | New York    | NY            |

Report the process.
-------------------

There are two questions appear when I was doing the homework. The first question is:

If I try to factor `year` in the `mutate` , there is an error says "no applicable method for 'as\_factor' applied to an object of class "c('integer', 'numeric')"".

     singer_locations %>%
      mutate (factor_year = as_factor(year))

But when I use "typeof" to see the data type.

``` r
typeof(singer_locations$year)
```

    ## [1] "integer"

So I am confused about why I can not use factor `year` in `mutate` function.

The second question is:

If I want to use the `read_csv` function, the level of the `factor_artist_name` wil alsways shows unreadable code.

``` r
write_csv(newsinger_locations_test, "reorder_singer_locations.csv")
reorder_singer_locations_csv <- read_csv("reorder_singer_locations.csv")
```

    ## Parsed with column specification:
    ## cols(
    ##   track_id = col_character(),
    ##   title = col_character(),
    ##   song_id = col_character(),
    ##   release = col_character(),
    ##   artist_id = col_character(),
    ##   artist_name = col_character(),
    ##   year = col_integer(),
    ##   duration = col_double(),
    ##   artist_hotttnesss = col_double(),
    ##   artist_familiarity = col_double(),
    ##   latitude = col_double(),
    ##   longitude = col_double(),
    ##   name = col_character(),
    ##   city = col_character(),
    ##   factor_artist_name = col_character(),
    ##   factor_title = col_character()
    ## )

``` r
reorder_singer_locations_csv$factor_artist_name <- as.factor(reorder_singer_locations_csv$factor_artist_name)
head(levels(reorder_singer_locations_csv$factor_artist_name))
```

    ## [1] "'t Hof Van Commerce" "'Til Tuesday"        "*Shels"             
    ## [4] "[re:jazz]"           "+44"                 "<U+00C4>I-TIEM"

However, the right output should be below as:

    [1] "Motion City Soundtrack"         "Gene Chandler"                  "Paul Horn"                     
    [4] "Ronnie Earl & the Broadcasters" "Dorothy Ashby"                  "Barleyjuice" 

In this homework, I found very useful link: [Writing and reading files](http://stat545.com/block026_file-out-in.html); [Be the boss of your factors](http://stat545.com/block029_factors.html); [Revisit ggplot](http://stat545.com/cm013_ggplot2-continued.html); [mutiple-plot](http://stat545.com/block020_multiple-plots-on-a-page.html#use-the-multiplot-function) [colors in ggplot2](http://stat545.com/block019_enforce-color-scheme.html)

This time I try to plot more graphs in the meaningful way, and I spent many times on how to use functions in the right ways. I look through the lecture very careful and try different functons in my plot. In addition, I spent a lot of time on the data processing, expecially for dealing with the "NA". In the future, I want to learn more data analysis skill.
