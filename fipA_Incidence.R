# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("BreastCancer_Dataset.csv")

# Convert BC Stage and fipA to factors for better plotting
data$BC.Stage <- as.factor(data$BC.Stage)
data$fipA <- as.factor(data$fipA)

# Summary of fipA by BC Stage
fipA_summary <- data %>%
  group_by(BC.Stage, fipA) %>%
  summarise(count = n(), .groups = 'drop')

# Plotting
ggplot(fipA_summary, aes(x = BC.Stage, y = count, fill = fipA)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Incidence of fipA Gene by Breast Cancer Stage",
       x = "Breast Cancer Stage",
       y = "Count",
       fill = "fipA Status") +
  theme_minimal()
