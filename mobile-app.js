import React, { useState } from 'react';
import { View, Text, TextInput, Button } from 'react-native';
import axios from 'axios';

const App = () => {
  const [trafficVolume, setTrafficVolume] = useState('');
  const [weatherCondition, setWeatherCondition] = useState('');
  const [timeOfDay, setTimeOfDay] = useState('');
  const [dayOfWeek, setDayOfWeek] = useState('');
  const [prediction, setPrediction] = useState('');

  const handlePrediction = async () => {
    const response = await axios.post('http://your-server-url.com/predict', {
      traffic_volume: trafficVolume,
      weather_condition: weatherCondition,
      time_of_day: timeOfDay,
      day_of_week: dayOfWeek
    });
    setPrediction(response.data.prediction);
  };

  return (
    <View>
      <TextInput
        placeholder="Traffic Volume"
        value={trafficVolume}
        onChangeText={text => setTrafficVolume(text)}
      />
      <TextInput
        placeholder="Weather Condition"
        value={weatherCondition}
        onChangeText={text => setWeatherCondition(text)}
      />
      <TextInput
        placeholder="Time of Day"
        value={timeOfDay}
        onChangeText={text => setTimeOfDay(text)}
      />
      <TextInput
        placeholder="Day of Week"
        value={dayOfWeek}
        onChangeText={text => setDayOfWeek(text)}
      />
      <Button title="Predict" onPress={handlePrediction} />
      <Text>{prediction}</Text>
    </View>
  );
};

export default App;
