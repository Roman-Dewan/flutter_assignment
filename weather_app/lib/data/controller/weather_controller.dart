// import 'package:flutter/material.dart';
// import '../../utils/code_to_text.dart';
// import '../../utils/icons_data.dart';
// import '../services/geo_coding_service.dart';
// import '../services/weather_service.dart';
// import '../models/hourly_model.dart';

// class WeatherController extends ChangeNotifier {
//   final geo = GeoCodingService();
//   final weather = WeatherService();
//   final codeToText = CodeToText();
//   final iconHelper = IconsData();

//   bool loading = false;
//   String? error;
//   String? resolvedCity;

//   double? tempC;
//   double? windKph;
//   int? weatherCode;

//   List<HourlyModel> hourlies = [];

//   Future fetch(String city) async {
//     try {
//       loading = true;
//       error = null;
//       notifyListeners();

//       final geoData = await geo.geoCoding(city);
//       resolvedCity = geoData.city;

//       final weatherData =
//       await weather.fetchWeather(geoData.latitude!, geoData.longitude!);

//       tempC = weatherData.tempC;
//       windKph = weatherData.windKph;
//       weatherCode = weatherData.weatherCode;

//       hourlies = weatherData.hourlies;
//     } catch (e) {
//       error = e.toString();
//     } finally {
//       loading = false;
//       notifyListeners();
//     }
//   }

//   String get weatherText => codeToText.codeToText(weatherCode);

//   IconData get weatherIcon => iconHelper.codeToIcon(weatherCode);
// }

import '../services/geo_coding_service.dart';
import '../services/weather_service.dart';
import '../models/daily_model.dart';
import '../models/hourly_model.dart';

class WeatherController {
  final GeoCodingService _geoService = GeoCodingService();
  final WeatherService _weatherService = WeatherService();

  // This function returns a Map with all processed data needed for the UI
  Future<Map<String, dynamic>> processWeather(String city) async {
    // 1. Get Coordinates
    final coords = await _geoService.getCoordinates(city);
    if (coords == null) {
      throw Exception("City not found");
    }

    // 2. Get Weather Data
    final rawData = await _weatherService.getWeatherData(
      coords['latitude']!,
      coords['longitude']!,
    );

    // 3. Process Current Data
    final current = rawData['current'];
    final dailyRaw = rawData['daily']; // Needed for today's High/Low

    // 4. Process Hourly List (Next 24 hours)
    List<HourlyModel> hourlyList = [];
    for (int i = 0; i < 24; i++) {
      hourlyList.add(HourlyModel.fromJson(rawData['hourly'], i));
    }

    // 5. Process Daily List (Next 7 days)
    List<DailyModel> dailyList = [];
    for (int i = 0; i < 7; i++) {
      dailyList.add(DailyModel.fromJson(rawData['daily'], i));
    }

    // 6. Package everything to return to UI
    return {
      "current_temp": current['temperature_2m'],
      "current_wind": current['wind_speed_10m'],
      "current_code": current['weather_code'],
      "today_high": dailyRaw['temperature_2m_max'][0],
      "today_low": dailyRaw['temperature_2m_min'][0],
      "hourly": hourlyList,
      "daily": dailyList,
    };
  }
}
