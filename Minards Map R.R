library(tidyverse)
library(lubridate)
library(ggmap)
library(ggrepel)
library(gridExtra)
library(pander)
install.packages("ggplot2")
library(ggplot2)

cities <- read.table("C:/Users/ayush/Desktop/input/minard/cities.txt",
                     header = TRUE, stringsAsFactors = FALSE)

troops <- read.table("C:/Users/ayush/Desktop/input/minard/troops.txt",
                     header = TRUE, stringsAsFactors = FALSE)

temps <- read.table("C:/Users/ayush/Desktop/input/minard/temps.txt",
                    header = TRUE, stringsAsFactors = FALSE)
  mutate(date = dmy(date))  # Convert string to actual datex`x`x``
ggplot(troops, aes(x = long, y = lat, group = group)) +
  geom_path()
ggplot(troops, aes(x = long, y = lat, group = group, 
                   color = direction, size = survivors)) +
  geom_path()
ggplot(troops, aes(x = long, y = lat, group = group, 
                   color = direction, size = survivors)) +
  geom_path(lineend = "round")
ggplot(troops, aes(x = long, y = lat, group = group, 
                   color = direction, size = survivors)) +
  geom_path(lineend = "round") +
  scale_size(range = c(0.5, 15))
ggplot(troops, aes(x = long, y = lat, group = group, 
                   color = direction, size = survivors)) +
  geom_path(lineend = "round") +
  scale_size(range = c(0.5, 15)) + 
  scale_colour_manual(values = c("#DFC17E", "#870019")) +
  labs(x = NULL, y = NULL) + 
  guides(color = FALSE, size = FALSE)
ggplot() +
  geom_path(data = troops, aes(x = long, y = lat, group = group, 
                               color = direction, size = survivors),
            lineend = "round") +
  geom_point(data = cities, aes(x = long, y = lat)) +
  geom_text(data = cities, aes(x = long, y = lat, label = city), vjust = 1.5) +
  scale_size(range = c(0.5, 15)) + 
  scale_colour_manual(values = c("#DFC17E", "#080670")) +
  labs(x = NULL, y = NULL) + 
  guides(color = FALSE, size = FALSE)

