library(tidyverse)

load(file = 'fish.RData')

ggplot(fish.tidy, aes(Year, Capture, color = Species)) +
  geom_line(aes(group = Species))


ggplot(fish.tidy, aes(Year, Capture, fill = Species)) +
  geom_area(aes(group = Species))
