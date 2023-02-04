# Common dplyr Verbs


Selecting specific columns:
```
counties %>%
	select(state, county, population, unemployment)
 
 ```
 
 Selecting data:
 ```
 counties %>%
	arrange(population)

#or

counties %>%
	arrange(desc(population))
 ```
 
 Filter:
 ```
 counties %>%
	arrange(desc(population)) %>%
	filter(state == 'New York')

	filter(state %in% c('New York', 'California'))
 ```
 
 Changing:
 ```
 counties %>%
	transmute(state, county, fraction_men = men / population
  
 counties %>%
	mutate(unemployed_pop = population * unemployment /100)
 ```
 
 Aggregating:
 ```
 counties %>%
	count(state, wt = population, sort = TRUE)
  
 counties %>%
	group_by(state) %>%
	slice_max(population, n=1)
 ```
 
 Common functions:
 ```
 contains()
starts_with()
ends_with()
last_col()
matches()
```
