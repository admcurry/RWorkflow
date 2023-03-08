library(tidyverse)

load(file = 'fish.RData')

ggplot(fish.tidy, aes(Year, Capture, color = Species)) +
  geom_line(aes(group = Species))


ggplot(fish.tidy, aes(Year, Capture, fill = Species)) +
  geom_area(aes(group = Species), alpha=0.85) +
  labs(title = 'Amount of Species of Salmon Captured Over Time',
       y = 'Number Captured') +
  theme_classic() +
  theme(legend.key.size = unit(0.5, 'cm'),legend.position = 'bottom')
