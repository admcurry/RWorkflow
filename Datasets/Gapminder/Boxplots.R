#Plot 1- Boxplot of countries by gdp per capita

gapminder_1952 <- gapminder %>%
  filter(year == 1952)
 
 ggplot(gapminder_1952, aes(x=continent, y=gdpPercap)) +
geom_boxplot() +
scale_y_log10()
