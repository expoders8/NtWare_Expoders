import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:stream_duration/stream_duration.dart';

import '../auth_screen.x.dart';
import '../../../_common/notification_utils.dart';

class OtpInputViewX extends GetxController {
  static const int _otpTimeInMilliseconds = 30;

  final countDownInSeconds = RxInt(0);

  bool get countDownFinished => countDownInSeconds.value == 0;

  final otp = RxnString();

  StreamDuration? _otpCountdown;

  final otpFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    startCountDown();
    super.onInit();
  }

  void startCountDown() {
    if (_otpCountdown != null) {
      _otpCountdown!.dispose();
    }

    countDownInSeconds(_otpTimeInMilliseconds);

    _otpCountdown =
        StreamDuration(const Duration(seconds: _otpTimeInMilliseconds));

    _otpCountdown!.durationLeft.listen((event) {
      countDownInSeconds(event.inSeconds);
    });
  }

  @override
  void onClose() {
    if (_otpCountdown != null) {
      _otpCountdown!.dispose();
    }
    super.onClose();
  }

  void onOtpSubmit() {
    if (otpFormKey.currentState!.validate()) {
      otpFormKey.currentState!.save();
      AuthScreenX.to.verifyOtp(int.parse(otp.value!));
    }
  }

  Future<void> resendOtp() async {
    await AuthScreenX.to.requestOtp();
    startCountDown();
    NotificationUtils.showSnackBar(message: "otpResent".tr);
  }
}
