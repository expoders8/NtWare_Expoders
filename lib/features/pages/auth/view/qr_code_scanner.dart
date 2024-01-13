import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../auth/view/qr_code_scanner.x.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:wave_id/features/pages/auth/auth_screen.x.dart';

class QrCodeScanner extends StatelessWidget {
  const QrCodeScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QrCodeScannerX>(
      init: QrCodeScannerX(),
      builder: (qrCodeScannerX) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: QRView(
                    key: qrCodeScannerX.qrKey,
                    onQRViewCreated: qrCodeScannerX.onQRViewCreated,
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     color: Colors.black45,
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 50, vertical: 30),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       mainAxisSize: MainAxisSize.max,
                //       children: <Widget>[
                //         // IconButton(
                //         //   onPressed: () async {
                //         //     await qrCodeScannerX.cameraController
                //         //         .resumeDetector();
                //         //   },
                //         //   icon: Icon(Icons.abc_outlined),
                //         // ),
                //         // IconButton(
                //         //   icon: Icon(
                //         //     Icons.flash_on,
                //         //     size: 35,
                //         //     color: Colors.white,
                //         //   ),
                //         //   onPressed: qrCodeScannerX.controller?.toggleFlash,
                //         // )
                //         // IconButton(
                //         //   icon: ValueListenableBuilder(
                //         //     valueListenable:
                //         //         qrCodeScannerX.controller.cameraFacingState,
                //         //     builder: (context, CameraFacing state, child) {
                //         //       return Icon(
                //         //         state == CameraFacing.back
                //         //             ? Icons.camera_rear
                //         //             : Icons.camera_front,
                //         //         size: 35,
                //         //         color: Colors.white,
                //         //       );
                //         //     },
                //         //   ),
                //         //   onPressed: qrCodeScannerX.controller.switchCamera,
                //         // ),
                //         // IconButton(
                //         //   icon: ValueListenableBuilder(
                //         //     valueListenable:
                //         //         qrCodeScannerX.controller.torchState,
                //         //     builder: (context, TorchState state, child) {
                //         //       return Icon(
                //         //         state == TorchState.off
                //         //             ? Icons.flash_off
                //         //             : Icons.flash_on,
                //         //         size: 35,
                //         //         color: Colors.white,
                //         //       );
                //         //     },
                //         //   ),
                //         //   onPressed: qrCodeScannerX.controller.toggleTorch,
                //         // )
                //       ],
                //     ),
                //   ),
                // ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Colors.black45,
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: Get.back,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            "scanQrCodeByAdmin".tr,
                            textAlign: TextAlign.left,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
