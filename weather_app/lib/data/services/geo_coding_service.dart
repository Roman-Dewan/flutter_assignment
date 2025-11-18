/*



import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GeoCodingService {
  Future<({String? city, double? latitude, double? longitude})> geoCoding(
    String city,
  ) async {
    try {
      final url = Uri.parse(
        "https://geocoding-api.open-meteo.com/v1/search?name=$city&count=1&language=en&format=json",
      );
      final response = await http.get(url);

      debugPrint("Geo Response: ${response.body}");

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

      return (city: name, latitude: latitude, longitude: longitude);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
*/

import 'dart:convert';
import '../network/network_call.dart';

class GeoCodingService {
  final NetworkCall _networkCall = NetworkCall();

  Future<Map<String, double>?> getCoordinates(String cityName) async {
    final String url = "https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=1";
    
    try {
      final String response = await _networkCall.get(url);
      final Map<String, dynamic> data = jsonDecode(response);

      if (data['results'] != null && data['results'].isNotEmpty) {
        return {
          "latitude": data['results'][0]['latitude'],
          "longitude": data['results'][0]['longitude'],
        };
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}