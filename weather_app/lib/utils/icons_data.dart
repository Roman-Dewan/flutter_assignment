import 'package:flutter/material.dart';

class IconsData {
  IconData codeToIcon(int? weatherCode) {
    if (weatherCode == 0) return (Icons.sunny);
    if ([1, 2, 3].contains(weatherCode)) return Icons.cloud_outlined;
    if ([45, 48].contains(weatherCode)) return Icons.foggy;
    if ([51, 53, 55, 56, 57].contains(weatherCode)) return Icons.grain_sharp;
    if ([61, 63, 65, 66, 67].contains(weatherCode)) return Icons.water_drop;
    if ([71, 73, 75, 77].contains(weatherCode)) return Icons.ac_unit;
    if ([80, 81, 82].contains(weatherCode)) return Icons.deblur_rounded;
    if ([85, 86].contains(weatherCode)) return Icons.snowing;
    if (weatherCode == 95) return Icons.thunderstorm;
    if (weatherCode == 96) return Icons.thunderstorm;

    return Icons.cloud;
  }
}
