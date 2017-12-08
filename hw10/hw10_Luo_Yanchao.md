Hw10\_Luo\_Yanchao
================

Make API queries “by hand�? using httr.
--------------------------------------

*GET() data from the API and convert it into a clean and tidy data frame. Store that as a file ready for (hypothetical!) downstream analysis. Do just enough basic exploration of the resulting data, possibly including some plots, that you and a reader are convinced you successfully downloaded and cleaned it.*

``` r
library(tidyverse)
```

    ## Loading tidyverse: ggplot2
    ## Loading tidyverse: tibble
    ## Loading tidyverse: tidyr
    ## Loading tidyverse: readr
    ## Loading tidyverse: purrr
    ## Loading tidyverse: dplyr

    ## Warning: package 'dplyr' was built under R version 3.4.2

    ## Conflicts with tidy packages ----------------------------------------------

    ## filter(): dplyr, stats
    ## lag():    dplyr, stats

``` r
library(magrittr)
```

    ## 
    ## Attaching package: 'magrittr'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     set_names

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     extract

``` r
library(purrr)
library(glue)
```

    ## 
    ## Attaching package: 'glue'

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     collapse

``` r
library(stringr)
library(purrr)
library(knitr)
library(rvest)
```

    ## Warning: package 'rvest' was built under R version 3.4.2

    ## Loading required package: xml2

    ## Warning: package 'xml2' was built under R version 3.4.2

    ## 
    ## Attaching package: 'rvest'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     pluck

    ## The following object is masked from 'package:readr':
    ## 
    ##     guess_encoding

``` r
library(xml2)
library(httr)
```

    ## Warning: package 'httr' was built under R version 3.4.2

``` r
library(gapminder)
library(geonames)
```

    ## No geonamesUsername set. See http://geonames.wordpress.com/2010/03/16/ddos-part-ii/ and set one with options(geonamesUsername="foo") for some services to work

``` r
library(countrycode)
```

    ## Warning: package 'countrycode' was built under R version 3.4.2

*Write a function to got the general idea about the two movies*

``` r
Find_movies<- function(title,year){
  query_string<- glue("http://www.omdbapi.com/?t={title}&y={year}&apikey=YOURKEY")
  movie_result<- GET(query_string)
  movie_content<- content(movie_result)
  return(movie_content)
}

thor<- Find_movies("thor", "2011")

spider_man<-Find_movies("spider_man", "2002")

thor<-data.frame(thor)
spider_man<- data.frame(spider_man)
```

I found two movies "spider\_man" and "thor", and I make a dataframe in order for further analysis.

``` r
compared_two_movies<-full_join(thor,spider_man) 
```

    ## Joining, by = c("Title", "Year", "Rated", "Released", "Runtime", "Genre", "Director", "Writer", "Actors", "Plot", "Language", "Country", "Awards", "Poster", "Ratings.Source", "Ratings.Value", "Ratings.Source.1", "Ratings.Value.1", "Ratings.Source.2", "Ratings.Value.2", "Metascore", "imdbRating", "imdbVotes", "imdbID", "Type", "DVD", "BoxOffice", "Production", "Website", "Response")

    ## Warning: Column `Title` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Year` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Released` joining factors with different levels, coercing
    ## to character vector

    ## Warning: Column `Runtime` joining factors with different levels, coercing
    ## to character vector

    ## Warning: Column `Genre` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Director` joining factors with different levels, coercing
    ## to character vector

    ## Warning: Column `Writer` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Actors` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Plot` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Awards` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Poster` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `Ratings.Value` joining factors with different levels,
    ## coercing to character vector

    ## Warning: Column `Ratings.Value.1` joining factors with different levels,
    ## coercing to character vector

    ## Warning: Column `Ratings.Value.2` joining factors with different levels,
    ## coercing to character vector

    ## Warning: Column `Metascore` joining factors with different levels, coercing
    ## to character vector

    ## Warning: Column `imdbRating` joining factors with different levels,
    ## coercing to character vector

    ## Warning: Column `imdbVotes` joining factors with different levels, coercing
    ## to character vector

    ## Warning: Column `imdbID` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `DVD` joining factors with different levels, coercing to
    ## character vector

    ## Warning: Column `BoxOffice` joining factors with different levels, coercing
    ## to character vector

    ## Warning: Column `Production` joining factors with different levels,
    ## coercing to character vector

    ## Warning: Column `Website` joining factors with different levels, coercing
    ## to character vector

