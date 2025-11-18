// class DailyModel {
//   final DateTime date;
//   final double tMin;
//   final double tMax;

//   DailyModel(this.date, this.tMin, this.tMax);
// }

class DailyModel {
  final String date;
  final double maxTemp;
  final double minTemp;
  final int weatherCode;

  DailyModel({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCode,
  });

  factory DailyModel.fromJson(Map<String, dynamic> json, int index) {
    return DailyModel(
      date: json['time'][index],
      maxTemp: (json['temperature_2m_max'][index] as num).toDouble(),
      minTemp: (json['temperature_2m_min'][index] as num).toDouble(),
      weatherCode: json['weather_code'][index],
    );
  }
}