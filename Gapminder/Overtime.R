#Graph 1 - by year
by_year <- gapminder %>%
group_by(year) %>%
summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_year, aes(x = year, y= medianGdpPercap)) +
geom_line() +
expand_limits(y=0)


#Graph 2 - by year and continent
by_year_continent <- gapminder %>%
group_by(year, continent) %>%
summarize(medianGdpPercap = median(gdpPercap))

ggplot(by_year_continent, aes(x = year, y=medianGdpPercap, color=continent)) +
geom_line() +
expand_limits(y=0)
