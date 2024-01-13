import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../_common/assets.dart';
import '../../../../flavor_service.dart';
import '../../../_services/app_service.dart';
import '../../../_widgets/branding_header.dart';
import '../../../../features/pages/home/view/card_item.dart';
import '../../../../features/pages/home/home_screen.x.dart';

class WaveIdWidget extends StatelessWidget {
  const WaveIdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = HomeScreenX.to;
    final appStore = AppService.to;

    return Container(
      decoration: Assets.homeBackground == null
          ? null
          : BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.homeBackground!),
                fit: BoxFit.cover,
              ),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BrandingHeader(),
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
          Expanded(
            child: Obx(() {
              if (controller.showLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        top: 0, right: 16, left: 16, bottom: 8),
                    child: Text(
                      (controller.cards.length == 1
                              ? "holdPhoneToReaderAndTap"
                              : "holdPhoneToReaderAndTapAppropriate")
                          .trParams(
                        {
                          'name': FlavorService.to.appName,
                        },
                      ),
                      // "Hold phone to a ${} reader and tap the${_homeScreenController.cards.length == 1 ? '' : ' appropriate'} ID button below.",
                      style: Get.textTheme.bodySmall!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        CardItem(waveCard: controller.cards[index]),
                    itemCount: controller.cards.length,
                  ),
                ],
              );
            }),
          ),
          if (FlavorService.to.canLoadMoreCards)
            Obx(
              () => Offstage(
                offstage: appStore.isLoggedIn,
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero)),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.65)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: controller.openAuth,
                    child: Text(
                      'loadYourCards'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
