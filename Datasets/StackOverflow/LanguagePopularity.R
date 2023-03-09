library(tidyverse)
library(readr)
library(RColorBrewer)

#Importing data
by_tag_year <- read_csv('by_tag_year.csv', show_col_types = FALSE)

#Finding Data as a Fraction
by_tag_year_fraction <- by_tag_year %>%
  mutate(fraction = number / year_total)

#Plotting R Graph
r_tags_over_time <- by_tag_year_fraction %>%
  filter(tag %in% c('r', 'dplyr', 'ggplot2'))

ggplot(r_tags_over_time, aes(year, fraction, color = tag)) +
  geom_line(size = 0.8) +
  labs(title = 'Popularity of R Related Tags',
       x = 'Year',
       y = 'Proportion') +
  theme(legend.key.size = unit(0.8, 'cm'),legend.position = 'bottom')

#Finding Most Popular Tags & R
sorted_tags <- by_tag_year %>%
  group_by(tag) %>%
  summarize(tag_total = sum(number)) %>%
  arrange(desc(tag_total))

highest_tags <- c(head(sorted_tags$tag, 9), 'r')

by_tag_subset <- by_tag_year_fraction %>%
  filter(tag %in% highest_tags)

#Plotting Graph
ggplot(by_tag_subset, aes(year, fraction, color=tag)) +
  geom_line(size = 0.8) +
  labs(title = 'Popularity of Programming Languages',
       x = 'Year',
       y = 'Proportion') +
  theme(legend.key.size = unit(0.5, 'cm'),legend.position = 'bottom') +
  scale_color_brewer(palette="Paired")

#Data for 2018
year2018 <- by_tag_subset %>%
  filter(year == 2018) %>%
  select(tag, fraction) %>%
  arrange(fraction)

ggplot(year2018, aes(fct_reorder(tag, fraction, .desc = TRUE), fraction, fill = 'Navy')) +
  geom_col() +
  theme_classic() +
  theme(legend.position="none") +
  labs(title = 'Popularity of Programming Language in 2018',
       x ='',
       y = 'Proportion')

