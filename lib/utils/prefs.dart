import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class Prefs {
  static Future<bool> login(User user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('user', json.encode(user.toJson()));
    return true;
  }

  static Future<bool> logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    return true;
  }

  static Future<bool> isLoggedIn() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('user') != null;
  }

  static Future<User?> getUser() async {
    var prefs = await SharedPreferences.getInstance();
    String? userStr = prefs.getString('user');

    if (userStr != null) return User.fromJson(json.decode(userStr));

    return null;
  }
}
