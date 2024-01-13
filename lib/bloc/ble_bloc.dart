//import 'dart:async';
//import 'dart:io';
//
//import 'package:bloc/bloc.dart';
//import 'package:fimber/fimber.dart';
//import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
//import 'package:permission_handler/permission_handler.dart';
//import 'package:wave_id/common/app_data.dart';
//import 'package:wave_id/common/constants.dart';
//import 'package:wave_id/model/ble_device.dart';
//
//import './bloc.dart';
//
//class BleBloc extends Bloc<BleEvent, BleState> {
//  //final BleManager bleManager;
//  final FlutterReactiveBle bleInstance;
//
//  BleBloc({this.bleInstance});
//
//  @override
//  BleState get initialState => InitialBleState();
//
//  @override
//  Stream<BleState> mapEventToState(
//    BleEvent event,
//  ) async* {
//    if (event is OnStartBleScanning) {
//      try {
//        yield ScanDeviceState(scanningStatus: ScanDeviceStateEnum.UNKNOWN);
//
//        if (Platform.isAndroid) await Future.delayed(Duration(seconds: 5));
//
////        await bleManager.createClient(
////            restoreStateIdentifier: "example-restore-state-identifier",
////            restoreStateAction: (peripherals) {
////              peripherals?.forEach((peripheral) {
////                Fimber.d("Restored peripheral: ${peripheral.name}");
////              });
////            });
////
//        await _checkPermissions();
////
//
////
////        BluetoothState bluetoothState = await bleManager.bluetoothState();
//
////        if (bluetoothState.index != BluetoothState.POWERED_ON.index) {
////          yield ScanDeviceState(
////              scanningStatus: ScanDeviceStateEnum.BLUETOOTH_OFF);
////        }
//
//        //await _waitForBluetoothPoweredOn();
//
//        Fimber.d("Ble client created");
//
//        BleStatus status = await _checkBluetoothStatus();
//
//        if (status == BleStatus.poweredOff || status == BleStatus.unknown) {
//          yield ScanDeviceState(
//              scanningStatus: ScanDeviceStateEnum.BLUETOOTH_OFF);
//        } else {
//          StreamController<BleState> streamController = new StreamController();
//
//          StreamSubscription<DiscoveredDevice> scanSubscription;
//
//          scanSubscription = bleInstance.scanForDevices(
//              withServices: [Uuid.parse(Constants.UUID_RF_IDEAS_SERVICE_ID)],
//              scanMode: ScanMode.lowLatency).listen((scanResult) async {
//            if (!streamController.isClosed) {
//              //code for handling results
//              Fimber.d('found new device ${scanResult.name} '
//                  '${scanResult.id} '
//                  '${scanResult.manufacturerData.toString()}');
//
//              if (scanResult.name == Constants.DEVICE_NAME &&
//                  scanResult.rssi >= Constants.RSSI_LEVEL) {
//                // compare manufacturer data
//                bool matched = true;
//                for (int i = 0; i < Constants.MANUFACTURER_DATA.length; i++) {
//                  if (Constants.MANUFACTURER_DATA[i] !=
//                      scanResult.manufacturerData[i]) {
//                    matched = false;
//                    break;
//                  }
//                }
//
//                if (matched) {
//                  // match found
//                  streamController.add(ScanDeviceState(
//                      scanningStatus: ScanDeviceStateEnum.MATCH_FOUND,
//                      bleDevice: BleDevice(scanResult)));
//
//                  await streamController.close();
//
//                  await scanSubscription.cancel();
//                }
//              }
//            }
//          }, onError: (Object error) {
//            Fimber.d("exception", ex: error);
//          });
//
////        bleManager
////            .startPeripheralScan(scanMode: ScanMode.lowLatency)
////            .listen((ScanResult scanResult) async {
////          if (scanResult.advertisementData.localName == Constants.DEVICE_NAME &&
////              scanResult.rssi >= Constants.RSSI_LEVEL) {
////            Fimber.d(
////                'found new device ${scanResult.advertisementData.localName} '
////                '${scanResult.peripheral.identifier} '
////                '${scanResult.advertisementData.manufacturerData.toString()}');
////
////            bool matched = true;
////            for (int i = 0; i < Constants.MANUFACTURER_DATA.length; i++) {
////              if (Constants.MANUFACTURER_DATA[i] !=
////                  scanResult.advertisementData.manufacturerData[i]) {
////                matched = false;
////                break;
////              }
////            }
////
////            if (matched && !streamController.isClosed) {
////              // match found
////              streamController.add(ScanDeviceState(
////                  scanningStatus: ScanDeviceStateEnum.MATCH_FOUND,
////                  bleDevice: BleDevice(scanResult)));
////              streamController.close();
////              await bleManager.stopPeripheralScan();
////              //await bleManager.destroyClient();
////            }
////          }
////        });
//
//          yield ScanDeviceState(scanningStatus: ScanDeviceStateEnum.STARTED);
//
//          yield* streamController.stream;
//        }
//      } catch (e) {
//        yield ScanDeviceState(
//            scanningStatus: ScanDeviceStateEnum.ERROR, error: e);
//      }
//    }
//
//    if (event is OnStopBleScanning) {}
//
//    if (event is OnDeviceAuthRequest) {
//      try {
//        yield AuthDeviceState(authStatus: AuthDeviceStateEnum.UNKNOWN);
//
//        StreamController<BleState> streamController = new StreamController();
//        StreamSubscription<ConnectionStateUpdate> connectionStream;
//
//        connectionStream = bleInstance
//            .connectToAdvertisingDevice(
//          id: event.bleDevice.id,
//          withServices: [Uuid.parse(Constants.UUID_RF_IDEAS_SERVICE_ID)],
//          connectionTimeout: const Duration(seconds: 2),
//          prescanDuration: const Duration(seconds: 5),
//        )
//            .listen((connectionState) async {
//          // Handle connection state updates
//          if (!streamController.isClosed &&
//              connectionState.connectionState ==
//                  DeviceConnectionState.connected) {
//            streamController.add(
//                AuthDeviceState(authStatus: AuthDeviceStateEnum.CONNECTED));
//
//            // write
//            final characteristic = QualifiedCharacteristic(
//                serviceId: Uuid.parse(Constants.UUID_RF_IDEAS_SERVICE_ID),
//                characteristicId:
//                    Uuid.parse(Constants.WRITE_CHARACTERISTIC_UUID),
//                deviceId: event.bleDevice.id);
//            var valueToWrite = await AppStore.encodedIdentifier;
//            final response = await bleInstance.writeCharacteristicWithResponse(
//                characteristic,
//                value: valueToWrite);
//
//            // read value
//            final readCharacteristic = QualifiedCharacteristic(
//                serviceId: Uuid.parse(Constants.UUID_RF_IDEAS_SERVICE_ID),
//                characteristicId:
//                    Uuid.parse(Constants.READ_CHARACTERISTIC_UUID),
//                deviceId: event.bleDevice.id);
//            final value =
//                await bleInstance.readCharacteristic(readCharacteristic);
//
//            // check if valid
//            if (value[0] == 0x00) {
//              streamController.add(AuthDeviceState(
//                  authStatus: AuthDeviceStateEnum.UNAUTHENTICATED));
//            } else {
//              streamController.add(AuthDeviceState(
//                  authStatus: AuthDeviceStateEnum.AUTHENTICATED));
//            }
//
//            await streamController.close();
//            await connectionStream.cancel();
//          }
//        }, onError: (dynamic error) {
//          // Handle a possible error
//          Fimber.d("Error conneting/authenticating", ex: error);
//        });
//
//        yield* streamController.stream;
//
////        Peripheral peripheral = event.bleDevice.peripheral;
////        peripheral
////            .observeConnectionState(
////                emitCurrentValue: true, completeOnDisconnect: true)
////            .listen((connectionState) {
////          print(
////              "Peripheral ${event.bleDevice.peripheral.identifier} connection state is $connectionState");
////        });
////        await peripheral.connect();
////
////        bool connected = await peripheral.isConnected();
////
////        if (connected) {
////          yield AuthDeviceState(authStatus: AuthDeviceStateEnum.CONNECTED);
////
////          await peripheral.discoverAllServicesAndCharacteristics(
////              transactionId: "discovery");
////
////          List<Service> services = await peripheral.services();
////
////          //Fimber.d('services ${services}');
////
////          Service bleService;
////          for (int i = 0; i < services.length; i++) {
////            if (services[i].uuid.toUpperCase() ==
////                Constants.UUID_RF_IDEAS_SERVICE_ID) {
////              bleService = services[i];
////              break;
////            }
////          }
////
////          if (bleService == null) throw Exception('No matching service found.');
////
////          List<Characteristic> characteristics =
////              await bleService.characteristics();
////
////          Characteristic writeCharacteristic;
////          for (int i = 0; i < characteristics.length; i++) {
////            if (characteristics[i].uuid.toUpperCase() ==
////                Constants.WRITE_CHARACTERISTIC_UUID) {
////              writeCharacteristic = characteristics[i];
////              break;
////            }
////          }
////
////          if (writeCharacteristic == null)
////            throw Exception('No matching write characteristic found.');
////
////          Characteristic readCharacteristic;
////          for (int i = 0; i < characteristics.length; i++) {
////            if (characteristics[i].uuid.toUpperCase() ==
////                Constants.READ_CHARACTERISTIC_UUID) {
////              readCharacteristic = characteristics[i];
////              break;
////            }
////          }
////
////          if (readCharacteristic == null)
////            throw Exception('No matching read characteristic found.');
////
////          var valueToWrite = await AppStore.encodedIdentifier;
////
////          await writeCharacteristic.write(valueToWrite, true);
////
//////          var value = await peripheral.readCharacteristic(
//////            Constants.UUID_RF_IDEAS_SERVICE_ID,
//////            Constants.READ_CHARACTERISTIC_UUID,
//////          );
//////
//////          if (value.value[0] == 1) {
//////            yield AuthDeviceState(
//////                authStatus: AuthDeviceStateEnum.AUTHENTICATED);
//////          } else {
//////            yield AuthDeviceState(
//////                authStatus: AuthDeviceStateEnum.UNAUTHENTICATED);
//////          }
//////          var valueToWrite = await AppStore.encodedIdentifier;2DFB64482DB7D05
//////
//////          await peripheral.writeCharacteristic(
//////            Constants.UUID_RF_IDEAS_SERVICE_ID,
//////            Constants.WRITE_CHARACTERISTIC_UUID,
//////            valueToWrite,
//////            false,
//////          );
//////
////          var value = await readCharacteristic.read();
////
////          Fimber.d('readCharacteristic $value');
////
////          if (value[0] == 0x00) {
////            yield AuthDeviceState(
////                authStatus: AuthDeviceStateEnum.UNAUTHENTICATED);
////          } else {
////            yield AuthDeviceState(
////                authStatus: AuthDeviceStateEnum.AUTHENTICATED);
////          }
////        }
//      } catch (e) {
//        yield AuthDeviceState(
//            authStatus: AuthDeviceStateEnum.ERROR, error: e.toString());
//      }
//    }
//  }
//
//  Future<BleStatus> _checkBluetoothStatus() async {
//    Completer<BleStatus> completer = Completer();
//    StreamSubscription<BleStatus> bleStatusSubscription;
//    bleStatusSubscription = bleInstance.statusStream.listen((status) async {
//      //code for handling status update
//      if (status != BleStatus.unknown) {
//        await bleStatusSubscription.cancel();
//        completer.complete(status);
//      }
//    });
//    return completer.future;
//  }
//
////  Future<void> _waitForBluetoothPoweredOn() async {
////    Completer completer = Completer();
////    StreamSubscription<BluetoothState> subscription;
////    subscription = bleManager
////        .observeBluetoothState(emitCurrentValue: true)
////        .listen((bluetoothState) async {
////      if (bluetoothState == BluetoothState.POWERED_ON &&
////          !completer.isCompleted) {
////        await subscription.cancel();
////        completer.complete();
////      }
////    });
////    return completer.future;
////  }
////
//  Future<void> _checkPermissions() async {
//    if (Platform.isAndroid) {
//      //Permission.location.status
//      if (await Permission.location.request().isGranted) {
//        Fimber.d(
//            "Either the permission was already granted before or the user just granted it.");
//      } else {
//        return Future.error(Exception("Location permission not granted"));
//      }
//    }
//  }
////
////  void _startScan() {
////    Fimber.d("Ble client created");
////
////    bleManager.startPeripheralScan().listen((ScanResult scanResult) {
////      //var bleDevice = BleDevice(scanResult);
////      if (scanResult.advertisementData.localName != null) {
////        Fimber.d(
////            'found new device ${scanResult.advertisementData
////                .localName} ${scanResult.peripheral.identifier}');
//////        bleDevices.add(bleDevice);
//////        _visibleDevicesController.add(bleDevices.sublist(0));
////        // TODO Check for device
////      }
////    });
////  }
//}
