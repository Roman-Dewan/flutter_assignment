/*


import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade600, Colors.blue, Colors.blue.shade200],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(12),
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter city (e.g. Dhaka)",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: (){}, // TODO: go button
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Go",
                      style: TextTheme.of(
                        context,
                      ).titleMedium?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // current data
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "My Location",
                      style: TextTheme.of(context).titleLarge,
                    ),
                    Text(
                      "Dhaka, Bangladesh", // TODO: location
                      style: TextTheme.of(context).headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    // TODO: Icons
                    Icon(Icons.cloud, color: Colors.white, size: 100),


                    // TODO: weather information based on weather code.
                    Text(
                      "Most Sunny",
                      style: TextTheme.of(context).titleMedium,
                    ),

                    // TODO: high and low temperature.
                    Text("42 ℃", style: TextTheme.of(context).displayLarge),
                    Text(
                      "High: 42 ℃\t"
                      "\tLow: 42 ℃",
                      style: TextTheme.of(context).titleMedium,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // wind speed card
              Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    // TODO: current wind Speed,
                    "Mainly Clear conditions likely today. Wind up to 4.6 km/h",
                    style: TextTheme.of(context).titleMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Hourly Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Now • Hourly",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$index"), // TODO: time
                                const SizedBox(height: 6),
                                Icon(Icons.sunny, size: 26), // TODO: icon
                                const SizedBox(height: 6),
                                Text("21°C"), // TODO: Current Temperature
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 24),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Daily Card.
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "10-Day Forecast",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 240,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(width: 70, child: Text("Day")),
                                // TODO Day.
                                Icon(Icons.sunny), // TODO Icon

                                LinearPercentIndicator(
                                  // giving here the percent of temperature.
                                  animation: true,
                                  animationDuration: 1000,
                                  barRadius: Radius.circular(8),
                                  width: 140.0,
                                  lineHeight: 8.0,
                                  percent: 0.7, // TODO
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.orange,
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // high and low temperature.
                                      Text("Low ℃"),
                                      Text("High ℃"), // TODO
                                    ], // using here temperature
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

// import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// // Imports based on your folder structure
// import '../data/controller/weather_controller.dart';
// import '../data/models/hourly_model.dart';
// import '../data/models/daily_model.dart';
// import '../utils/code_to_text.dart';
// import '../utils/icons_data.dart';

// class WeatherAppScreen extends StatefulWidget {
//   const WeatherAppScreen({super.key});

//   @override
//   State<WeatherAppScreen> createState() => _WeatherAppScreenState();
// }

// class _WeatherAppScreenState extends State<WeatherAppScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final WeatherController _controller = WeatherController();

//   // Utils
//   final CodeToText _codeHelper = CodeToText();
//   final IconsData _iconHelper = IconsData();

//   // State
//   bool _isLoading = false;
//   Map<String, dynamic>? _weatherData;
//   // ignore: unused_field
//   String _errorMessage = "";
//   String _displayCity = "Dhaka"; // Default city name for display

//   // Function to fetch data
//   void _fetchWeather() async {
//     if (_searchController.text.isEmpty) return;

//     setState(() {
//       _isLoading = true;
//       _errorMessage = "";
//     });

//     try {
//       final data = await _controller.processWeather(_searchController.text);
//       setState(() {
//         _weatherData = data;
//         _displayCity = _searchController.text; // Update title
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = e.toString();
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("Error: $e")));
//     }
//   }

//   // Helper to format simple time string (e.g. "2023-10-10T13:00" -> "13:00")
//   String _getSimpleTime(String isoDate) {
//     return isoDate.split('T').last;
//   }

//   // Helper to get just the date
//   String _getSimpleDate(String isoDate) {
//     return isoDate.split('T').first.substring(5); // Returns MM-DD
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Colors.blue.shade600, Colors.blue, Colors.blue.shade200],
//           ),
//         ),
//         child: SafeArea(
//           child: ListView(
//             padding: const EdgeInsets.all(12),
//             children: [
//               // --- SEARCH BAR ---
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: _searchController,
//                       style: const TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         labelText: "Enter city (e.g. Dhaka)",
//                         labelStyle: const TextStyle(color: Colors.white),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(color: Colors.white),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: const BorderSide(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   FilledButton(
//                     onPressed: _fetchWeather,
//                     style: FilledButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: Colors.blue,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: Text(
//                       "Go",
//                       style: TextTheme.of(
//                         context,
//                       ).titleMedium?.copyWith(color: Colors.blue),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // --- LOADING / ERROR / DATA ---
//               if (_isLoading)
//                 const Center(
//                   child: CircularProgressIndicator(color: Colors.white),
//                 )
//               else if (_weatherData == null)
//                 const Center(
//                   child: Text(
//                     "Enter a city to see weather",
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 )
//               else ...[
//                 // --- CURRENT WEATHER SECTION ---
//                 Align(
//                   alignment: Alignment.center,
//                   child: Column(
//                     children: [
//                       Text(
//                         "My Location",
//                         style: TextTheme.of(
//                           context,
//                         ).titleLarge?.copyWith(color: Colors.white70),
//                       ),
//                       Text(
//                         _displayCity.toUpperCase(),
//                         style: TextTheme.of(context).headlineMedium?.copyWith(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),

//                       // Icon from IconsData
//                       Icon(
//                         _iconHelper.codeToIcon(_weatherData!['current_code']),
//                         color: Colors.white,
//                         size: 100,
//                       ),

//                       // Text from CodeToText
//                       Text(
//                         _codeHelper.codeToText(_weatherData!['current_code']),
//                         style: TextTheme.of(
//                           context,
//                         ).titleMedium?.copyWith(color: Colors.white),
//                       ),

//                       // Temperature
//                       Text(
//                         "${_weatherData!['current_temp']}°C",
//                         style: TextTheme.of(
//                           context,
//                         ).displayLarge?.copyWith(color: Colors.white),
//                       ),

//                       Text(
//                         "High: ${_weatherData!['today_high']}°C \t Low: ${_weatherData!['today_low']}°C",
//                         style: TextTheme.of(
//                           context,
//                         ).titleMedium?.copyWith(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 // --- WIND SPEED CARD ---
//                 Card(
//                   elevation: 0,
//                   color: Colors.white.withOpacity(0.2),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       "Wind Speed: ${_weatherData!['current_wind']} km/h",
//                       textAlign: TextAlign.center,
//                       style: TextTheme.of(context).titleMedium?.copyWith(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),

//                 // --- HOURLY CARD ---
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Now • Hourly",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         SizedBox(
//                           height: 100,
//                           child: ListView.separated(
//                             scrollDirection: Axis.horizontal,
//                             itemCount:
//                                 (_weatherData!['hourly'] as List<HourlyModel>)
//                                     .length,
//                             separatorBuilder: (context, index) =>
//                                 const SizedBox(width: 24),
//                             itemBuilder: (context, index) {
//                               final HourlyModel item =
//                                   _weatherData!['hourly'][index];
//                               return Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(_getSimpleTime(item.time)),
//                                   const SizedBox(height: 6),
//                                   Icon(
//                                     _iconHelper.codeToIcon(item.weatherCode),
//                                     size: 26,
//                                   ),
//                                   const SizedBox(height: 6),
//                                   Text("${item.temperature}°C"),
//                                 ],
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // --- DAILY CARD ---
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "7-Day Forecast",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 12),
//                         ListView.builder(
//                           itemCount:
//                               (_weatherData!['daily'] as List<DailyModel>)
//                                   .length,
//                           shrinkWrap: true,
//                           physics: const NeverScrollableScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             final DailyModel item =
//                                 _weatherData!['daily'][index];

//                             // Basic calculation for progress bar (assuming max temp of 50C)
//                             double percent = (item.maxTemp / 50).clamp(
//                               0.0,
//                               1.0,
//                             );

//                             return Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 8.0,
//                               ),
//                               child: Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 70,
//                                     child: Text(_getSimpleDate(item.date)),
//                                   ),
//                                   Icon(
//                                     _iconHelper.codeToIcon(item.weatherCode),
//                                   ),
//                                   const SizedBox(width: 10),
//                                   Expanded(
//                                     child: LinearPercentIndicator(
//                                       animation: true,
//                                       animationDuration: 1000,
//                                       barRadius: const Radius.circular(8),
//                                       lineHeight: 8.0,
//                                       percent: percent,
//                                       backgroundColor: Colors.grey.shade300,
//                                       progressColor: Colors.orange,
//                                     ),
//                                   ),
//                                   const SizedBox(width: 10),
//                                   SizedBox(
//                                     width: 90,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           "${item.minTemp}°",
//                                           style: TextStyle(
//                                             color: Colors.grey[600],
//                                           ),
//                                         ),
//                                         Text("${item.maxTemp}°"),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../data/controller/weather_controller.dart';
import '../data/models/hourly_model.dart';
import '../data/models/daily_model.dart';
import '../utils/code_to_text.dart';
import '../utils/icons_data.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  // 1. Set default text to "Dhaka" here
  final TextEditingController _searchController = TextEditingController(
    text: "Dhaka",
  );

  final WeatherController _controller = WeatherController();
  final CodeToText _codeHelper = CodeToText();
  final IconsData _iconHelper = IconsData();

  bool _isLoading = false;
  Map<String, dynamic>? _weatherData;
  String _errorMessage = "";
  String _displayCity = "Dhaka";

  // 2. Add initState to fetch data automatically on startup
  @override
  void initState() {
    super.initState();
    _fetchWeather(); // This triggers the API call immediately
  }

  void _fetchWeather() async {
    // Check if text is empty to prevent errors
    if (_searchController.text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _errorMessage = "";
    });

    try {
      // It uses the text from the controller ("Dhaka" by default)
      final data = await _controller.processWeather(_searchController.text);

      if (mounted) {
        setState(() {
          _weatherData = data;
          _displayCity = _searchController.text;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  // Helper to get just the time (e.g. "13:00")
  String _getSimpleTime(String isoDate) {
    return isoDate.split('T').last;
  }

  // Helper to get just the date (e.g. "10-12")
  String _getSimpleDate(String isoDate) {
    return isoDate.split('T').first.substring(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade600, Colors.blue, Colors.blue.shade200],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              // --- SEARCH BAR ---
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Enter city (e.g. Dhaka)",
                        labelStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: _fetchWeather,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Go",
                      style: TextTheme.of(
                        context,
                      ).titleMedium?.copyWith(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // --- LOADING / ERROR / DATA ---
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )
              else if (_weatherData == null)
                // This will rarely show now because of initState, unless the API fails
                const Center(
                  child: Text(
                    "Enter a city to see weather",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              else ...[
                // --- CURRENT WEATHER SECTION ---
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "My Location",
                        style: TextTheme.of(
                          context,
                        ).titleLarge?.copyWith(color: Colors.white70),
                      ),
                      Text(
                        _displayCity.toUpperCase(),
                        style: TextTheme.of(context).headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Icon(
                        _iconHelper.codeToIcon(_weatherData!['current_code']),
                        color: Colors.white,
                        size: 100,
                      ),

                      Text(
                        _codeHelper.codeToText(_weatherData!['current_code']),
                        style: TextTheme.of(
                          context,
                        ).titleMedium?.copyWith(color: Colors.white),
                      ),

                      Text(
                        "${_weatherData!['current_temp'].round()}°C",
                        style: TextTheme.of(
                          context,
                        ).displayLarge?.copyWith(color: Colors.white),
                      ),

                      Text(
                        "High: ${_weatherData!['today_high'].round()}°C \t Low: ${_weatherData!['today_low'].round()}°C",
                        style: TextTheme.of(
                          context,
                        ).titleMedium?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // --- WIND SPEED CARD ---
                Card(
                  elevation: 0,
                  color: Colors.white.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Wind Speed: ${_weatherData!['current_wind']} km/h",
                      textAlign: TextAlign.center,
                      style: TextTheme.of(context).titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                // --- HOURLY CARD ---
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Now • Hourly",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 100,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                (_weatherData!['hourly'] as List<HourlyModel>)
                                    .length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 24),
                            itemBuilder: (context, index) {
                              final HourlyModel item =
                                  _weatherData!['hourly'][index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(_getSimpleTime(item.time)),
                                  const SizedBox(height: 6),
                                  Icon(
                                    _iconHelper.codeToIcon(item.weatherCode),
                                    size: 26,
                                  ),
                                  const SizedBox(height: 6),
                                  Text("${item.temperature.round()}°C"),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // --- DAILY CARD ---
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "7-Day Forecast",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListView.builder(
                          itemCount:
                              (_weatherData!['daily'] as List<DailyModel>)
                                  .length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final DailyModel item =
                                _weatherData!['daily'][index];

                            double percent = (item.maxTemp / 50).clamp(
                              0.0,
                              1.0,
                            );

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    child: Text(_getSimpleDate(item.date)),
                                  ),
                                  Icon(
                                    _iconHelper.codeToIcon(item.weatherCode),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      animation: true,
                                      animationDuration: 1000,
                                      barRadius: const Radius.circular(8),
                                      lineHeight: 8.0,
                                      percent: percent,
                                      backgroundColor: Colors.grey.shade300,
                                      progressColor: Colors.orange,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 90,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${item.minTemp.round()}°",
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        Text("${item.maxTemp.round()}°"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
