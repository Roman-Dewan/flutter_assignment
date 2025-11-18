/*


import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/hourly_model.dart';
import '../models/daily_model.dart';

class WeatherService {
  Future<
    ({
      double? tempC,
      double? windKph,
      int? weatherCode,
      List<HourlyModel> hourlies,
      List<DailyModel> dailies,
      Map<String, dynamic> raw,
    })
  >
  fetchWeather(double lat, double lon) async {
    final url = Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&daily=temperature_2m_max,temperature_2m_min,sunset,sunrise&hourly=temperature_2m,weather_code,wind_speed_10m&current=temperature_2m,weather_code,wind_speed_10m&timezone=auto",
    );

    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Weather failed ${response.statusCode}");
    }

    final decodeData = jsonDecode(response.body) as Map<String, dynamic>;

    // Current
    final current = decodeData['current'];
    final tempC = (current["temperature_2m"] as num).toDouble();
    final windKph = (current["wind_speed_10m"] as num).toDouble();
    final wCode = (current["weather_code"] as num).toInt();

    // Hourly
    final hourly = decodeData['hourly'];
    final hTimes = List<String>.from(hourly['time']);
    final hTemps = List<double>.from(
      hourly['temperature_2m'].map((e) => (e as num).toDouble()),
    );
    final hCodes = List<int>.from(
      hourly['weather_code'].map((e) => (e as num).toInt()),
    );

    final hourlies = <HourlyModel>[];
    for (var i = 0; i < hTimes.length; i++) {
      hourlies.add(
        HourlyModel(
          DateTime.parse(hTimes[i]) as String,
          hTemps[i],
          hCodes[i],
          time: '',
          temperature: null,
          weatherCode: null,
        ),
      );
    }

    // Daily (you can extend more later)
    final dailies = <DailyModel>[];

    return (
      tempC: tempC,
      windKph: windKph,
      weatherCode: wCode,
      hourlies: hourlies,
      dailies: dailies,
      raw: decodeData,
    );
  }
}
*/



import 'dart:convert';
import '../network/network_call.dart';

class WeatherService {
  final NetworkCall _networkCall = NetworkCall();

  Future<Map<String, dynamic>> getWeatherData(double lat, double lon) async {
    final String url = "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weather_code,wind_speed_10m&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto";

    try {
      final String response = await _networkCall.get(url);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}