import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../_widgets/styled_alert_dialog.dart';

class NotificationUtils {
  static showSnackBar(
      {Widget? content,
      String? message,
      bool showProgressIndicator = false,
      Widget? icon,
      Duration? duration}) {
    Get.closeCurrentSnackbar();
    Get.showSnackbar(GetSnackBar(
      messageText: Row(
        children: [
          Expanded(
            child: content ??
                Text(
                  message!,
                  style:
                      Get.textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
          ),
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: icon,
            ),
          if (showProgressIndicator == true)
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.zero,
      duration: duration ?? const Duration(seconds: 5),
      isDismissible: false,
      dismissDirection: DismissDirection.horizontal,
      reverseAnimationCurve: Curves.easeOutSine,
      forwardAnimationCurve: Curves.easeInOutSine,
    ));
  }

  static showSuccessSnackBar({
    Widget? content,
    String? message,
  }) {
    Get.closeCurrentSnackbar();
    Get.showSnackbar(GetSnackBar(
      messageText: content ??
          Text(
            message ?? "Something went wrong",
            style: const TextStyle(color: Colors.white),
          ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      snackStyle: SnackStyle.GROUNDED,
      margin: EdgeInsets.zero,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      reverseAnimationCurve: Curves.easeOutSine,
      forwardAnimationCurve: Curves.easeInOutSine,
    ));
  }

  static showErrorSnackBar({String? message, Widget? content}) {
    Get.closeCurrentSnackbar();
    Get.showSnackbar(GetSnackBar(
      messageText: content ??
          Text(
            message ?? "Something went wrong",
            style: const TextStyle(color: Colors.white),
          ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      snackStyle: SnackStyle.GROUNDED,
      margin: const EdgeInsets.all(0),
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      reverseAnimationCurve: Curves.easeOutSine,
      forwardAnimationCurve: Curves.easeInOutSine,
    ));
  }

  static Future showSimpleAlert({
    String? title,
    String? message,
    String confirmText = 'Ok',
    Function()? onConfirm,
  }) async =>
      showAlert(
        title: title,
        content: message != null ? Text(message) : null,
        btnPositive: confirmText,
        btnPositiveCallback: onConfirm ?? Get.back,
      );

  static Future showAlert({
    String? title,
    Widget? content,
    String btnPositive = 'Ok',
    Function()? btnPositiveCallback,
    String? btnNegative,
    Function()? btnNegativeCallback,
  }) async {
    return Get.dialog(
      StyledAlertDialog(
        title: title == null ? null : Text(title),
        content: content,
        actions: <Widget>[
          if (btnNegative != null)
            TextButton(
              onPressed: btnNegativeCallback ?? Get.back,
              child: Text(
                btnNegative,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          TextButton(
            onPressed: btnPositiveCallback ?? Get.back,
            child: Text(btnPositive),
          )
        ],
      ),
      barrierDismissible: true,
    );
  }
}
