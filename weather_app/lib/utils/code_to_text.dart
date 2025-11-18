class CodeToText {
  String codeToText(int? weatherCode) {
    if (weatherCode == null) return "--";
    if (weatherCode == 0) return "Clear Sky";
    if ([1, 2, 3].contains(weatherCode)) return "Mainly Clear";
    if ([45, 48].contains(weatherCode)) return "Fog";
    if ([51, 53, 55, 56, 57].contains(weatherCode)) return "Drizzle";
    if ([61, 63, 65, 66, 67].contains(weatherCode)) return "Rain";
    if ([71, 73, 75, 77].contains(weatherCode)) return "Snow";
    if ([80, 81, 82].contains(weatherCode)) return "Rain Showers";
    if ([85, 86].contains(weatherCode)) return "Snow Showers";
    if (weatherCode == 95) return "Thunderstorm";
    if (weatherCode == 96) return "Hail";

    return "Cloudy";
  }
}
