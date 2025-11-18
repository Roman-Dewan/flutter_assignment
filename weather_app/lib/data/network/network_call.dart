/*

import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkCall {
  Future<NetworkResponse?> getRequest(String url) async {
    try {
      final uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      final decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          isSuccess: true,
          resonseCode: response.statusCode,
          body: decodedData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          resonseCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        resonseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }
}

// Response Model
class NetworkResponse {
  final bool isSuccess;
  final int resonseCode;
  final dynamic body;
  final String? errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.resonseCode,
    this.body,
    this.errorMessage,
  });
}


*/

// import 'package:http/http.dart' as http;

// class NetworkCall {
//   Future<String> get(String url) async {
//     try {
//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         return response.body;
//       } else {
//         throw Exception("Server Error: ${response.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("Network Error: $e");
//     }
//   }
// }

import 'package:http/http.dart' as http;

class NetworkCall {
  // A generic GET request function
  Future<String> get(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Server Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Network Error: $e");
    }
  }
}
