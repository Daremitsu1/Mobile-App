using DataFrames, Statistics

# load the dataset
traffic_data = DataFrame(readtable("traffic_data.csv"))

# handle missing values
handle_missing!(traffic_data)

# handle outliers
handle_outliers!(traffic_data)

# create new features
traffic_data[:time_of_day] = hour.(traffic_data[:time])
traffic_data[:day_of_week] = dayname.(traffic_data[:date])

# one-hot encode categorical variables
traffic_data = onehot(traffic_data, [:day_of_week, :weather_condition])

# normalize numerical variables
normalize!(traffic_data, Not([:traffic_congestion, :date, :time]))

# select relevant features
traffic_data = select(traffic_data, Not([:date, :time, :accidents]))

# check the structure of the preprocessed dataset
describe(traffic_data)
