import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_browse/features/settings/presentation/cubits/scan_devices/scan_devices_state.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:wifi_scan/wifi_scan.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(DeviceState());

  /// Scan WiFi devices
  Future<void> scanWiFi() async {
    try {
      // Start WiFi scan
      await WiFiScan.instance.startScan();
      
      // Get scan results
      final results = await WiFiScan.instance.getScannedResults();
      
      // Extract SSIDs
      final ssids = results
          .map((e) => e.ssid)
          .where((ssid) => ssid.isNotEmpty)
          .toSet() 
          .toList();

      final allDevices = [...state.devices];
      for (var ssid in ssids) {
        if (!allDevices.contains(ssid)) {
          allDevices.add('WiFi: $ssid');
        }
      }
      emit(state.copyWith(devices: allDevices.toSet().toList()));

     
      log('WiFi scan completed: ${ssids.length} networks found');
    } catch (e) {
      log('WiFi scan error: $e');
    }
  }

  /// Scan Bluetooth devices
  Future<void> scanBluetooth() async {
    try {
        FlutterBlue flutterBlue = FlutterBlue.instance;
        List<String> btDevices = [...state.devices]; 

        flutterBlue.scan(timeout: const Duration(seconds: 5)).listen((scanResult) {
          final name = scanResult.device.name;
          if (name.isNotEmpty && !btDevices.contains('BT: $name')) {
            btDevices.add(' $name');
            emit(state.copyWith(devices: btDevices));
          }
        });
        
        log('Bluetooth scan started');
   
    } catch (e) {
      log('Bluetooth scan error: $e');
    }
  }

  /// Scan both WiFi and Bluetooth
  Future<void> scanAllDevices() async {
    emit(state.copyWith(devices: [])); // Clear previous results
    await Future.wait([
      scanBluetooth(),
      scanWiFi(),
    ]);
  }

  void selectDevice(String device) {
    emit(state.copyWith(selectedDevice: device));
  }
}