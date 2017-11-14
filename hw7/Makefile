all: Hw07_Luo_yanchao_report.html
clean:
	rm -f *.tsv *.png 0 *.html


gapminder.tsv:
	Rscript -e 'download.file("https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv", destfile="gapminder.tsv")'
	
reordergapminder_dataframe.tsv asia_vs_europe_lifeExp_gdp.png France_Canada_China_lifeExp.png Reorder_gapminder_lifeExp.png Perform_exploratory_analyses.html: Perform_exploratory_analyses.R gapminder.tsv
	Rscript -e "rmarkdown::render('Perform_exploratory_analyses.R')"
	rm Rplots.pdf
	
intercepts_slopes_sd.tsv: reordergapminder_dataframe.tsv analysis_figure.r
	Rscript analysis_figure.r
	
Hw07_Luo_yanchao_report.html: Hw07_Luo_yanchao_report.Rmd gapminder.tsv reordergapminder_dataframe.tsv intercepts_slopes_sd.tsv
	Rscript -e "rmarkdown::render('Hw07_Luo_yanchao_report.Rmd')"