# Stack Overflow

### Graphs:


### Links to Rpubs:
https://rpubs.com/adamcurry/SO  
https://rpubs.com/adamcurry/SO2

### Code:

```
library(tidyverse)
library(lubridate)

questions <- readRDS('questions.rds')
tags <- readRDS('tags.rds')
question_tags <- readRDS('question_tags.rds')
answers <- readRDS('answers.rds')

#Questions :an ID and the score, or how many times the question has been upvoted;
#the data only includes R-based questions

#Tags: a tag id and the tag's name, which can be used to identify the subject of
#each question, such as ggplot2 or dplyr

#QuestioncTags: a tag ID for each question and the question's id

#Joining tables
question_data <- questions %>%
  left_join(question_tags, by = c("id" = "question_id")) %>%
  left_join(tags, by = c("tag_id" = "id")) %>%
  replace_na(list(tag_name='only-r'))

#Grouping Data and Arranging
question_data %>% 
  group_by(tag_name) %>%
  summarize(score = mean(score),
            num_questions = n()) %>%
  arrange(desc(num_questions))

#Data manipulation
answer_counts <- answers %>%
  count(question_id) %>%
  arrange(desc(n))

question_answer_counts <- questions %>%
  left_join(answer_counts, by = c('id' = 'question_id')) %>%
  replace_na(list(n=0))

tagged_answers <- question_answer_counts %>%
  inner_join(question_tags, by = c('id' = 'question_id')) %>%
  inner_join(tags, by = c('tag_id' = 'id'))


tagged_answers %>%
  # Aggregate by tag_name
  group_by(tag_name)  %>%
  # Summarize questions and average_answers
  summarize(questions = n(),
            average_answers = mean(n)) %>%
  # Sort the questions in descending order
  arrange(desc(questions))  


# Inner join the question_tags and tags tables with the questions table
questions_with_tags <- questions %>%
  inner_join(question_tags, by = c('id' = 'question_id')) %>%
  inner_join(tags, by = c('tag_id' = 'id'))

# Inner join the question_tags and tags tables with the answers table
answers_with_tags <- answers %>%
  inner_join(question_tags, by = c('question_id' = 'question_id')) %>%
  inner_join(tags, by = c('tag_id' = 'id'))


posts_with_tags <- bind_rows(questions_with_tags %>% mutate(type = "question"),
                             answers_with_tags %>% mutate(type = "answer"))

by_year <- posts_with_tags %>%
  mutate(year = year(creation_date)) %>%
  count(type, year, tag_name)


by_year_filtered <- by_year %>%
  filter(tag_name %in% c('dplyr','ggplot2'))

# Line plot faceted by the tag name 
dev.new(width=11,height=6,noRStudioGD = TRUE)
ggplot(by_year_filtered, aes(year,  n, color = type)) +
  geom_line() +
  facet_wrap(~ tag_name) +
  ggtitle('Popularity of Stack Overflow Tags Over Time') +
  labs(x='Year', y='Number of Posts with tag')


by_year_filtered_extend <- by_year %>%
  filter(tag_name %in% c('dplyr', 'ggplot2', 'dataframe', 'shiny', 'data.table',
                         'plot', 'regex', 'matrix', 'for-loop'))


# Another line plot faceted by the tag name 
dev.new(width=11,height=6,noRStudioGD = TRUE)
ggplot(by_year_filtered_extend, aes(year,  n, color = type)) +
  geom_line() +
  facet_wrap(~ tag_name) +
  ggtitle('Popularity of Stack Overflow Tags Over Time') +
  labs(x='Year', y='Number of Posts with tag')
```
