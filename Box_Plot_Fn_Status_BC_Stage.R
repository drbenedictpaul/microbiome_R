# Boxplot of Age across BC Stage for Fusobacterium nucleatum status
ggplot(data, aes(x = BC.Stage, y = Age, fill = Fn_Status)) +
  geom_boxplot() +
  labs(title = "Fn Status by Age and Breast Cancer Stages",
       x = "Breast Cancer Stage",
       y = "Age",
       fill = "Fn Status") +
  theme_minimal()
