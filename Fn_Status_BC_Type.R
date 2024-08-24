# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("BreastCancer_Dataset.csv")

# Clean the BC Type column by trimming whitespace and ensuring consistency
data$BC.Type <- as.factor(trimws(data$BC.Type))

# Ensure consistency in BC Type labels
data$BC.Type <- recode(data$BC.Type, "Hormone Sensitive " = "Hormone Sensitive")

# Convert Fn_Status to a factor
data$Fn_Status <- as.factor(data$Fn_Status)

# Summary of Fn_Status by BC Type
fn_status_bc_type_summary <- data %>%
  group_by(BC.Type, Fn_Status) %>%
  summarise(count = n(), .groups = 'drop')

# Plotting
ggplot(fn_status_bc_type_summary, aes(x = BC.Type, y = count, fill = Fn_Status)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Incidence of Fn_Status by Breast Cancer Type",
       x = "Breast Cancer Type",
       y = "Count",
       fill = "Fn_Status") +
  theme_minimal()
