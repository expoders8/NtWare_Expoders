import 'dart:typed_data';
import 'dart:ui';

class Constants {
  static const int rssiLevel = -65;

  static const String deviceName = "RFIDeas";
  static const int manufacturerId = 65282;

  static const String uuidRfIdeasServiceId =
      "0000A800-0000-1000-8000-00805F9B0C27";
  static const String writeCharacteristicUuid =
      "0000AA00-0000-1000-8000-00805F9B0C27";
  static const String readCharacteristicUuid =
      "0000AC00-0000-1000-8000-00805F9B0C27";

  static const String encryptionKey = "706350726F7820506C757320426C6520";

  static final Uint8List manufacturerData = Uint8List.fromList([
    2,
    255,
    0,
    17,
    34,
    51,
    68,
    85,
    102,
    119,
    136,
    153,
    170,
    187,
    204,
    221,
    238,
    255,
    0,
    1
  ]);

//new byte[]{(byte)0x00, (byte)0x11, (byte)0x22, (byte)0x33, (byte)0x44, (byte)0x55, (byte)0x66, (byte)0x77, (byte)0x88, (byte)0x99, (byte)0xAA, (byte)0xBB, (byte)0xCC, (byte)0xDD, (byte)0xEE, (byte)0xFF, (byte)0x00, (byte)0x01};

  static const String parseOrigin = "https://parse-dashboard.back4app.com";
  static const String parseAppId = "EBiq6WcYUr7orU7Px8KeWdqHBZtC32lsWPrvPwSb";
  static const String parseClientKey =
      'Vhf9iMSmwVVxRZGA0PNFzjbpkKfQUikvDku2roRC';

  ///
  static const blueTitle = Color(0xFF17344D);

  ///
  static const blackText = Color(0xFF525252);

  ///
  static const redDark = Color(0xFFB30D0B);

  ///
  static const redLight = Color(0xFFFFAEAD);

  ///
  static const primaryActionButton = Color(0xFF004B8C);

  ///
  static const disableColor = Color(0xFF8D8D8D);

  ///
  static const titleSize = 18.0;

  ///
  static const defaultSize = 16.0;

  ///
  static const phoneSvgImage = "assets/ntware/svg/Phone.svg";
}
