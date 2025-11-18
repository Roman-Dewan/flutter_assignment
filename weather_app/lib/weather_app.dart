/*

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final _searchCtr = TextEditingController(text: "Dhaka");
  bool _loading = false;
  String? _error;
  String? _resolvedCity;

  // current
  double? _tempC;
  double? _windKph;
  int? _weatherCode;
  String? _wText;

  double? _high, _low;

  List<_Hourly> _hourlies = [];
  List<_Daily> _dailies = [];

// geoCoding--data-apii

  Future<({String? city, double? latitude, double? longitude})> geoCoding(
    String city,
  ) async {
    try {
      final url = Uri.parse(
        "https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1&language=en&format=json",
      );
      final response = await http.get(url);
      // for value checking
      
      debugPrint("Response: ${response.body}");

      if (response.statusCode != 200) {
        throw Exception("geoCoding Failed: ${response.statusCode}");
      }
      final decodedData = jsonDecode(response.body) as Map<String, dynamic>;
      final result = (decodedData["results"] as List?) ?? [];

      if (result.isEmpty) throw Exception("City Not Found!");

      final m = result.first as Map<String, dynamic>;
      final latitude = (m["latitude"] as num).toDouble();
      final longitude = (m["longitude"] as num).toDouble();
      final name = "${m['name']}, ${m['country']}";

      // for value checking.
      debugPrint(
        "latitude: $latitude \n"
        "logtitude: $longitude\n"
        "name: $name",
      );
      return (city: name, latitude: latitude, longitude: longitude);
    } catch (e) {
      throw Exception(e).toString();
    }
  }


// using geoCoding(city) get data from weather code.

  Future _fetch(String city) async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final getGeoData = await geoCoding(city);
      final url = Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=${getGeoData.latitude}&longitude=${getGeoData.longitude}&daily=temperature_2m_max,temperature_2m_min,sunset,sunrise&hourly=temperature_2m,weather_code,wind_speed_10m&current=temperature_2m,weather_code,wind_speed_10m&timezone=auto",
      );
      final response = await http.get(url);
      debugPrint("get weather data: ${response.body}");
      if (response.statusCode != 200) {
        throw Exception("Weather failed ${response.statusCode}");
      }

      /// data decoded.
      final decodeData = jsonDecode(response.body) as Map<String, dynamic>;
      final current = decodeData['current'] as Map<String, dynamic>;
      // current
      final tempC = (current["temperature_2m"] as num).toDouble();
      final windKph = (current["wind_speed_10m"] as num).toDouble();
      final wCode = (current["weather_code"] as num).toInt();
      final wText = (current["weather_code"] as num).toString();

      // hourly
      final hourly = decodeData['hourly'] as Map<String, dynamic>;

      final hTimes = List<String>.from(hourly['time']);
      final hTemps = List<double>.from(
        hourly['temperature_2m'].map((e) => (e as num).toDouble()),
      );
      final hCodes = List<int>.from(
        hourly['weather_code'].map((e) => (e as num).toInt()),
      );

      final outHourly = <_Hourly>[];

      for (var i = 0; i < hTimes.length; i++) {
        outHourly.add(_Hourly(DateTime.parse(hTimes[i]), hTemps[i], hCodes[i]));
      }
      setState(() {
        _resolvedCity = getGeoData.city;
        _tempC = tempC;
        _weatherCode = wCode;
        _wText = _codeToText(wCode);
        _windKph = windKph;
        _hourlies = outHourly;
      });
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  String _codeToText(int? c) {
    if (c == null) return "--";
    if (c == 0) return "Clear Sky";
    if ([1, 2, 3].contains(c)) return "Mainly Clear";
    if ([45, 48].contains(c)) return "Fog";
    if ([51, 53, 55, 56, 57].contains(c)) return "Drizzle";
    if ([61, 63, 65, 66, 67].contains(c)) return "Rain ";
    if ([71, 73, 75, 77].contains(c)) return "Snow";
    if ([80, 81, 82].contains(c)) return "Rain Showers";
    if ([85, 86].contains(c)) return "Snow Showers";
    if (c == 95) return "Thunderstorm";
    if (c == 96) return "Hail";

    return "Cloudy";
  }

  IconData _codeToIcon(int? c) {
    if (c == 0) return Icons.sunny;
    if ([1, 2, 3].contains(c)) return Icons.cloud_outlined;
    if ([45, 48].contains(c)) return Icons.foggy;
    if ([51, 53, 55, 56, 57].contains(c)) return Icons.grain_sharp;
    if ([61, 63, 65, 66, 67].contains(c)) return Icons.water_drop;
    if ([71, 73, 75, 77].contains(c)) return Icons.ac_unit;
    if ([80, 81, 82].contains(c)) return Icons.deblur_rounded;
    if ([85, 86].contains(c)) return Icons.snowing;
    if (c == 95) return Icons.thunderstorm;
    if (c == 96) return Icons.thunderstorm;

    return Icons.cloud;
  }

  @override
  void initState() {
    _fetch("Dhaka");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _fetch(_searchCtr.text),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.blueAccent, Colors.white70],
            ),
          ),
        
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: _searchCtr,
                        onSubmitted: (value) => _fetch(value),
                        decoration: InputDecoration(
                          labelText: "Enter city (e.g.. Dhaka)",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: _loading ? null : () => _fetch(_searchCtr.text),
                      child: Text("Go"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                if (_loading) const LinearProgressIndicator(),
                if (_error != null)
                  Text(_error!, style: TextStyle(color: Colors.red)),
                const SizedBox(height: 8),
                Column(
                  children: [
                    Text(
                      "My Location",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _resolvedCity ?? "Bangladesh",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8), // ºC
                // current temperature
                if (_tempC != null) ...[
                  Center(
                    child: Text(
                      "${_tempC!.toStringAsFixed(0)}ºC",
                      style: TextStyle(fontSize: 96, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
                // current windkph
                if (_windKph != null)
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "Sunny conditions likely throug today. Wind up to $_windKph km/h.",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),

                const SizedBox(height: 12),
                if (_hourlies.isNotEmpty)
                  Card(
                    color: Colors.white,
                    child: SizedBox(
                      height: 112,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _hourlies.length,
                        itemBuilder: (_, __) => const SizedBox(width: 12),
                        separatorBuilder: (_, i) {
                          final h = _hourlies[i];
                          final label = i == 0 ? "Now" : h.time.hour.toString();
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(label),
                              Icon(_codeToIcon(h.code)),
                              Text("${h.temp.toStringAsFixed(0)}ºC"),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Hourly {
  final DateTime time;
  final double temp;
  final int code;

  _Hourly(this.time, this.temp, this.code);
}

class _Daily {
  final DateTime date;
  final double tMin, tMax;
  _Daily(this.date, this.tMin, this.tMax);
}


*/