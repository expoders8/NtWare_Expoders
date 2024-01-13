import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import '../home_screen.x.dart';
import '../../../_common/constants.dart';
import '../../../_services/app_service.dart';

class NtwareWidget extends StatelessWidget {
  const NtwareWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeScreenX.to;
    final appStore = AppService.to;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Obx(
          () => Offstage(
            offstage: !appStore.isLoggedIn,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: Text(
                '${'welcome'.tr}${appStore.user.value?.firstName} ${appStore.user.value?.lastName}',
                style: Get.textTheme.titleLarge,
              ),
            ),
          ),
        ),
        Obx(() {
          final error = controller.error.value;
          final success = controller.success.value;

          if (success != null) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.green.shade800.withOpacity(0.5),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Icon(Icons.verified_user, color: Colors.green.shade900),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      success,
                      style: const TextStyle(
                        fontSize: Constants.defaultSize,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (error != null) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.red.shade800.withOpacity(0.5),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Icon(Icons.error, color: Colors.red.shade900),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      error,
                      style: const TextStyle(
                        fontSize: Constants.defaultSize,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        }),
        const Spacer(),
        SvgPicture.asset(
          Constants.phoneSvgImage,
        ),
        const SizedBox(height: 4),
        Text(
          "logInToDevice".tr,
          style: const TextStyle(
            fontSize: Constants.titleSize,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        const Divider(
          thickness: 1,
          endIndent: 24,
          indent: 24,
          color: Constants.blackText,
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'holdYourPhone'.tr,
            style: const TextStyle(
              fontSize: Constants.defaultSize,
              color: Constants.disableColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
        Obx(
          () {
            final isLoading =
                controller.scanState.value == BleScanState.scanning;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 18),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    isLoading
                        ? Constants.disableColor
                        : Constants.primaryActionButton,
                  ),
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        controller.scanAndAuthenticateDefaultCard();
                      },
                child: Text(
                  isLoading ? "${"scanning".tr}..." : "logIn".tr,
                  style: const TextStyle(
                    fontSize: Constants.defaultSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
