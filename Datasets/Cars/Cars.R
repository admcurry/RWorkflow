library(tidyverse)
library(ggpubr)

cars <- read.csv('mtcars.csv')

ggplot(cars, aes(wt, mpg, color = fcyl)) +
  geom_point(color='red',
             position = 'jitter',
             alpha=0.4) +
  geom_text(label = rownames(mtcars), 
            color = 'black', 
            size=2,)

a <- ggplot(cars, aes(wt, hp)) +
  geom_point() +
  geom_smooth(method = 'lm', se = TRUE) +
  labs(title = 'Car Horsepower vs Weight',
       x = 'Weight of Car',
       y = 'Horsepower') +
  theme_classic()

b <- ggplot(cars, aes(mpg, hp)) +
  geom_point() +
  geom_smooth(method = 'lm', se = TRUE) +
  labs(title = 'Car Horsepower vs mpg',
       y = 'Horsepower') +
  theme_classic()

ggarrange(a, b,
          labels = c("i", "ii"),
          ncol = 2, nrow = 1)
