import 'dart:async';
import 'package:get/get.dart';

import '../../../model/user.dart';
import '../../_services/app_service.dart';
import '../../_common/notification_utils.dart';
import '../../../_provider/user_api_provider.dart';

class AuthScreenX extends GetxController {
  static AuthScreenX get to => Get.find();

  final int otpTimeInMilliseconds = 1000 * 30;

  final otpId = RxnString();

  final screenState = AuthScreenStateKind.scanner.obs;

  final showLoading = false.obs;

  Future<bool> requestOtp() async {
    try {
      showLoading(true);

      // call api to send OTP and go to OTP input screen
      await UserApiProvider.to.requestOtp(otpId.value!);

      screenState(AuthScreenStateKind.otpInput);
    } catch (e) {
      NotificationUtils.showErrorSnackBar(
        message: "sorrySomethingWentWrong".tr,
      );
      return false;
    } finally {
      showLoading(false);
    }
    return true;
  }

  Future<void> verifyOtp(num otp) async {
    try {
      showLoading(true);

      // call api to verify OTP
      User user = await UserApiProvider.to.verifyOtp(otpId.value!, otp);

      // log user if valid user
      await AppService.to.loginUser(user);

      Get.back();
    } catch (e) {
      NotificationUtils.showSimpleAlert(message: "invalidQrCode".tr);
    } finally {
      showLoading(false);
    }
  }

  void backToInitial() {
    screenState(AuthScreenStateKind.scanner);
  }
}

enum AuthScreenStateKind { scanner, otpInput }
