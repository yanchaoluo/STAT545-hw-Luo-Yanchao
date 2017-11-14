
library(ggplot2)
library(dplyr)
library(forcats)

##Bring the data in as data frame.

gapminder_dataframe <- read.delim("gapminder.tsv")
str(gapminder_dataframe) 

##Save a couple descriptive plots to file with highly informative names.
### plot1
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

## plot 2: Scatterplot of `year` and `lifeExp`, only consider three countries: France, Canada, China 
France_Canada_China<- gapminder_dataframe %>% 
    filter(country%in%c("France", "Canada", "China")) %>% 
    select(country,continent,year,lifeExp) %>% 
   ggplot( aes(x = year, y = lifeExp, color = country))+ 
  geom_point()+
  geom_line(aes(group = country))+theme_bw()+
  labs(title="Scatterplot of `year` and `lifeExp`, only consider three countries: France, Canada, China ")+
  theme(axis.title = element_text(size=14))
ggsave("France_Canada_China_lifeExp.png", width=12, height=8, plot=France_Canada_China)
##plot3
##In general, lifeExp for different continents was increasing from 1950 to 2007.
##Asia life expectancy rise sharply and Africa life expectancy rise smoothly.
life_differentcountry<-ggplot(gapminder_dataframe, aes(x=year, y=lifeExp,color = continent)) +
  geom_jitter(alpha = 1/3, size = 3) +
  facet_wrap(~ continent) +
  geom_smooth(method="lm", span =0.1, color= "red")+
  theme_bw() +
  theme(strip.background = element_rect(fill="orange"),
        axis.title = element_text(size=12),
        strip.text = element_text(size=12, face="bold"))
ggsave("lifeExp for different continents .png", width=12, height=8, plot=life_differentcountry)
#Reorder the continents based on maximum life expectancy. You decide the details.
Reorder_gapminder <- gapminder_dataframe %>%
  group_by(continent) %>%
  summarize(max_lifeExp=max(lifeExp)) %>% 
  mutate(continent=fct_reorder(continent,max_lifeExp)) %>%
  ggplot(aes(y=max_lifeExp,x=continent,color=max_lifeExp)) + 
  geom_point() + 
  labs(title="maximum lifeExp reordered for different continent") + 
  theme_bw() +
  theme(axis.title = element_text(size=12))
ggsave("Reorder_gapminder_lifeExp.png", width=12, height=8, plot=Reorder_gapminder)

### use max(lifeExp) to fct_reorder (gapminder$continent)
reordergapminder_dataframe <- gapminder_dataframe %>%
  mutate(continent= fct_reorder(continent, lifeExp, max, .desc = TRUE)) 

###compared the plots after and before reordering continent by maximum lifeExp

gapminder_dataframe %>% 
  group_by(continent) %>% 
  summarize(max_lifeExp=max(lifeExp)) %>% 
  ggplot(aes(x=continent,y=max_lifeExp,size=max_lifeExp)) + 
  geom_point() + 
  labs(title=" original order fpr each continent based on maximum lifeExp") + 
  theme_bw() +
  theme(axis.title = element_text(size=14))

reordergapminder_dataframe %>% 
  group_by(continent) %>% 
  summarize(max_lifeExp=max(lifeExp)) %>% 
  ggplot(aes(x=continent,y=max_lifeExp,size=max_lifeExp)) + 
    geom_point() + 
  labs(title=" reordered for each continent based on maximum lifeExp") + 
  theme_bw() +
  theme(axis.title = element_text(size=14))

#Write the Gapminder data to file(s), for immediate and future reuse.
write.table(reordergapminder_dataframe, "reordergapminder_dataframe.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)



