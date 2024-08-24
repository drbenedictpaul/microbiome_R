library(tidyverse)

# fadA <- read.csv("fadA_Dataset.csv")
# View(fadA)

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("BreastCancer_Dataset.csv")

# Convert BC Stage and fadA to factors for better plotting
data$BC.Stage <- as.factor(data$BC.Stage)
data$fadA <- as.factor(data$fadA)

# Summary of fadA by BC Stage
fadA_summary <- data %>%
  group_by(BC.Stage, fadA) %>%
  summarise(count = n()) %>%
  ungroup()

# Plotting
ggplot(fadA_summary, aes(x = BC.Stage, y = count, fill = fadA)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Incidence of fadA Gene by Breast Cancer Stage",
       x = "Breast Cancer Stage",
       y = "Count",
       fill = "fadA Status") +
  theme_minimal()
