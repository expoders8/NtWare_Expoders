// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:wave_id/features/auth/store/auth_store.dart';

// class AuthQrScannerWidget extends StatelessWidget {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   late final QRViewController controller;


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderColor: Colors.red,
//         borderRadius: 10,
//         borderLength: 30,
//         borderWidth: 10,
//         cutOutSize: 300,
//       ),
//     ));
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
// //      if (widget.onScanSuccess != null) widget.onScanSuccess(scanData);
//       authScreenStore!.scanData = scanData.code;
//     });
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }
