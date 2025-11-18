import 'package:flutter/material.dart';
import 'package:weather_app/app.dart';

void main() {
  runApp(const MyApp());
}



/// geo-coding api(logtitude, lattidue, city)
/* 
    https://geocoding-api.open-meteo.com/v1/search?name=Dhaka&count=1&language=en&format=json

*/


/// weather-api 
/* 
  https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&daily=temperature_2m_max,temperature_2m_min,sunset,sunrise&hourly=temperature_2m,weather_code,wind_speed_10m&current=temperature_2m,weather_code,wind_speed_10m&timezone=auto

*/