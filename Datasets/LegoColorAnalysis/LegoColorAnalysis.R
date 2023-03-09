#Lego Color Analysis
#https://rpubs.com/adamcurry/lego

library(tidyverse)
sets <- readRDS('sets.rds')
themes <- readRDS('themes.rds')
inventories <- readRDS('inventories.rds')
inventory_parts <- readRDS('inventory_parts.rds')

#Joining tables, selecting columns
inventory_parts_themes <- inventories %>%
  inner_join(inventory_parts, by = c("id" = "inventory_id")) %>%
  arrange(desc(quantity)) %>%
  select(-id, -version) %>%
  inner_join(sets, by = "set_num") %>%
  inner_join(themes, by = c("theme_id" = "id"), suffix = c("_set", "_theme"))

#Filter & aggregating - Batman
batman_colors <- inventory_parts_themes %>%
  filter(name_theme == "Batman") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  mutate(fraction = total / sum(total))

#Filter & aggregating - Star Wars
star_wars_colors <- inventory_parts_themes %>%
  filter(name_theme == "Star Wars") %>%
  group_by(color_id) %>%
  summarize(total = sum(quantity)) %>%
  mutate(fraction = total / sum(total))

#Joining above tables
colors_joined <- batman_colors %>%
  full_join(star_wars_colors, by = "color_id", suffix = c("_batman", "_star_wars")) %>%
  replace_na(list(total_batman = 0, total_star_wars = 0)) %>%
  inner_join(colors, by = c("color_id" = "id")) %>%
  mutate(difference = fraction_batman - fraction_star_wars,
         total = total_batman + total_star_wars) %>%
  filter(total >= 200) %>%
  mutate(name = fct_reorder(name, difference)) 

#Colors for plot
color_palette =   c("#86939c","#FFFFFF","#E4CD9E","#A0BCAC",
"#bababa","#a1032d","#898788","#958A73","#0055BF","#A0A5A9",
"#582A12","#d9bd07","#610e09","#b8180d","#F2CD37", "#05131D" )


#Plot
dev.new(width=11,height=6,noRStudioGD = TRUE)

ggplot(colors_joined, aes(x=name, y=difference, fill = name)) +
  geom_col() +
  coord_flip() +
  scale_fill_manual(values = color_palette, guide = "none") +
  ggtitle("Batman - Star Wars Color Comparison") +
  labs(y = "Color Difference", x = "Color")
 
