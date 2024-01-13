import 'dart:io';
import 'package:sprintf/sprintf.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../features/_common/tea.dart';
import '../features/_common/constants.dart';

class TeaHelper {
  static _encryptWithTea(String value) {
    List<int> block = List.filled(2, 0);
    List<int> key = List.filled(4, 0);

    block[0] = int.parse(value.substring(7, 15), radix: 16);
    block[1] = int.parse(value.substring(0, 7), radix: 16);

    key[0] = int.parse(Constants.encryptionKey.substring(24, 32), radix: 16);
    key[1] = int.parse(Constants.encryptionKey.substring(16, 24), radix: 16);
    key[2] = int.parse(Constants.encryptionKey.substring(8, 16), radix: 16);
    key[3] = int.parse(Constants.encryptionKey.substring(0, 8), radix: 16);

    _encrypt(block, key);

    String encrypted = "";

    encrypted += _intArrayToHexString(block);

    List<String?> newData = List.filled(encrypted.length, null);

    for (int i = 0; i < (encrypted.length - 1); i += 2) {
      newData[i + 1] = encrypted[i];
      newData[i] = encrypted[i + 1];
    }

    String reverseStr = "";
    for (int i = newData.length; i > 0; i--) {
      reverseStr += newData[i - 1]!;
    }

    return reverseStr;
  }

  static _encrypt(List<int> block, List<int> key) {
    int i = block[0];
    int j = block[1];

    int sum = 0;
    int delta = 0x9e3779b9;

    for (int k = 0; k < 32; ++k) {
      sum += delta;

      i += (((j << 4) & 0xfffffff0) + key[0]) ^
          (j + sum) ^
          (((j >> 5) & 0x7ffffff) + key[1]);
      j += (((i << 4) & 0xfffffff0) + key[2]) ^
          (i + sum) ^
          (((i >> 5) & 0x7ffffff) + key[3]);
    }

    block[0] = i;
    block[1] = j;
  }

  static String _intArrayToHexString(List<int?> block) {
    String output = "";
    for (int i = 0; i < block.length; i++) {
      output += sprintf("%02x%02x%02x%02x", [
        block[i]! & 0xff,
        block[i]! >> 8 & 0xff,
        block[i]! >> 16 & 0xff,
        block[i]! >> 24 & 0xff
      ]);
    }
    return output;
  }

  static Uint8List _hexStringToByteArray(String s) {
    int len = s.length;
    Uint8List data = Uint8List(len ~/ 2);

    for (int i = 0; i < len; i += 2) {
      data[i ~/ 2] =
          (int.parse(s[i], radix: 16) << 4) + int.parse(s[i + 1], radix: 16);
    }

    return data;
  }

  static Future<String> getDeviceIdentifier() async {
    String? identifier;
    try {
      if (Platform.isAndroid) {
        identifier = await const AndroidId().getId();
        // var build = await deviceInfoPlugin.androidInfo;
        // identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await DeviceInfoPlugin().iosInfo;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      debugPrint('Failed to get platform version');
    }

    List<int> num = TEA.encode(identifier!);

    String id = int.parse(num.join().substring(0, 20)).toString();

    id = id.length > 15 ? id.substring(0, 15) : id; //"757a2b7f05f6c3a4";

    return id;
  }

  static getIdentifierAsUInt8List(String identifier) async {
    TEA.encode(identifier);

    var encryptedIdentifier = _encryptWithTea(identifier);

    var byteArray = _hexStringToByteArray(encryptedIdentifier);

    var finalArray = Uint8List(20);

    finalArray[0] = 0x40; //int.parse('0x04', radix: 0); //64

    for (int i = 1; i <= 8; i++) {
      finalArray[i] = byteArray[i - 1];
    }

    for (int i = 9; i <= 19; i++) {
      finalArray[i] = 0x00;
    } //int.parse('0x00', radix: 0);

    return finalArray;
  }
}
