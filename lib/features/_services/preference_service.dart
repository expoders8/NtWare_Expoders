import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user.dart';
import '../../_translation/app_locale.dart';

class PreferenceService extends GetxService {
  static PreferenceService get to => Get.find();

  late final SharedPreferences _instance;

  static const String _rssiThresholdKey = "rssiThreshold";
  static const String _userKey = "user";

  Future<void> initialise() async {
    _instance = await SharedPreferences.getInstance();
  }

  Future<bool> setUser(User user) async =>
      _instance.setString(_userKey, json.encode(user.toJson()));

  // Future<bool> logout() async => _instance.remove('user');

  // bool isLoggedIn() => _instance.getString('user') != null;

  Future<User?> getUser() async {
    String? userStr = _instance.getString('user');
    return userStr != null ? User.fromJson(json.decode(userStr)) : null;
  }

  int getRssiThreshold() =>
      _instance.getInt(
        _rssiThresholdKey,
      ) ??
      -65;

  Future setRssiThreshold(int rssiThreshold) =>
      _instance.setInt(_rssiThresholdKey, rssiThreshold);

  final _localeCode = "localeCode";

  void setLocale(AppLocale locale) {
    _instance.setString(_localeCode, locale.uniqueCode);
  }

  AppLocale? getLocale() {
    final data = _instance.getString(_localeCode);
    return fromStringToAppLocale(data);
  }

  Future clear() => _instance.clear();
}
