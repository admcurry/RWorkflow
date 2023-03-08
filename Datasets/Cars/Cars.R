library(tidyverse)
library(ggpubr)

cars <- read.csv('mtcars.csv')

dev.new(width=11,height=6,noRStudioGD = TRUE)
ggplot(cars, aes(wt, mpg, color = fcyl)) +
  geom_point(color='red',
             position = 'jitter',
             alpha=0.4) +
  geom_text(label = rownames(mtcars), 
            color = 'black', 
            size=2,)

a <- ggplot(cars, aes(wt, hp)) +
  geom_point() +
  geom_smooth(method = 'lm', se = TRUE)

b <- ggplot(cars, aes(mpg, hp)) +
  geom_point() +
  geom_smooth(method = 'lm', se = TRUE)

dev.new(width=11,height=6,noRStudioGD = TRUE)
ggarrange(a, b,
          labels = c("A", "B"),
          ncol = 2, nrow = 1)
