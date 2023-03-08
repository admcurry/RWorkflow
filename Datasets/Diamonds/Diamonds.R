library(tidyverse)

load(file = 'diamonds.RData')

ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point(alpha=0.5, shape = 16)