``` r
 knitr::kable(compared_two_movies)
```

| Title      | Year | Rated | Released    | Runtime | Genre                      | Director        | Writer                                                                                                                                                                                                            | Actors                                                            | Plot                                                                                                                                                                                                               | Language | Country | Awards                                                    | Poster                                                                                                                                            | Ratings.Source          | Ratings.Value | Ratings.Source.1 | Ratings.Value.1 | Ratings.Source.2 | Ratings.Value.2 | Metascore | imdbRating | imdbVotes | imdbID    | Type  | DVD         | BoxOffice    | Production         | Website                              | Response |
|:-----------|:-----|:------|:------------|:--------|:---------------------------|:----------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:---------|:--------|:----------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------|:--------------|:-----------------|:----------------|:-----------------|:----------------|:----------|:-----------|:----------|:----------|:------|:------------|:-------------|:-------------------|:-------------------------------------|:---------|
| Thor       | 2011 | PG-13 | 06 May 2011 | 115 min | Action, Adventure, Fantasy | Kenneth Branagh | Ashley Miller (screenplay), Zack Stentz (screenplay), Don Payne (screenplay), J. Michael Straczynski (story), Mark Protosevich (story), Stan Lee (comic book), Larry Lieber (comic book), Jack Kirby (comic book) | Chris Hemsworth, Natalie Portman, Tom Hiddleston, Anthony Hopkins | The powerful, but arrogant god Thor, is cast out of Asgard to live amongst humans in Midgard (Earth), where he soon becomes one of their finest defenders.                                                         | English  | USA     | 5 wins & 30 nominations.                                  | <https://images-na.ssl-images-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_SX300.jpg> | Internet Movie Database | 7.0/10        | Rotten Tomatoes  | 77%             | Metacritic       | 57/100          | 57        | 7.0        | 595,062   | tt0800369 | movie | 13 Sep 2011 | $181,015,141 | Paramount Pictures | <http://thor.marvel.com/>            | True     |
| Spider-Man | 2002 | PG-13 | 03 May 2002 | 121 min | Action, Adventure          | Sam Raimi       | Stan Lee (Marvel comic book), Steve Ditko (Marvel comic book), David Koepp (screenplay)                                                                                                                           | Tobey Maguire, Willem Dafoe, Kirsten Dunst, James Franco          | When bitten by a genetically modified spider, a nerdy, shy, and awkward high school student gains spider-like abilities that he eventually must use to fight evil as a superhero after tragedy befalls his family. | English  | USA     | Nominated for 2 Oscars. Another 15 wins & 58 nominations. | <https://images-na.ssl-images-amazon.com/images/M/MV5BZDEyN2NhMjgtMjdhNi00MmNlLWE5YTgtZGE4MzNjMTRlMGEwXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_SX300.jpg> | Internet Movie Database | 7.3/10        | Rotten Tomatoes  | 89%             | Metacritic       | 73/100          | 73        | 7.3        | 589,948   | tt0145487 | movie | 01 Nov 2002 | $403,706,375 | Columbia Pictures  | <http://spiderman.sonypictures.com/> | True     |

There are many information in this table, using stat545 method to subset the data.

``` r
subset<-compared_two_movies %>% 
  select(Title, Year, Country, Awards, Ratings.Value) 
 knitr::kable(subset)
```

