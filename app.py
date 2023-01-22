from flask import Flask, jsonify, request
import pickle

app = Flask(__name__)

# load the pre-trained model
model = pickle.load(open("traffic_congestion_model.pkl", "rb"))

@app.route('/predict', methods=['POST'])
def predict():
    # get the data from the request
    data = request.get_json()
   
    # make a prediction
    prediction = model.predict([[data['traffic_volume'], data['weather_condition'], data['time_of_day'], data['day_of_week']]])
    
    # return the prediction as a response
    return jsonify({'prediction': prediction[0]})

if __name__ == '__main__':
    app.run(port=8000)
