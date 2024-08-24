# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("BreastCancer_Dataset.csv")

# Clean the BC Type column by trimming whitespace and ensuring consistency
data$BC.Type <- as.factor(trimws(data$BC.Type))

# Ensure consistency in BC Type labels
data$BC.Type <- recode(data$BC.Type, "Hormone Sensitive " = "Hormone Sensitive")

# Convert fipA to a factor
data$fipA <- as.factor(data$fipA)

# Summary of fipA by BC Type
fipA_bc_type_summary <- data %>%
  group_by(BC.Type, fipA) %>%
  summarise(count = n(), .groups = 'drop')

# Plotting
ggplot(fipA_bc_type_summary, aes(x = BC.Type, y = count, fill = fipA)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Incidence of fipA Gene by Breast Cancer Type",
       x = "Breast Cancer Type",
       y = "Count",
       fill = "fipA Status") +
  theme_minimal()
