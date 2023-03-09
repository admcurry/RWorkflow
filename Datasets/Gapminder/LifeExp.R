library(tidyverse)
library(readr)
library(RColorBrewer)

gapminder <- read.delim("gapminder.tsv", sep="\t")

highest <- gapminder %>%
  filter(year == 2007) %>%
  select(country, lifeExp) %>%
  arrange(desc(lifeExp)) %>%
  filter(lifeExp > 80.6)

lowest <- gapminder %>%
  filter(year == 2007) %>%
  select(country, lifeExp) %>%
  arrange(desc(lifeExp)) %>%
  filter(lifeExp < 46)

countries <- highest %>%
  bind_rows(lowest)

global_mean <- gapminder %>%
  filter(year == 2007) %>%
  summarise(global_mean = mean(lifeExp))


palette <- brewer.pal(5, "RdYlBu")[-(2:4)]                      

ggplot(countries , aes(x = lifeExp, y = fct_reorder(country, lifeExp), color = lifeExp)) +
  geom_point(size = 4) +
  geom_segment(aes(xend = 30, yend = country), size = 2) +
  geom_text(aes(label = round(lifeExp,1)), color = "white", size = 1.5) +
  scale_x_continuous("", expand = c(0,0), limits = c(30,85), position = "top") +
  scale_color_gradientn(colors = palette) +
  labs(title='Highest and lowest life expectancies, 2007', caption = 'Source: gapminder') +
  theme_classic()  +
  theme(axis.line.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text = element_text(color='black'),
        axis.title = element_blank(),
        legend.position = 'none') + 
  geom_vline(xintercept = 67, color = "grey40", linetype = 3) +
  annotate(
    "text",
    x = 67 + 4, y = 5.5,
    label = "The\nglobal\naverage",
    vjust = 1, size = 3, color = "grey40"
  ) +
  annotate(
    "curve",
    x = 67 + 4, y = 5.5,
    xend = 67, yend = 7.5,
    arrow = arrow(length = unit(0.2, "cm"), type = "closed"),
    color = "grey40"
  )
ggsave('lifeexp.png', width = 3000, height = 1500, units = 'px')
