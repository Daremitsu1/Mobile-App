import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

# load the preprocessed data
traffic_data = pd.read_csv("preprocessed_traffic_data.csv")

# split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(traffic_data.drop("traffic_congestion", axis=1),
                                                    traffic_data["traffic_congestion"],
                                                    test_size=0.2, random_state=42)

# train the model
reg = LinearRegression().fit(X_train, y_train)

# mke predictions on the test set
y_pred = reg.predict(X_test)

# evaluate the model
rmse = mean_squared_error(y_test, y_pred)
print("Root Mean Squared Error: ", rmse)

# optimize the model
from sklearn.model_selection import GridSearchCV
param_grid = {'fit_intercept':[True,False], 'normalize':[True,False]}
reg = LinearRegression()
reg = GridSearchCV(reg, param_grid, cv=5)
reg.fit(X_train, y_train)
print("Best parameters: ", reg.best_params_)