| Title      | Year | Country | Awards                                                    | Ratings.Value |
|:-----------|:-----|:--------|:----------------------------------------------------------|:--------------|
| Thor       | 2011 | USA     | 5 wins & 30 nominations.                                  | 7.0/10        |
| Spider-Man | 2002 | USA     | Nominated for 2 Oscars. Another 15 wins & 58 nominations. | 7.3/10        |

``` r
subset %>% 
  ggplot(aes(Title,Ratings.Value))+
  geom_point(aes(color=Title))+
  theme_bw() +
  theme(axis.title.x = element_text(size=11),
        axis.title.y = element_text(size=11))
```

![](hw10_Luo_Yanchao_files/figure-markdown_github/unnamed-chunk-5-1.png)

Scrape data
-----------

*Work through the final set of slides from the rOpenSci UseR! 2016 workshop. This will give you basic orientation, skills, and pointers on the rvest package.* *Scrape a multi-record dataset off the web! Convert it into a clean and tidy data frame. Store that as a file ready for (hypothetical!) downstream analysis. Do just enough basic* *exploration of the resulting data, possibly including some plots, that you and a reader are convinced you鈥檝e successfully downloaded and cleaned it.*

We get a list of those title:

``` r
url_titles <- "http://www.imdb.com/title/tt0145487/?ref_=nv_sr_3"

spider <- read_html(url_titles)
```

``` r
initial <- html_nodes(spider, "em")
html_text(initial)
```

    ## [1] "Written by\nSoumitra"

get the cast name for the movie.

``` r
name <- html_nodes(spider, "#titleCast span.itemprop")
html_text(name) 
```

    ##  [1] "Tobey Maguire"    "Willem Dafoe"     "Kirsten Dunst"   
    ##  [4] "James Franco"     "Cliff Robertson"  "Rosemary Harris" 
    ##  [7] "J.K. Simmons"     "Joe Manganiello"  "Gerry Becker"    
    ## [10] "Bill Nunn"        "Jack Betts"       "Stanley Anderson"
    ## [13] "Ron Perkins"      "Michael Papajohn" "K.K. Dodds"

``` r
 html_nodes(spider, ".ratingValue span") %>%
  html_text()%>%
  paste0(collapse = '')
```

    ## [1] "7.3/10"

Right now we got the rate for the spider\_man.

Using the same way to find the thor information

We get a list of those title:

``` r
url_titles <- "http://www.imdb.com/title/tt0800369/?ref_=nv_sr_2"

thornew <- read_html(url_titles)
```

``` r
initial <- html_nodes(thornew, "em")
html_text(initial)
```

    ## [1] "Written by\nAnonymous"

We get the cast name for the movie.

``` r
name <- html_nodes(thornew, "#titleCast span.itemprop")
html_text(name) 
```

    ##  [1] "Chris Hemsworth"   "Natalie Portman"   "Tom Hiddleston"   
    ##  [4] "Anthony Hopkins"   "Stellan Skarsg<U+00E5>rd" "Kat Dennings"     
    ##  [7] "Clark Gregg"       "Colm Feore"        "Idris Elba"       
    ## [10] "Ray Stevenson"     "Tadanobu Asano"    "Josh Dallas"      
    ## [13] "Jaimie Alexander"  "Rene Russo"        "Adriana Barraza"

``` r
 html_nodes(thornew, ".ratingValue span") %>%
  html_text()%>%
  paste0(collapse = '')
```

    ## [1] "7.0/10"

From above, we got the same result as making API queries “by hand�? using httr.

``` r
url_titles2 <- "http://www.imdb.com/chart/top?ref_=nv_mv_250_6"
```

Got the title.

``` r
top_movies<- read_html(url_titles2)
main <- top_movies %>% 
  html_nodes(".titleColumn") %>% 
  html_text(trim = TRUE)
```

Got the rating

``` r
movies_rating <- html_nodes(top_movies,".ratingColumn.imdbRating") %>% 
  html_text(trim = TRUE)
movies_rating<-as.numeric(movies_rating)
```

Using `gsub` function replaces all matches of a string.

