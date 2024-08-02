import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  Future<http.Response> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? body}) async {
    try {
      Uri uriObj = Uri.parse(url);

      final response = await http.post(
        uriObj,
        body: jsonEncode(body),
        headers: headers,
      );

      return response;
    } catch (e) {
      debugPrint('Error during POST request: $e');
      rethrow;
    }
  }
}
