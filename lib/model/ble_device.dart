import 'package:collection/collection.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class BleDevice {
  final DiscoveredDevice device;
  final String name;

  String get id => device.id;

  BleDevice(DiscoveredDevice scanResult)
      : device = scanResult,
        name = scanResult.name;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) =>
      other is BleDevice &&
      compareAsciiLowerCase(name, other.name) == 0 &&
      id == other.id;

  @override
  String toString() {
    return 'BleDevice{name: $name}';
  }
}
