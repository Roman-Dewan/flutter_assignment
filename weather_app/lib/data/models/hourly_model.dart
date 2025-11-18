// class HourlyModel {
//   final DateTime time;
//   final double temp;
//   final int code;

//   HourlyModel(this.time, this.temp, this.code);
// }

class HourlyModel {
  final String time;
  final double temperature;
  final int weatherCode;

  HourlyModel({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });

  factory HourlyModel.fromJson(Map<String, dynamic> json, int index) {
    return HourlyModel(
      time: json['time'][index],
      temperature: (json['temperature_2m'][index] as num).toDouble(),
      weatherCode: json['weather_code'][index],
    );
  }
}