import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../_common/assets.dart';
import '../../_services/app_service.dart';
import '../../../features/pages/home/home_screen.x.dart';
import '../../../features/pages/home/view/ntware_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final page = GetPage(
    name: '/home',
    page: () => const HomeScreen(),
    binding: BindingsBuilder(() {
      Get.put(HomeScreenX());
    }),
  );

  AppService get _appStore => AppService.to;

  HomeScreenX get _homeScreenController => HomeScreenX.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      // backgroundColor: const Color(0xffcccccc),
      appBar: AppBar(
        title: Image.asset(Assets.appLogo),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: _appStore.isNtware,
        leading: IconButton(
          onPressed: _homeScreenController.showSettingsBottomSheet,
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          Obx(
            () => Offstage(
              offstage: !_appStore.isLoggedIn,
              child: IconButton(
                icon: const Icon(Icons.refresh, color: Colors.black87),
                onPressed: _homeScreenController.fetchCards,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black87),
            onPressed: _homeScreenController.showSettingsBottomSheet,
          )
        ],
      ),
      body: const NtwareWidget(),
    );
  }
}
