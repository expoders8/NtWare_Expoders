import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

import '../_common/custom_exception.dart';

class NewTEA {
  // static const _delta = 0x9E3779B9;

  static const int _sugar = 2654435769;
  // static const int _cups = 32;
  static const int _unsugar = 3337565984;

  const NewTEA();

  Uint8List? _toUint8List(Uint32List v, bool includeLength) {
    final length = v.length;
    var n = length << 2;
    if (includeLength) {
      final m = v[length - 1];
      n -= 4;
      if ((m < n - 3) || (m > n)) {
        return null;
      }
      n = m;
    }
    final bytes = Uint8List(n);
    for (var i = 0; i < n; ++i) {
      bytes[i] = v[i >> 2] >> ((i & 3) << 3);
    }
    return bytes;
  }

  Uint32List _toUint32List(Uint8List bytes, includeLength) {
    final length = bytes.length;
    var n = length >> 2;
    if ((length & 3) != 0) ++n;
    Uint32List v;
    if (includeLength) {
      v = Uint32List(n + 1);
      v[n] = length;
    } else {
      v = Uint32List(n);
    }
    for (var i = 0; i < length; ++i) {
      v[i >> 2] |= bytes[i] << ((i & 3) << 3);
    }
    return v;
  }

  // int _mx(int sum, int y, int z, int p, int e, Uint32List k) {
  //   return ((z >> 5 ^ y << 2) + (y >> 3 ^ z << 4)) ^
  //       ((sum ^ y) + (k[p & 3 ^ e] ^ z));
  // }

  Uint8List _fixkey(Uint8List key) {
    if (key.length < 16) {
      final k = Uint8List(16);
      k.setAll(0, key);
      return k;
    }
    return key.sublist(0, 16);
  }

  // int _int(int i) {
  //   return i & 0xFFFFFFFF;
  // }

  Uint32List _encryptUint32List(Uint32List v, Uint32List key) {
    int i;
    int v0;
    int v1;
    int sum;
    int n;
    i = 0;
    while (i < v.length) {
      n = 32;
      v0 = v[i];
      v1 = v[i + 1];
      sum = 0;
      while (n-- > 0) {
        sum += _sugar;
        v0 += (((((v1 << 4) + key[0]) ^ v1) + (sum ^ (v1 >> 5))) + key[1]);
        v1 += (((((v0 << 4) + key[2]) ^ v0) + (sum ^ (v0 >> 5))) + key[3]);
      }
      v[i] = v0;
      v[i + 1] = v1;
      i += 2;
    }

    return v;

//    final length = v.length;
//    final n = length - 1;
//    var y, z, sum, e, p, q;
//    z = v[n];
//    sum = 0;
//    for (q = 6 + (52 ~/ length); q > 0; --q) {
//      sum = _int(sum + _DELTA);
//      e = sum >> 2 & 3;
//      for (p = 0; p < n; ++p) {
//        y = v[p + 1];
//        z = v[p] = _int(v[p] + _mx(sum, y, z, p, e, k));
//      }
//      y = v[0];
//      z = v[n] = _int(v[n] + _mx(sum, y, z, p, e, k));
//    }
//    return v;
  }

  Uint32List _decryptUint32List(Uint32List v, Uint32List k) {
    int i;
    int v0;
    int v1;
    int sum;
    int n;
    i = 0;
    while (i < v.length) {
      n = 32;
      v0 = v[i];
      v1 = v[i + 1];
      sum = _unsugar;
      while (n-- > 0) {
        v1 -= (((((v0 << 4) + k[2]) ^ v0) + (sum ^ (v0 >> 5))) + k[3]);
        v0 -= (((((v1 << 4) + k[0]) ^ v1) + (sum ^ (v1 >> 5))) + k[1]);
        sum -= _sugar;
      }
      v[i] = v0;
      v[i + 1] = v1;
      i += 2;
    }

    return v;
//    final length = v.length;
//    final n = length - 1;
//    var y, z, sum, e, p, q;
//    y = v[0];
//    q = 6 + (52 ~/ length);
//    for (sum = _int(q * _DELTA); sum != 0; sum = _int(sum - _DELTA)) {
//      e = sum >> 2 & 3;
//      for (p = n; p > 0; --p) {
//        z = v[p - 1];
//        y = v[p] = _int(v[p] - _mx(sum, y, z, p, e, k));
//      }
//      z = v[n];
//      y = v[0] = _int(v[0] - _mx(sum, y, z, p, e, k));
//    }
//    return v;
  }

  Uint8List? encrypt(dynamic data, dynamic key, {bool includeLength = true}) {
    if (data is String) data = utf8.encode(data);
    if (key is String) key = utf8.encode(key);
    if (data == null || data.length == 0) {
      return data;
    }
    return _toUint8List(
        _encryptUint32List(_toUint32List(data, includeLength),
            _toUint32List(_fixkey(key), false)),
        false);
  }

  String encryptToString(dynamic data, dynamic key,
      {bool includeLength = true}) {
    return base64.encode(encrypt(data, key, includeLength: includeLength)!);
  }

  Uint8List? decrypt(dynamic data, dynamic key, {bool includeLength = true}) {
    if (data is String) data = base64.decode(data);
    if (key is String) key = utf8.encode(key);
    if (data == null || data.length == 0) {
      return data;
    }
    return _toUint8List(
        _decryptUint32List(
            _toUint32List(data, false), _toUint32List(_fixkey(key), false)),
        includeLength);
  }

  String decryptToString(dynamic data, dynamic key,
      {bool includeLength = true}) {
    return utf8.decode(decrypt(data, key, includeLength: includeLength)!);
  }

  static String quote =
      "Now rise, and show your strength. Be eloquent, and deep, and tender; see, with a clear eye, into Nature, and into life:  spread your white wings of quivering thought, and soar, a god-like spirit, over the whirling world beneath you, up through long lanes of flaming stars to the gates of eternity!";

  static void main() {
    const NewTEA tea = NewTEA();
    Uint8List crypt = tea.encrypt(quote, "And is there honey still for tea?")!;
    debugPrint("Encrypted: ${String.fromCharCodes(crypt)}");
    Uint8List result = tea.decrypt(crypt, "And is there honey still for tea?")!;
    String test = String.fromCharCodes(result);
    debugPrint("Decrypted: $test");
    if (!(test == quote)) {
      throw CustomException("Fail");
    }
  }
}
