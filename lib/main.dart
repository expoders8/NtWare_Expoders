import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './flavor_service.dart';
import './_translation/app_locale.dart';
import './features/_common/constants.dart';
import './_provider/user_api_provider.dart';
import './_translation/app_translations.dart';
import './features/_services/app_service.dart';
import './features/pages/auth/auth_screen.dart';
import './features/pages/home/home_screen.dart';
import './features/pages/intro/splash_screen.dart';
import './features/_services/preference_service.dart';
import './features/pages/settings/about_us_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final service = PreferenceService();
  await service.initialise();

  Get.put(FlavorService(
    flavor: Flavor.ntWare,
    appName: 'MiCard PLUS BLE Badge',
    baseUrl: 'https://parseapi.back4app.com/graphql',
    assetsFolder: 'assets/ntware/',
    defaultCardName: 'Badge ID',
    canLoadMoreCards: false,
    homeBackground: null,
    backgroundColor: Colors.white,
    aboutUsText: "ntwareAboutUsText",
    eulaAssetHtml: 'eula.html',
    aboutUsLogos: [
      AboutUsFooterLogo(asset: 'tnetic_logo.jpg'),
      AboutUsFooterLogo(asset: 'rfideas_logo.jpg'),
    ],
    secondaryColor: Constants.primaryActionButton,
  )); // Assuming FlavorService is created here
  Get.put(service);
  Get.put(UserApiProvider());
  Get.put(AppService());

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: PreferenceService.to.getLocale()?.locale ?? Get.deviceLocale,
      fallbackLocale: AppLocale.enUS.locale,
      title: FlavorService.to.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: FlavorService.to.backgroundColor,
        colorScheme: Get.theme.colorScheme.copyWith(
          secondary: FlavorService.to.secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: Get.textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.page.name,
      getPages: [
        SplashScreen.page,
        HomeScreen.page,
        AuthScreen.page,
        AboutUsScreen.page,
      ],
    );
  }
}
