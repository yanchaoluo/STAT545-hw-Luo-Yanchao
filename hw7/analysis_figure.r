library(broom)
library(tidyverse)
## Import the data created in the first script.
reordergapminder <- read.delim("reordergapminder_dataframe.tsv")
gapminder_dataframe <- read.delim("gapminder.tsv")
# Make sure your new continent order is still in force. You decide the details.

#original
gapminder_dataframe %>% 
  group_by(continent) %>% 
  summarize(max_lifeExp=max(lifeExp)) %>% 
  ggplot(aes(x=continent,y=max_lifeExp,size=max_lifeExp)) + 
  geom_point() + 
  labs(title=" original order fpr each continent based on maximum lifeExp") + 
  theme_bw() +
  theme(axis.title = element_text(size=14))

##reorder data
reordergapminder %>% 
  group_by(continent) %>% 
  summarize(max_lifeExp=max(lifeExp)) %>% 
  ggplot(aes(x=continent,y=max_lifeExp,size=max_lifeExp)) + 
  geom_point() + 
  labs(title=" reordered for each continent based on maximum lifeExp") + 
  theme_bw() +
  theme(axis.title = element_text(size=14))

##Fit a linear regression of life expectancy on year within each country.
##Write the estimated intercepts, slopes, and residual error variance (or sd) to file. 
##the R package broom may be useful here.
#Using `nesting` 
(gap_nested <- reordergapminder %>% 
    group_by(continent, country) %>% 
    nest())

fit<- function(data) {
  lm(lifeExp ~ I(year - 1950), data = data)
}


gap_nested <- gap_nested %>% 
    mutate(fit = map(data, fit))
#We have a new list-column fit that is even more intimidating than the previous, data. The fit variable holds 142 fitted linear models.
##tidy(): a tidy version of summary(), e.g. a table with one row per parameter estimate
gap_nested <- gap_nested %>% 
  mutate(tidy = map(fit, tidy))
##Apply tidy() to the model for each country 
coefs <- gap_nested %>% 
  select(continent, country, tidy) %>% 
  unnest(tidy)
coefs <- coefs %>%
  mutate(term = recode(term,
                       `(Intercept)` = "intercept",
                       `I(year - 1950)` = "slope"))
write.table(coefs,"intercepts_slopes_sd.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)

##Find the 3 or 4 “worst” and “best” countries for each continent. You decide the details.
## "worst" countries have larger std.error, "best" countries have smaller std.error.

##For Asia
worst_Asia <-coefs %>%
  filter(continent%in%"Asia") %>% 
  arrange(desc(std.error)) %>% 
  head(4)
knitr::kable(worst_Asia)

best_Asia <-coefs %>%
  filter(continent%in%"Asia") %>% 
  arrange(std.error) %>% 
  head(4)
knitr::kable(best_Asia)
##For America
worst_America <-coefs %>%
  filter(continent%in%"Americas") %>% 
  arrange(desc(std.error)) %>% 
  head(4)
knitr::kable(worst_America)
best_America <-coefs %>%
  filter(continent%in%"Americas") %>% 
  arrange(std.error) %>% 
  head(4)
knitr::kable(best_America)
##For Africa
worst_Africa <-coefs %>%
  filter(continent%in%"Africa") %>% 
  arrange(desc(std.error)) %>% 
  head(4)
knitr::kable(worst_Africa)
best_Africa <-coefs %>%
  filter(continent%in%"Africa") %>% 
  arrange(std.error) %>% 
  head(4)
knitr::kable(best_Africa)
##For Europe
worst_Europe <-coefs %>%
  filter(continent%in%"Europe") %>% 
  arrange(desc(std.error)) %>% 
  head(4)
knitr::kable(worst_Europe)
best_Europe <-coefs %>%
  filter(continent%in%"Europe") %>% 
  arrange(std.error) %>% 
  head(4)
knitr::kable(best_Europe)
## Oceania only have two coutries, so I decide not consider Oceania.

#Generate figures
#Create a figure for each continent, and write one file per continent, with an informative name.
#The figure should give scatterplots of life expectancy vs. year, faceting on country, fitted line overlaid.
##For Asia
plot_worst_Asia<-reordergapminder %>% 
  filter(country %in% worst_Asia$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with large sd 4 countries in Asia")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("worst_Asia.png", plot_worst_Asia)

plot_best_Asia<-reordergapminder %>% 
  filter(country %in% best_Asia$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with small sd 4 countries in Asia")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("best_Asia.png", plot_best_Asia)
##For America
plot_worst_America<-reordergapminder %>% 
  filter(country %in% worst_America$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with large sd 4 countries in America")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("worst_America.png", plot_worst_America)

plot_best_America<-reordergapminder %>% 
  filter(country %in% best_America$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with small sd 4 countries in America")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("best_America.png", plot_best_America)

##For Africa
plot_worst_Africa<-reordergapminder %>% 
  filter(country %in% worst_Africa$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with large sd 4 countries in Africa")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("worst_Africa.png", plot_worst_Africa)

plot_best_Africa<-reordergapminder %>% 
  filter(country %in% best_Africa$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with small sd 4 countries in Africa")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("best_Africa.png", plot_best_Africa)
#For Europe
plot_worst_Europe<-reordergapminder %>% 
  filter(country %in% worst_Europe$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with large sd 4 countries in Europe")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("worst_Europe.png", plot_worst_Europe)

plot_best_Europe<-reordergapminder %>% 
  filter(country %in% best_Europe$country) %>% 
  ggplot(aes(x=year,y=lifeExp)) + 
  geom_point()+
  geom_smooth(method="lm",se=FALSE) +
  facet_wrap(~country) + 
  labs(titile="Compared lifeExp and year  with small sd 4 countries in Europe")+ 
  theme_bw() +
  theme(strip.background = element_rect(fill="green"),
        axis.title = element_text(size=14),
        strip.text = element_text(size=14, face="bold"))
ggsave("best_Europe.png", plot_best_Europe)


