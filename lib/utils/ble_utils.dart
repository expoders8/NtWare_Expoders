import 'dart:io';
import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../model/ble_device.dart';
import '../features/_common/constants.dart';
import '../features/_common/notification_utils.dart';

class BleUtils {
  static const num scanningTimeout = 10;

  static FlutterReactiveBle? _bleInstance;

  static final validCodeUnits = "Access valid".codeUnits;

  static FlutterReactiveBle get instance {
    _bleInstance ??= FlutterReactiveBle();
    return _bleInstance!;
  }

  static Future<BleDevice?> scanForMatchingDevice(int rssiThreshold) async {
    try {
      Completer<BleDevice?> completer = Completer();

      late StreamSubscription<DiscoveredDevice> scanSubscription;
      scanSubscription = instance
          .scanForDevices(
              requireLocationServicesEnabled: false,
              withServices: [],
              //withServices: [Uuid.parse(Constants.UUID_RF_IDEAS_SERVICE_ID)],
              scanMode: ScanMode.lowLatency)
          .listen((scanResult) async {
        if (scanResult.name == Constants.deviceName &&
            scanResult.rssi >= rssiThreshold &&
            scanResult.rssi <= 0) {
          bool matched = true;
          for (int i = 0; i < Constants.manufacturerData.length; i++) {
            if (Constants.manufacturerData[i] !=
                scanResult.manufacturerData[i]) {
              matched = false;
              break;
            }
          }

          if (matched) {
            await scanSubscription.cancel();
            completer.complete(BleDevice(scanResult));
          }
        }
      }, onDone: () {
        debugPrint("BLE-5 onDone");
        if (!completer.isCompleted) {
          debugPrint("BLE-6");
          completer.complete(null);
        }
      }, onError: (e) {
//        Catcher.reportCheckedError(e, StackTrace.current);
      }, cancelOnError: true);

      Future.delayed(const Duration(seconds: scanningTimeout as int), () async {
        if (!completer.isCompleted) {
          debugPrint("BLE-7");
          await scanSubscription.cancel();
          completer.complete(null);
        }
      });

      debugPrint("BLE-8");
      return completer.future;
    } catch (e) {
//      Catcher.reportCheckedError(e, StackTrace.current);
      return null;
    }
  }

  static Future<bool?> authenticateDevice(
      BleDevice bleDevice, List<int> encodedIdentifier) async {
    try {
      Completer<bool> completer = Completer();

      late StreamSubscription<ConnectionStateUpdate> connectionStream;

      connectionStream = instance
          .connectToAdvertisingDevice(
        id: bleDevice.id,
        withServices: [Uuid.parse(Constants.uuidRfIdeasServiceId)],
        connectionTimeout: const Duration(seconds: 2),
        prescanDuration: const Duration(seconds: 5),
      )
          .listen((connectionState) async {
        if (connectionState.connectionState ==
            DeviceConnectionState.connected) {
          // write
          final characteristic = QualifiedCharacteristic(
              serviceId: Uuid.parse(Constants.uuidRfIdeasServiceId),
              characteristicId: Uuid.parse(Constants.writeCharacteristicUuid),
              deviceId: bleDevice.id);

          await instance.writeCharacteristicWithResponse(characteristic,
              value: encodedIdentifier);

          // read value
          final readCharacteristic = QualifiedCharacteristic(
            serviceId: Uuid.parse(Constants.uuidRfIdeasServiceId),
            characteristicId: Uuid.parse(Constants.readCharacteristicUuid),
            deviceId: bleDevice.id,
          );

          final value = await instance.readCharacteristic(readCharacteristic);

          // check if valid

          bool success = true;
          for (int i = 0; i < validCodeUnits.length; i++) {
            if (value[i] != validCodeUnits[i]) {
              success = false;
            }
          }

          completer.complete(success);

          await connectionStream.cancel();
        }
      });

      return completer.future;
    } catch (e) {
//      Catcher.reportCheckedError(e, StackTrace.current);
      return null;
    }
  }

  static Future<BleStatus?> checkBluetoothStatus() async {
    try {
      Completer<BleStatus> completer = Completer();
      late StreamSubscription<BleStatus> bleStatusSubscription;
      bleStatusSubscription = instance.statusStream.listen((status) async {
        //code for handling status update
        if (status != BleStatus.unknown) {
          await bleStatusSubscription.cancel();
          completer.complete(status);
        }
      });

      return completer.future;
    } catch (e) {
//      Catcher.reportCheckedError(e, StackTrace.current);
      return null;
    }
  }

  static Future<bool> checkBluetoothPermission() async {
    if (Platform.isAndroid) {
      //request here your permissions
      bool permOne = await Permission.bluetoothScan.request().isGranted;
      bool permThree = await Permission.bluetoothConnect.request().isGranted;

      //This will only bring up one permission pop-up,
      //but will only grant the permissions you have been requested here
      //in this method.

      //Return your boolean here
      return permOne && permThree ? true : false;
    }
    return true;
  }

  static Future<bool> checkLocationPermissions() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var info = await deviceInfoPlugin.androidInfo;
      var sdk = info.version.sdkInt;
      if (sdk <= 30) {
        Completer<bool> completer = Completer();

        var isGranted = await Permission.location.request().isGranted;

        if (!isGranted && !(await Permission.location.request().isGranted)) {
          NotificationUtils.showSimpleAlert(
            title: "locationRequired".tr,
            message: "locationRequiredMessage".tr,
            confirmText: "goToSettings".tr,
            onConfirm: () async {
              // if (await Permission.location.isPermanentlyDenied) {
              // The user opted to never again see the permission request dialog for this
              // app. The only way to change the permission's status now is to let the
              // user manually enable it in the system settings.
              await openAppSettings();
              Get.back();
              completer.complete(await Permission.location.isGranted);
              // }
            },
          );

          return completer.future;
        }
      }
      return true;
    }

    return true;
  }
}
