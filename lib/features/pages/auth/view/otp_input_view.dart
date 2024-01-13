import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../auth/view/otp_input_view.x.dart';

class OtpInputView extends StatelessWidget {
  const OtpInputView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: OtpInputViewX(),
      builder: (OtpInputViewX controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black87,
              ),
              onPressed: Get.back,
            ),
          ),
          body: Form(
            key: controller.otpFormKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "otpSendToMobileNumber".tr,
                      style: Get.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      expands: false,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (value) {
                        if (value?.isEmpty ?? true) return "required".tr;
                        if (!GetUtils.isNum(value!)) return "invalidOtp".tr;
                        return null;
                      },
                      style: const TextStyle(
                          letterSpacing: 10,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      keyboardType: const TextInputType.numberWithOptions(),
                      decoration: const InputDecoration(
                          hintText: "000000",
                          hintStyle: TextStyle(color: Colors.black38)),
                      textAlign: TextAlign.center,
                      onSaved: (newValue) => controller.otp(newValue),
                    ),
                  ),
                  TextButton(
                    onPressed: controller.countDownFinished
                        ? controller.resendOtp
                        : null,
                    child: Text(
                      controller.countDownFinished
                          ? "resendOTP".tr
                          : "resendOTPInNSec".trParams(
                              {
                                "n": controller.countDownInSeconds.toString(),
                              },
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        Get.textTheme.labelLarge!.copyWith(color: Colors.white),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.black87),
                      // textColor: Colors.white,
                      // color: Colors.black87,
                    ),
                    onPressed: controller.onOtpSubmit,
                    child: Text("verifyOTP".tr),
                  ),
                  const SizedBox(height: 16)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
