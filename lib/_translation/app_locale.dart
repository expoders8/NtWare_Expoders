import 'dart:ui';

import 'package:get/get.dart';

enum AppLocale {
  jaJP,
  frFR,
  itIT,
  deDE,
  esES,
  enUS,
}

extension LocaleX on AppLocale {
  Locale get locale {
    switch (this) {
      case AppLocale.jaJP:
        return const Locale('ja', 'JP');

      case AppLocale.frFR:
        return const Locale('fr', 'FR');

      case AppLocale.itIT:
        return const Locale('it', 'IT');

      case AppLocale.deDE:
        return const Locale('de', 'DE');

      case AppLocale.esES:
        return const Locale('es', 'ES');

      case AppLocale.enUS:
        return const Locale('en', 'US');
    }
  }

  String get inString {
    switch (this) {
      case AppLocale.jaJP:
        return "Japanese".tr;

      case AppLocale.frFR:
        return "French".tr;

      case AppLocale.itIT:
        return "Italian".tr;

      case AppLocale.deDE:
        return "German".tr;

      case AppLocale.esES:
        return "Spanish".tr;

      case AppLocale.enUS:
        return "English".tr;
    }
  }

  String get uniqueCode {
    switch (this) {
      case AppLocale.jaJP:
        return "jaJP";

      case AppLocale.frFR:
        return "frFR";

      case AppLocale.itIT:
        return "itIT";

      case AppLocale.deDE:
        return "deDE";

      case AppLocale.esES:
        return "esES";

      case AppLocale.enUS:
        return "enUS";
    }
  }
}

AppLocale? fromStringToAppLocale(String? code) {
  switch (code) {
    case "jaJP":
      return AppLocale.jaJP;

    case "frFR":
      return AppLocale.frFR;

    case "itIT":
      return AppLocale.itIT;

    case "deDE":
      return AppLocale.deDE;

    case "esES":
      return AppLocale.esES;

    case "enUS":
      return AppLocale.enUS;

    default:
      return null;
  }
}
