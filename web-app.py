from flask import Flask, jsonify, request
import pickle

app = Flask(__name__)

# load the pre-trained model
model = pickle.load(open("traffic_congestion_model.pkl", "rb"))

@app.route('/predict', methods=['POST'])
def predict():
    # get the data from the request
    data = request.get_json()

    # check for missing data
    if 'traffic_volume' not in data or 'weather_condition' not in data or 'time_of_day' not in data or 'day_of_week' not in data:
        return jsonify({'error': 'Missing data'}), 400

    # make a prediction
    prediction = model.predict([[data['traffic_volume'], data['weather_condition'], data['time_of_day'], data['day_of_week']]])

    # return the prediction as a response
    return jsonify({'prediction': prediction[0]})

@app.errorhandler(404)
def not_found(error):
    return jsonify({'error': 'Not found'}), 404

if __name__ == '__main__':
    app.run(port=8000)
