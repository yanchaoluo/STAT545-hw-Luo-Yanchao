# STAT547M-hw09-Luo_Yanchao

Welcome to  Homework09.

[Homework 09 requirement page](http://stat545.com/hw09_package.html)

### [foofactors package](https://github.com/yanchaoluo/foofactors)

## Your mission
*In this homework you will either continue developing the powers package developed in class or Jenny’s  foofactors package; or create your own package. If you do the latter, you must hit all the same points but you’ll be starting from scratch.*

Aim for the following elements:

+ Define and export at least one new function, i.e. make it available to a user. We’d prefer more than one. Feel free to improve (or delete) the functions we already have. :heavy_check_mark:

+ Give function arguments sensible defaults, where relevant. :heavy_check_mark:

+ Use assertions to add some validity checks of function input. :heavy_check_mark:

+ Document all exported functions. :heavy_check_mark:

+ Include at least three unit tests for every function that is exported. :heavy_check_mark:

      -There should be at least one expectation for success and one for failure.
   
+ Your package should pass check() without errors (warnings and notes are OK, though it would be great if there were none). :heavy_check_mark:

+ Keep updating the README and vignette to show usage of all the functions in the package. Your peer reviewers and TA will only have the README and vignette to go on when they try to use your package. Show them exactly what they can do! Remove boilerplate content from the vignette. :heavy_check_mark:

+ Push your package to GitHub, preferably a public repo. If you are uncomfortable with that, please contact an instructor and we’ll work around that. :heavy_check_mark:

+ Write your reflections in a document in your normal STAT 545/547 course repo and open the usual issue there. Make sure to provide a link to your package, so TAs/prof/peers can find it for review! :heavy_check_mark:

## Ideas for more foofactor functions to write:

+ detect factors that should be character because # unique values = length :heavy_check_mark:
+ write a version of reorder() that uses desc() in `dplyr` :heavy_check_mark:
+ write a version of factor() that sets levels to the order in which they appear in the data, i.e. set the levels “as is” :heavy_check_mark:
+ functions to write and read data frames to plain text delimited files while retaining factor levels; maybe by writing/reading a companion file?

## Reprot of my process

I added some new functions for the package "foofactor".

In this assignment, I did `foofactors` and the `foofactors` package has five functions:

-   `fbind`: Create a new factor from two existing factors, where the new factor's levels are the union of the levels of the input factors.

-   `freq_out`: Make a frequency table for a factor.

-   `order_appeared`: Set levels of a factor to the order appeared in data.

-   `reorder_new`: Reorder levels in descending order.

-   `detect_factor_be_character`: Detect factors be character or not.

There is no errors, warnings, notes in my R CMD check results, but I found one warning in the Status:
```
checking for unstated dependencies in examples.
```

I double checked my package, I added `dplyr::` before `data_frame(x)` and `stats::` before `reorder`, but still can not correct this error.

In this homework, I spent much time on adding sensible defaults. However, I found my functions in R file only have one input. So it is tough for me to add relevant defaults.

If you download my R package, you could type `browseVignettes("foofactors")` in the console to see my Rmd in vignettes file.

I used this link to solve one note problem. [Solve notes problem](https://stackoverflow.com/questions/15648772/how-do-i-prevent-r-library-or-require-calls-not-declared-warnings-when-dev)

## Links 

+ [foofactors-package](http://stat545.com/packages06_foofactors-package.html)

+ [cm109-110 notes_and_exercises](http://stat545.com/cm109-110-notes_and_exercises.html)


