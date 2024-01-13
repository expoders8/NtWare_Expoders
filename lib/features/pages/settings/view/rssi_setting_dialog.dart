import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../_services/preference_service.dart';
import '../../../_widgets/styled_alert_dialog.dart';

class RssiSettingDialog extends StatelessWidget {
  RssiSettingDialog({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    num? rssi = PreferenceService.to.getRssiThreshold();

    return StatefulBuilder(builder: (context, setState) {
      return StyledAlertDialog(
        title: Text("rssiThreshhold".tr),
        content: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              initialValue: '$rssi',
              decoration: InputDecoration(suffix: Text('dbi'.tr)),
              validator: (v) => v!.isEmpty
                  ? "required".tr
                  : (num.tryParse(v) == null ? "invalidValue".tr : null),
              onSaved: (v) => setState(() {
                rssi = int.parse(v!);
              }),
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text("ok".tr),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await PreferenceService.to.setRssiThreshold(rssi as int);
                Get.back();
              }
            },
          ),
          TextButton(
            onPressed: Get.back,
            child: Text(
              "cancel".tr,
              style: const TextStyle(color: Colors.grey),
            ),
          )
        ],
      );
    });
  }
}
