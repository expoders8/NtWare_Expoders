import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../_common/assets.dart';
import '../../../flavor_service.dart';
import '../../_services/app_service.dart';
import '../../../features/pages/intro/splash_screen.x.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static final page = GetPage(
    name: '/',
    page: () => const SplashScreen(),
    binding: BindingsBuilder(() {
      Get.put(SplashScreenX());
    }),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Image.asset(
              //   Assets.appLogo,
              //   fit: BoxFit.fitHeight,
              //   width: Get.width * 0.45,
              // ),
              if (!AppService.to.isNtware) ...[
                const SizedBox(height: 16),
                Image.asset(
                  Assets.appLogo2,
                  fit: BoxFit.fitHeight,
                  width: Get.width * 0.45,
                ),
              ],
              const SizedBox(height: 30),
              CircularProgressIndicator(
                backgroundColor: Colors.white60,
                color: FlavorService.to.secondaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
