
# STAT547M-hw07-Luo-Yanchao

Hi, Everyone! Welcome to my repo for Homework07.

## Homework07 task

**Big picture**

+ Write (or extract from a previous analysis) three or more R scripts to carry out a small data analysis.

+ The output of the first script must be the input of the second, and so on.

+ Something like this:

    *First script: download some data.*
    
    *Second script: read the data, perform some analysis and write numerical data to file in CSV or TSV format.*
    
    *Third script: read the output of the second script, generate some figures and save them to files.*
    
    *Fourth script: an Rmd, actually, that presents original data, the statistical summaries, and/or the figures in a little report.*
    
    *A fifth script to rule them all, i.e. to run the others in sequence.*
    *You can use Make, Remake or (if you feel the urge for something more) a combinantion of Make and Remake.*
    
[Homework page link: Automating Data-analysis Pipelines](https://stat545.com/hw07_automation.html)

## Report of Process

**how to run hw07**

1.dowload this repo

2.Find the Makefile in hw07

3.Click clean all before build

4.Click build all

![](https://github.com/yanchaoluo/STAT545-hw-Luo-Yanchao/blob/master/hw7/graaph.png?raw=true)

From the image above, which shows a graphical view (the dependency diagram) of my pipeline using makefile2graph. At beginning, I download the data from the website and called [gapminder.tsv](https://github.com/yanchaoluo/STAT545-hw-Luo-Yanchao/blob/master/hw7/gapminder.tsv).

Secondly, I use [Perform_exploratory_analyses.R](https://github.com/yanchaoluo/STAT545-hw-Luo-Yanchao/blob/master/hw7/Perform_exploratory_analyses.R) to do the "Perform exploratory analyses" part; 

Thirdly, using [analysis_figure.r](https://github.com/yanchaoluo/STAT545-hw-Luo-Yanchao/blob/master/hw7/analysis_figure.r) to do the "Perform statistical analyses" part;

Forthly, using [makefile](https://github.com/yanchaoluo/STAT545-hw-Luo-Yanchao/blob/master/hw7/Makefile) to generate the [Hw07_Luo_yanchao_report.html](https://github.com/yanchaoluo/STAT545-hw-Luo-Yanchao/blob/master/hw7/Hw07_Luo_yanchao_report.html) report.(if you don't want to download my repo, you could see [Hw07_Luo_yanchao_report.md](https://github.com/yanchaoluo/STAT545-hw-Luo-Yanchao/blob/master/hw7/Hw07_Luo_yanchao_report.md) document)

This homework is interesting, but I spend many times on how to use `make` to automate my pipeline. I learned a lot from [01_automation-example_just-r](https://github.com/STAT545-UBC/STAT545-UBC.github.io/tree/master/automation10_holding-area/01_automation-example_just-r) example. Another difficult part is "fit a linear regression of life expectancy on year within each country". Then I found the answer in [Split-Apply-Combine](http://stat545.com/block024_group-nest-split-map.html)

Other useful links:

[makefile2graph](https://github.com/lindenb/makefile2graph) for the graph;

[Automating data analysis pipelines](http://stat545.com/automation00_index.html);


















