import 'package:get/get.dart';

import '../../model/user.dart';
import '../../flavor_service.dart';
import '../pages/home/home_screen.dart';
import '../_services/preference_service.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  // final appState = AppState.Initial.obs;

  final user = Rxn<User?>();

  bool get isLoggedIn => user.value != null;

  init() async {
    //  check if user logged in or not from local storage
    User? user = await PreferenceService.to.getUser();
    if (user != null) {
      this.user(user);
      // appState(AppState.Authenticated);
    } else {
      // appState(AppState.Unauthenticated);
    }

    Get.offAndToNamed(HomeScreen.page.name);
  }

  loginUser(User user) async {
    this.user(user);
    // save user in local storage
    await PreferenceService.to.setUser(user);
    // appState(AppState.Authenticated);
  }

  logout() async {
    user(null);
    // clear local storage
    await PreferenceService.to.clear();
    // appState(AppState.Unauthenticated);
  }

  late final isNtware = FlavorService.to.flavor == Flavor.ntWare;
}

// enum AppState { Initial, Authenticated, Unauthenticated }
