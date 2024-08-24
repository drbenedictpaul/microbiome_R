# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the dataset
data <- read.csv("BreastCancer_Dataset.csv")

# Convert Fn_Status to a factor
data$Fn_Status <- as.factor(data$Fn_Status)

# Plotting Initial Diagnosis Age by Fn_Status
ggplot(data, aes(x = Fn_Status, y = Initial.Diagnosis.Age)) +
  geom_boxplot() +
  labs(title = "Initial Diagnosis Age by Fn_Status",
       x = "Fn_Status",
       y = "Initial Diagnosis Age") +
  theme_minimal()
