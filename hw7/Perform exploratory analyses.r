
library(ggplot2)
library(dplyr)
library(forcats)

##Bring the data in as data frame.

gapminder_dataframe <- read.delim("gapminder.tsv")
str(gapminder_dataframe) 

##Save a couple descriptive plots to file with highly informative names.
asia_vs_europe_lifeExp_gdp<-gapminder_dataframe %>% 
  filter(continent== c("Asia","Europe")) %>% 
  select(continent,year,lifeExp,gdpPercap) %>% 
  rename(life_exp = lifeExp,
         gdp_percap = gdpPercap) 
Scatterplot1<-ggplot(asia_vs_europe_lifeExp_gdp, aes(x = gdp_percap, y = life_exp))+ 
   geom_point(aes(color=continent,size=year), alpha = 0.5)+
   scale_x_log10()+
   theme_bw()+
   labs(title="Compared 'Asia' and 'Europe' for different continents")+
   theme(axis.title = element_text(size=14))
  ggsave("asia_vs_europe_lifeExp_gdp.png", width=12, height=8, plot=Scatterplot1)

## Scatterplot 2: Scatterplot of `year` and `lifeExp`, only consider three countries: France, Canada, China 
France_Canada_China<- gapminder %>% 
    filter(country%in%c("France", "Canada", "China")) %>% 
    select(country,continent,year,lifeExp) %>% 
   ggplot( aes(x = year, y = lifeExp, color = country))+ 
  geom_point()+
  geom_line(aes(group = country))+theme_bw()+
  labs(title="Scatterplot of `year` and `lifeExp`, only consider three countries: France, Canada, China ")+
  theme(axis.title = element_text(size=14))
ggsave("France_Canada_China_lifeExp.png", width=12, height=8, plot=France_Canada_China)

#Reorder the continents based on life expectancy. You decide the details.

### check current factor and factor levels of `gapminder$continent`
nlevels(gapminder_dataframe$continent)
### use max(lifeExp) for fct_reorder(gapminder$continent)
reordered_continent <- fct_reorder(gapminder_dataframe$continent, gapminder_dataframe$lifeExp, max, .desc = TRUE)
#Sort the actual data in a deliberate fashion. You decide the details, but this should at least implement your new continent ordering.

#Write the Gapminder data to file(s), for immediate and future reuse.
write.table(gapminder_dataframe, "lotr_clean.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)

