
# STAT547M-hw08-Luo_Yanchao

Hi, Everyone! Welcome to  Homework08.

[Homework 08](http://stat545.com/hw08_shiny.html)

### What you need to do

**Build a new Shiny app**

*The app we developed is functional, but there are plenty of improvements that can be made. You can compare the app we developed to Dean’s version of this app to get an idea of what a more functional app could include. For the homework, you need to either develop a new Shiny app, using your preferred dataset (or one you want to know more about). If you are short on ideas, you can instead add 3 or more features to the BC Liquor Store app we developed together.*

**Possible features for the BC Liquor Store app.**

+ Add an option to sort the results table by price. :heavy_check_mark:

+ Add an image of the BC Liquor Store to the UI.  :heavy_check_mark:

+ Use the DT package to turn the current results table into an interactive table.  :heavy_check_mark:

+ Add parameters to the plot. use `shinyjs::colourInput()`. :heavy_check_mark:

+ The app currently behaves strangely when the user selects filters that return 0 results. For example, try searching for wines from Belgium. There will be an empty plot and empty table generated, and there will be a warning message in the R console. Try to figure out why this warning message is appearing, and how to fix it. :heavy_check_mark:

+ Place the plot and the table in separate tabs. Use `tabsetPanel()` to create an interface with multiple tabs. :heavy_check_mark:

+ Experiment with packages that add extra features to Shiny. :heavy_check_mark:
Using `shinyjs` to add one survey and time table.

+ Show the number of results found whenever the filters change. For example, when searching for Italian wines $20-$40, the app would show the text “We found 122 options for you”.
Add a textOutput() to the UI, and in its corresponding renderText() use the number of rows in the filtered() object. :heavy_check_mark:

+ Allow the user to download the results table as a ..csv file. :heavy_check_mark:

+ Allow the user to search for multiple alcohol types simultaneously, instead of being able to choose only wines/beers/etc. :heavy_check_mark:

+ Provide a way for the user to show results from all countries (instead of forcing a filter by only one specific country). :heavy_check_mark:

+ Add an input for “subtype” that will let the user filter for only a specific subtype of products. :heavy_check_mark:

### Report of my process

Here is the [homework link]() on shinyapps.io.

### Related link:

https://deanattali.com/2015/04/23/shinyjs-r-package/

https://shiny.rstudio.com/reference/shiny/latest/tabPanel.html

https://shiny.rstudio.com/reference/shiny/1.0.3/downloadHandler.html

http://shiny.rstudio.com/images/shiny-cheatsheet.pdf

https://daattali.com/shiny/bcl/