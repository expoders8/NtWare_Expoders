//import 'package:meta/meta.dart';
//
//@immutable
//abstract class BleState {}
//
//class InitialBleState extends BleState {}
//
//class ScanDeviceState extends BleState {
//  final dynamic bleDevice;
//  final ScanDeviceStateEnum scanningStatus;
//  final String error;
//
//  ScanDeviceState({
//    this.bleDevice,
//    this.scanningStatus,
//    this.error,
//  });
//}
//
//class AuthDeviceState extends BleState {
//  final dynamic bleDevice;
//  final AuthDeviceStateEnum authStatus;
//  final String error;
//
//  AuthDeviceState({
//    this.bleDevice,
//    this.authStatus,
//    this.error,
//  });
//}
//
//enum ScanDeviceStateEnum {
//  UNKNOWN,
//  STARTED,
//  STOPPED,
//  NOT_STARTED,
//  ERROR,
//  MATCH_FOUND,
//  BLUETOOTH_OFF
//}
//
//enum AuthDeviceStateEnum {
//  UNKNOWN,
//  CONNECTED,
//  AUTHENTICATED,
//  UNAUTHENTICATED,
//  DISCONNECTED,
//  ERROR
//}