``` r
year1 <- gsub("^.*\\(", "", main)
year2 <- gsub(".{1}$", "", year1)
year<- as.numeric(year2)
```

``` r
dataset<- data.frame(year, movies_rating)
```

``` r
dataset %>% 
  ggplot(aes(year,movies_rating))+
    geom_point(color=year)+
  theme_bw()+
  theme(axis.title.x = element_text(size=15),
        axis.title.y = element_text(size=15))
```

![](hw10_Luo_Yanchao_files/figure-markdown_github/unnamed-chunk-19-1.png)

Use an R package that wraps an API
----------------------------------

*Prompt 1*

``` r
options(geonamesUsername = "your_name")
addInforation <- GNcountryInfo() %>%
    mutate(country = as.factor(
        countrycode(isoAlpha3, 'iso3c',  'country.name'))) 
```

    ## Warning in countrycode(isoAlpha3, "iso3c", "country.name"): Some values were not matched unambiguously: XKX

``` r
combine <- left_join(gapminder, addInforation, by = "country") %>%
    select(-c(countryName,continentName,continent.y))
```

    ## Warning: Column `country` joining factors with different levels, coercing
    ## to character vector

``` r
 combine %>%
    head(5) %>%
    knitr::kable()
```

| country     | continent.x |  year|  lifeExp|       pop|  gdpPercap| capital | languages         | geonameId | south     | isoAlpha3 | north     | fipsCode | population | east      | isoNumeric | areaInSqKm | countryCode | west      | currencyCode |
|:------------|:------------|-----:|--------:|---------:|----------:|:--------|:------------------|:----------|:----------|:----------|:----------|:---------|:-----------|:----------|:-----------|:-----------|:------------|:----------|:-------------|
| Afghanistan | Asia        |  1952|   28.801|   8425333|   779.4453| Kabul   | fa-AF,ps,uz-AF,tk | 1149361   | 29.377472 | AFG       | 38.483418 | AF       | 29121286   | 74.879448 | 004        | 647500.0   | AF          | 60.478443 | AFN          |
| Afghanistan | Asia        |  1957|   30.332|   9240934|   820.8530| Kabul   | fa-AF,ps,uz-AF,tk | 1149361   | 29.377472 | AFG       | 38.483418 | AF       | 29121286   | 74.879448 | 004        | 647500.0   | AF          | 60.478443 | AFN          |
| Afghanistan | Asia        |  1962|   31.997|  10267083|   853.1007| Kabul   | fa-AF,ps,uz-AF,tk | 1149361   | 29.377472 | AFG       | 38.483418 | AF       | 29121286   | 74.879448 | 004        | 647500.0   | AF          | 60.478443 | AFN          |
| Afghanistan | Asia        |  1967|   34.020|  11537966|   836.1971| Kabul   | fa-AF,ps,uz-AF,tk | 1149361   | 29.377472 | AFG       | 38.483418 | AF       | 29121286   | 74.879448 | 004        | 647500.0   | AF          | 60.478443 | AFN          |
| Afghanistan | Asia        |  1972|   36.088|  13079460|   739.9811| Kabul   | fa-AF,ps,uz-AF,tk | 1149361   | 29.377472 | AFG       | 38.483418 | AF       | 29121286   | 74.879448 | 004        | 647500.0   | AF          | 60.478443 | AFN          |

*Consider the following graph of population against time *

``` r
combine %>%
    filter(continent.x!= "Oceania") %>%
    ggplot(aes(x = year, y = pop, 
                         group = country, 
                         color = country)) +
  geom_line(lwd = 1, show.legend = FALSE) + 
    facet_wrap(~ continent.x) +
  scale_color_manual(values = country_colors) + 
    theme_bw() +
  theme(strip.text = element_text(size = rel(1.1))) + 
    scale_y_log10() 
```

![](hw10_Luo_Yanchao_files/figure-markdown_github/unnamed-chunk-21-1.png)
