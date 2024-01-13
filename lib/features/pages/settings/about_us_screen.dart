import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../flavor_service.dart';
import '../../_services/app_service.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  static final page = GetPage(
    name: '/about',
    page: () => const AboutUsScreen(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: FlavorService.to.backgroundColor,
        appBar: AppBar(
          title: Text("aboutUs".tr),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            const SizedBox(height: 16),
            Linkify(
              text: AppService.to.isNtware
                  ? FlavorService.to.aboutUsText.tr
                  : FlavorService.to.aboutUsText.trParams(
                      {"website": "http://tnetic.com"},
                    ),
              textScaleFactor: 1,
              textAlign: TextAlign.justify,
              style: Get.textTheme.titleMedium!.copyWith(color: Colors.black),
              onOpen: (link) async => _launchUrl(link.url),
            ),
            GridView.builder(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              shrinkWrap: true,
              itemCount: FlavorService.to.aboutUsLogos.length,
              itemBuilder: (context, index) {
                var item = FlavorService.to.aboutUsLogos[index];
                return InkWell(
                  onTap: (item.url?.isBlank ?? true)
                      ? null
                      : () => _launchUrl(item.url!),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                        '${FlavorService.to.assetsFolder}${item.asset}'),
                  ),
                );
              },
              // children: <Widget>[
              //   InkWell(
              //     child: Image.asset('${FlavorService.to.assetsFolder}'
              //         'assets/images/tnetic_logo.jpg'),
              //     onTap: () => _launchUrl("http://tnetic.com"),
              //   ),
              //   InkWell(
              //     child: Image.asset('assets/images/rfideas_logo.jpg'),
              //     onTap: () => _launchUrl("http://rfideas.com/)"),
              //   ),
              // ],
            )
          ],
        ),
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.inAppWebView);
    }
  }
}
