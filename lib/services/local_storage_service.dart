import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertask/helpers/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // Primary functions

  // Save the data in the local storage
  save(String key, data) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, jsonEncode(data));
    } catch (e) {
      debugPrint('Error saving data to local storage: $e');
    }
  }

  // Read/Get the data from the local storage
  read(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getString(key) != null) {
        return jsonDecode(prefs.getString(key).toString());
      } else {
        return '';
      }
    } catch (e) {
      debugPrint('Error reading data from local storage: $e');
      return null;
    }
  }

  // Delete/Remove the data from the local storage
  remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // Clear the local storage
  clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  // Secondary functions

  // Save the token
  setToken(String token) async {
    await LocalStorageService().save(Constants.token, token);
    token = token;
  }

  // Get the token
  getToken() async {
    String token = await LocalStorageService().read(Constants.token);
    return token;
  }
}
