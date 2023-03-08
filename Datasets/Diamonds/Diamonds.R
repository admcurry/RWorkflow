library(tidyverse)

load(file = 'diamonds.RData')

ggplot(diamonds, aes(carat, price, color = clarity)) +
  geom_point(alpha=0.5, shape = 16, size=1.7) +
  labs(title = 'Price Against Carat of Diamonds, Coloured by Clarity',
       x = 'Carat',
       y= 'Price in $',
       color='Clarity')
