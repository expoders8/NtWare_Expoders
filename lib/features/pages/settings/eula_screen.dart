import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../flavor_service.dart';

class EulaScreen extends StatefulWidget {
  final String? asset;
  final String? url;

  const EulaScreen({Key? key, this.asset, this.url}) : super(key: key);

  static final page = GetPage(
    name: '/eula',
    page: () => const EulaScreen(),
  );

  @override
  State<EulaScreen> createState() => _EulaScreenState();
}

class _EulaScreenState extends State<EulaScreen> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Uri? uri;
      if (widget.asset != null) {
        String fileText = await rootBundle.loadString(widget.asset!);
        uri = Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
      } else if (widget.url != null) {
        uri = Uri.parse(widget.url!);
      }

      if (uri != null) {
        controller = WebViewController()
          ..loadRequest(
            Uri.parse(uri.toString()),
          );
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlavorService.to.backgroundColor,
      appBar: AppBar(title: Text("EULA".tr)),
      body: SafeArea(
        child: Column(
          children: [
            if (controller != null)
              Expanded(
                child: WebViewWidget(
                  controller: controller!,
                ),
              ),
            if (controller == null)
              const Expanded(child: Center(child: CircularProgressIndicator()))
          ],
        ),
      ),
    );
  }
}
