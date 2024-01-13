import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum Flavor { waveId, ntWare }

class FlavorService extends GetxService {
  static FlavorService get to => Get.find();

  final Flavor flavor;

  final String baseUrl;

  final String assetsFolder;

  final String defaultCardName;

  final String appName;

  final String aboutUsText;

  final List<AboutUsFooterLogo> aboutUsLogos;

  final String? homeBackground;

  final Color backgroundColor;
  final Color secondaryColor;

  final bool canLoadMoreCards;

  final String? eulaAssetHtml;
  final String? eulaUrl;

  FlavorService({
    this.eulaAssetHtml,
    this.eulaUrl,
    required this.aboutUsText,
    required this.flavor,
    required this.appName,
    required this.baseUrl,
    required this.assetsFolder,
    required this.defaultCardName,
    required this.backgroundColor,
    this.aboutUsLogos = const [],
    required this.secondaryColor,
    this.homeBackground,
    this.canLoadMoreCards = true,
  });
}

class AboutUsFooterLogo {
  final String asset;
  String? url;

  AboutUsFooterLogo({required this.asset, this.url});
}
