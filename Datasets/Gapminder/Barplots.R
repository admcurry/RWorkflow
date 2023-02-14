#Plot 1 - The median gdp per capita of the continents in 1952
by_continent <- gapminder %>%
filter(year == 1952) %>%
group_by(continent) %>%
summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_continent, aes(x=continent, y=medianGdpPercap)) +
geom_col()

#Plot 2 - The gdp per capita of the two Oceania countries in 1952
oceania_1952 <- gapminder %>%
filter(year == 1952, continent == 'Oceania') 

ggplot(oceania_1952, aes(x=country, y=gdpPercap)) +
geom_col()
