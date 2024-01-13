import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../_common/custom_exception.dart';

class TEA {
  static const int _sugar = 0x9E3779B9;
  static const int _cups = 32;
  static const int _unsugar = 0xC6EF3720;

  final List<int?> _key = List.filled(4, null);

  static TEA? tea;

  TEA(Uint8List key) {
    // if (key == null) throw new Exception("Invalid key: Key was null");
    if (key.length < 16) {
      throw CustomException("Invalid key: Length was less than 16 bytes");
    }

    for (int off = 0, i = 0; i < 4; i++) {
      _key[i] = ((key[off++] & 0xff)) |
          ((key[off++] & 0xff) << 8) |
          ((key[off++] & 0xff) << 16) |
          ((key[off++] & 0xff) << 24);
    }
  }

  void pack(Uint8List src, List<int?> dest, int destOffset) {
// 		assert destOffset + (src.length / 4) <= dest.length;
    int i = 0, shift = 24;
    int j = destOffset;
    dest[j] = 0;
    while (i < src.length) {
      dest[j] = ((src[i] & 0xff) << shift) | dest[j]!;
      if (shift == 0) {
        shift = 24;
        j++;
        if (j < dest.length) dest[j] = 0;
      } else {
        shift -= 8;
      }
      i++;
    }
  }

  Uint8List unpack(List<int?> src, int srcOffset, int destLength) {
// 		assert destLength <= (src.length - srcOffset) * 4;
    Uint8List dest = Uint8List(destLength);
    int i = srcOffset;
    int count = 0;
    for (int j = 0; j < destLength; j++) {
      dest[j] = ((src[i]! >> (24 - (8 * count))) & 0xff);
      count++;
      if (count == 4) {
        count = 0;
        i++;
      }
    }
    return dest;
  }

  void brew(List<int?> buf) {
// 		assert buf.length % 2 == 1;
    int i = 1, v0, v1, sum, n;
    while (i < buf.length) {
      n = _cups;
      v0 = buf[i]!;
      v1 = buf[i + 1]!;
      sum = 0;
      while (n-- > 0) {
        sum += _sugar;
        v0 += ((v1 << 4) + _key[0]! ^ v1) +
            (sum ^ ((v1 & 0xffffffff) >> 5)) +
            _key[1]!;
        v1 += ((v0 << 4) + _key[2]! ^ v0) +
            (sum ^ ((v0 & 0xffffffff) >> 5)) +
            _key[3]!;
      }
      buf[i] = v0;
      buf[i + 1] = v1;
      i += 2;
    }
  }

  void unbrew(List<int?> buf) {
// 		assert buf.length % 2 == 1;
    int i = 1, v0, v1, sum, n;
    while (i < buf.length) {
      n = _cups;
      v0 = buf[i]!;
      v1 = buf[i + 1]!;
      sum = _unsugar;
      while (n-- > 0) {
        v1 -= ((v0 << 4) + _key[2]! ^ v0) +
            (sum ^ ((v0 & 0xffffffff) >> 5)) +
            _key[3]!;
        v0 -= ((v1 << 4) + _key[0]! ^ v1) +
            (sum ^ ((v1 & 0xffffffff) >> 5)) +
            _key[1]!;
        sum -= _sugar;
      }
      buf[i] = v0;
      buf[i + 1] = v1;
      i += 2;
    }
  }

  Uint8List encrypt(Uint8List clear) {
    int paddedSize =
        ((clear.length ~/ 8) + (((clear.length % 8) == 0) ? 0 : 1)) * 2;
    List<int?> buffer = List.filled(paddedSize + 1, null);
    buffer[0] = clear.length;
    pack(clear, buffer, 1);
    brew(buffer);
    return unpack(buffer, 0, buffer.length * 4);
  }

  Uint8List decrypt(Uint8List crypt) {
// 		assert crypt.length % 4 == 0;
// 		assert (crypt.length / 4) % 2 == 1;
    List<int?> buffer = List.filled(crypt.length ~/ 4, null);
    pack(crypt, buffer, 0);
    unbrew(buffer);
    return unpack(buffer, 1, buffer[0]!);
  }

//  static String _intArrayToHexString(List<int> block) {
//    String output = "";
//    for (int i = 0; i < block.length; i++) {
//      output += sprintf("%02x%02x%02x%02x", [
//        block[i] & 0xff,
//        block[i] >> 8 & 0xff,
//        block[i] >> 16 & 0xff,
//        block[i] >> 24 & 0xff
//      ]);
//    }
//    return output;
//  }

  // static Uint8List _hexStringToByteArray(String s) {
  //   int len = s.length;
  //   Uint8List data = new Uint8List(len ~/ 2);

  //   for (int i = 0; i < len; i += 2) {
  //     data[i ~/ 2] =
  //         (int.parse(s[i], radix: 16) << 4) + int.parse(s[i + 1], radix: 16);
  //   }

  //   return data;
  // }

  static Uint8List encode(String data) {
    tea ??=
        TEA(Uint8List.fromList("706350726F7820506C757320426C6520".codeUnits));

    var enc = tea!.encrypt(Uint8List.fromList(data.codeUnits));

    debugPrint("enc = ${String.fromCharCodes(enc.toList())}");

    return enc;
  }

  static Uint8List decode(String data) {
    tea ??=
        TEA(Uint8List.fromList("706350726F7820506C757320426C6520".codeUnits));

    return tea!.decrypt(Uint8List.fromList(data.codeUnits));
  }

  // static void main() {
  //   String quote = "757a2b7f05f6c3a4";

  //   print(quote);

  //   TEA tea =
  //       TEA(Uint8List.fromList("706350726F7820506C757320426C6520".codeUnits));

  //   print("1");

  //   Uint8List original = Uint8List.fromList(quote.codeUnits);

  //   print("2");

  //   /* Run it through the cipher... and back */
  //   Uint8List crypt = tea.encrypt(original);

  //   print("3");

  //   print("enc = ${String.fromCharCodes(crypt.toList())}");

  //   Uint8List result = tea.decrypt(crypt);

  //   /* Ensure that all went well */
  //   print("enc = ${String.fromCharCodes(result)}");
  // }
}
