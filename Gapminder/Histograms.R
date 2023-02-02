#Plot 1 - Histogram showing distribution of countries' population

gapminder_1952 <- gapminder %>%
  filter(year == 1952) %>%
  mutate(pop_by_mil = pop / 1000000)
  
  ggplot(gapminder_1952, aes(x=pop_by_mil)) +
geom_histogram(bins=50)


#Plot 2 - Same as above but with a log scale
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(x=pop)) +
geom_histogram() +
scale_x_log10()

