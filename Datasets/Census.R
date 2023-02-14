#US CENSUS DATASET [dplyr practice]

filename <- file.choose()
census <- readRDS(filename)
library(tidyverse)


#Selecting only the following columns
census_pop <- census %>%
  select(state, county , population)


#Arranging in descending order by population, then filtering state to NY.
census_pop %>%
  arrange(desc(population)) %>%
  filter(state == 'New York')


#Filtering by counties in California with populations over 1000000
census_pop %>%
  filter(state == 'California', population > 1000000)


#Counting people per state, then sorting
census_pop %>%
  count(state, wt = population, sort = TRUE)


#Selecting columns
census_gender <- counties %>%
  select(state, county, population, men, women)
#Creating a new column
census_gender %>%
  mutate(proportion_women = women / population)


#Summarizing min, max, average populations of counties
census %>%
  summarize(min_population = min(population), max_population = max(population),
            mean_population = mean(population), median_population = median((population)))


#Grouping counties by state, then summarizing the total area and total population of each state & density
census %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area),
            total_population = sum(population)) %>%
  mutate(density = total_population / total_area) %>%
  arrange(desc(density))


#Grouping by region, and summarizing average population of each region
census %>%
  group_by(region, state) %>%
  summarize(total_pop = sum(population)) %>%
  summarize(average_pop = mean(total_pop), median_pop = median(total_pop))


#Selecting work columns
census %>%
  select(state, county, population, professional, service, office, construction, production) %>%
  arrange(desc(service))


#Selecting the counties with highest fraction of men
census %>%
  transmute(state, county, fraction_men = men / population) %>%
  arrange(desc(fraction_men))


#Finding the counties with over 1000000 people ordered by density
census %>%
  transmute(state, county, population, density = population / land_area) %>%
  filter(population > 1000000) %>%
  arrange(desc(density))
            
