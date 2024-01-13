import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../auth/auth_screen.x.dart';

class QrCodeScannerX extends GetxController {
  QRViewController? controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  bool inProgress = false;

  onQrDetected(String? rawValue) async {
    if (rawValue != null && !inProgress) {
      try {
        inProgress = true;

        AuthScreenX.to.otpId(rawValue);
        if (!(await AuthScreenX.to.requestOtp())) {
          Get.back();
        }
      } finally {
        await Future.delayed(const Duration(milliseconds: 1500), () {
          inProgress = false;
        });
      }
    }
  }

  onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      onQrDetected(scanData.code);
    });
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
