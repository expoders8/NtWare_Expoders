import 'package:flutter/material.dart';

import '../../flavor_service.dart';
import '../_common/assets.dart';

class BrandingHeader extends StatelessWidget {
  const BrandingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (FlavorService.to.flavor != Flavor.waveId) {
      return const SizedBox();
      // return Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Text(
      //     FlavorService.to.appName,
      //     style: const TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 0.5),
      //   ),
      // );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          Assets.appLogo2,
          fit: BoxFit.fitHeight,
          width: 200,
        ),
      );
    }
  }
}
