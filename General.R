#To load a package;
library(tidyverse)
library(gapminder)

#To import data;
filename <- file.choose()
census <- readRDS(filename)
