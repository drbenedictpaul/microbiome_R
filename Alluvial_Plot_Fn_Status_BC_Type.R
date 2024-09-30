# Install necessary packages (if not already installed)
# install.packages("ggalluvial")
# install.packages("dplyr")

# Load necessary libraries
library(ggplot2)
library(ggalluvial)
library(dplyr)

# Read the dataset (replace 'BreastCancer_Dataset.csv' with your file path if needed)
data <- read.csv("BreastCancer_Dataset.csv")

# Clean up the 'BC Type' column by removing extra spaces
data$BC.Type <- trimws(data$BC.Type)

# Verify the unique values in the 'BC Type' column after cleaning
unique(data$BC.Type)

# Create the Alluvial plot comparing BC.Type and Fn_Status
ggplot(data, aes(axis1 = BC.Type, axis2 = Fn_Status)) +
  geom_alluvium(aes(fill = Fn_Status)) +
  geom_stratum() +
  geom_text(stat = "stratum", aes(label = after_stat(stratum))) +
  labs(title = "Alluvial Plot of Fn Status and Breast Cancer Type",
       x = "Breast Cancer Type and Fusobacterium nucleatum Status",
       y = "Count") +
  theme_minimal()
