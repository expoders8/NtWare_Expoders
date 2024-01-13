import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../flavor_service.dart';
import '../../_services/app_service.dart';
import '../../../_translation/app_locale.dart';
import '../../pages/settings/settings_screen.x.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<SettingsScreenX>(
      init: SettingsScreenX(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("settings".tr),
            titleTextStyle: Get.textTheme.titleLarge!.copyWith(
              color: Colors.black,
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const Divider(),
                    ListTile(
                      title: Text("rssiThreshhold".tr),
                      trailing: Text('${controller.rssi} ${"dbi".tr}'),
                      onTap: controller.onRssiClickHandler,
                    ),
                    if (AppService.to.isNtware) ...[
                      const Divider(),
                      Obx(() {
                        return ListTile(
                          title: Text("Language".tr),
                          trailing: Text(
                            (controller.selectedLocale.value ?? AppLocale.enUS)
                                .inString,
                          ),
                          onTap: _showLanguageDialog,
                        );
                      }),
                    ],
                    const Divider(),
                    ListTile(
                      title: Text("resetApp".tr),
                      onTap: controller.onResetAppHandler,
                    ),
                    const Divider(),
                    ListTile(
                      title: Text("aboutUs".tr),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: controller.openAboutUsPage,
                    ),
                    const Divider(),
                    if (FlavorService.to.eulaAssetHtml != null)
                      ListTile(
                        title: Text('EULA'.tr),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: controller.openEula,
                      ),
                    const Divider(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showLanguageDialog() {
    final controller = SettingsScreenX.to;
    Get.defaultDialog(
      title: "Language".tr,
      content: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final i in AppLocale.values)
              ListTile(
                onTap: () {
                  controller.selectedLocale.value = i;
                },
                leading: Radio<AppLocale>(
                  value: i,
                  groupValue: controller.selectedLocale.value,
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedLocale.value = value;
                    }
                  },
                ),
                title: Text(i.inString),
              ),
          ],
        );
      }),
      actions: [
        TextButton(
          onPressed: controller.changeLocale,
          child: Text("ok".tr),
        ),
        TextButton(
          onPressed: controller.resetLocale,
          child: Text(
            "cancel".tr,
            style: const TextStyle(color: Colors.grey),
          ),
        )
      ],
    ).then((value) {
      if (value == null) {
        controller.cancelLocale();
      }
    });
  }
}
