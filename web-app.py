from flask import Flask, jsonify, request, render_template
import pickle
import os

app = Flask(__name__)

# load the pre-trained model
model = pickle.load(open("traffic_congestion_model.pkl", "rb"))

# define a route for the home page
@app.route('/')
def home():
    return render_template("home.html")

# define a route for the prediction
@app.route('/predict', methods=['POST'])
def predict():
    # get the data from the request
    data = request.form

    # check for missing data
    if 'traffic_volume' not in data or 'weather_condition' not in data or 'time_of_day' not in data or 'day_of_week' not in data:
        return jsonify({'error': 'Missing data'}), 400

    # make a prediction
    prediction = model.predict([[data['traffic_volume'], data['weather_condition'], data['time_of_day'], data['day_of_week']]])

    # return the prediction as a response
    return jsonify({'prediction': prediction[0]})

# define a route for the about page
@app.route('/about')
def about():
    return render_template("about.html")

# handle file not found error
@app.errorhandler(404)
def not_found(error):
    return render_template("404.html"), 404

# handle internal server errors
@app.errorhandler(500)
def internal_server_error(error):
    return render_template("500.html"), 500

if __name__ == '__main__':
    app.run(port=8000)
