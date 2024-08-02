// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertask/helpers/constants.dart';
import 'package:fluttertask/services/api_service.dart';
import 'package:fluttertask/services/local_storage_service.dart';
import 'package:fluttertask/widgets/custom_notification_message.dart';

class AuthProvider with ChangeNotifier {
  // Method for authenticating user
  Future<bool> authenticate(
      Map<String, String?> credentials, BuildContext context) async {
    try {
      var url = Constants.login;

      Map<String, String> requestHeaders = {
        'accept': 'application/json',
        'BD-Tenant-Id': 'bedigitalise',
        'Content-Type': 'application/json; charset=utf-8',
      };

      var response = await ApiService().post(
        url,
        body: credentials,
        headers: requestHeaders,
      );

      if (response.statusCode != 200) {
        customNotificationMessage('Something went wrong!', false, context);
        return false;
      }

      var decodedResponse = jsonDecode(response.body)['data'];
      String token = decodedResponse['accessToken'];

      // Saving token
      await LocalStorageService().setToken(token);

      notifyListeners();
      return true;
    } catch (err) {
      rethrow;
    }
  }
}
