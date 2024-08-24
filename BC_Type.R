# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("BreastCancer_Dataset.csv")

# Clean the BC Type column by trimming whitespace and ensuring consistency
data$BC.Type <- as.factor(trimws(data$BC.Type))

# Ensure consistency in BC Type labels
data$BC.Type <- recode(data$BC.Type, "Hormone Sensitive " = "Hormone Sensitive")

# Convert fadA to a factor
data$fadA <- as.factor(data$fadA)

# Summary of fadA by BC Type
fadA_bc_type_summary <- data %>%
  group_by(BC.Type, fadA) %>%
  summarise(count = n(), .groups = 'drop')

# Plotting
ggplot(fadA_bc_type_summary, aes(x = BC.Type, y = count, fill = fadA)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Incidence of fadA Gene by Breast Cancer Type",
       x = "Breast Cancer Type",
       y = "Count",
       fill = "fadA Status") +
  theme_minimal()
