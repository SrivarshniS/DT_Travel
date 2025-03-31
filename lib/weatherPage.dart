import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _locationController = TextEditingController();
  String temperatureC = "--";
  String temperatureF = "--";
  String weatherCondition = "Unknown";
  String nextDayTemperatureC = "--";
  String nextDayTemperatureF = "--";
  String nextDayCondition = "Unknown";

  Future<void> fetchWeather(String city) async {
    try {
      // Get location coordinates
      final locationUrl = Uri.parse('https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1&format=json');
      final locationResponse = await http.get(locationUrl);
      final locationData = json.decode(locationResponse.body);

      if (locationData['results'] == null) {
        setState(() {
          weatherCondition = "Location Not Found";
        });
        return;
      }

      double latitude = locationData['results'][0]['latitude'];
      double longitude = locationData['results'][0]['longitude'];

      // Get weather data
      final weatherUrl = Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&daily=temperature_2m_max,weathercode&timezone=auto');
      final weatherResponse = await http.get(weatherUrl);
      final weatherData = json.decode(weatherResponse.body);

      double todayTempC = weatherData['daily']['temperature_2m_max'][0];
      double tomorrowTempC = weatherData['daily']['temperature_2m_max'][1];

      setState(() {
        temperatureC = "$todayTempC °C";
        temperatureF = "${(todayTempC * 9 / 5) + 32} °F";
        weatherCondition = getWeatherDescription(weatherData['daily']['weathercode'][0]);

        nextDayTemperatureC = "$tomorrowTempC °C";
        nextDayTemperatureF = "${(tomorrowTempC * 9 / 5) + 32} °F";
        nextDayCondition = getWeatherDescription(weatherData['daily']['weathercode'][1]);
      });
    } catch (e) {
      setState(() {
        weatherCondition = "Error fetching weather";
      });
    }
  }

  String getWeatherDescription(int code) {
    if (code == 0) return "Clear Sky ☀️";
    if (code <= 3) return "Partly Cloudy ⛅";
    if (code <= 50) return "Foggy 🌫";
    if (code <= 55) return "Drizzle 🌦";
    if (code <= 65) return "Rainy 🌧";
    if (code <= 85) return "Snowy ❄";
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather App")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: "Enter City Name",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => fetchWeather(_locationController.text),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Today's Weather", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Condition: $weatherCondition"),
            Text("Temperature: $temperatureC / $temperatureF"),
            SizedBox(height: 20),
            Text("Tomorrow's Forecast", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Condition: $nextDayCondition"),
            Text("Temperature: $nextDayTemperatureC / $nextDayTemperatureF"),
          ],
        ),
      ),
    );
  }
}
