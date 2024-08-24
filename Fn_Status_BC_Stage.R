# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("BreastCancer_Dataset.csv")

# Convert BC Stage and Fn_Status to factors for better plotting
data$BC.Stage <- as.factor(data$BC.Stage)
data$Fn_Status <- as.factor(data$Fn_Status)

# Summary of Fn_Status by BC Stage
fn_status_summary <- data %>%
  group_by(BC.Stage, Fn_Status) %>%
  summarise(count = n(), .groups = 'drop')

# Plotting
ggplot(fn_status_summary, aes(x = BC.Stage, y = count, fill = Fn_Status)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Incidence of Fn_Status by Breast Cancer Stage",
       x = "Breast Cancer Stage",
       y = "Count",
       fill = "Fn_Status") +
  theme_minimal()
