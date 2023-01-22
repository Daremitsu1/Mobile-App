# load necessary libraries
library(dplyr)
library(ggplot2)

# load the dataset
traffic_data <- read.csv("traffic_data.csv")

# check the structure of the dataset
str(traffic_data)

# check for missing values
sum(is.na(traffic_data))

# check for outliers
boxplot(traffic_data$traffic_volume)

# check the distribution of the target variable (traffic congestion)
ggplot(data = traffic_data, aes(x = traffic_congestion)) +
  geom_bar(fill = "blue", color = "black") +
  ggtitle("Distribution of Traffic Congestion")

# check the correlation between features
cor(traffic_data)

# check the relationship between traffic volume and traffic congestion
ggplot(data = traffic_data, aes(x = traffic_volume, y = traffic_congestion)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Relationship between Traffic Volume and Congestion")
