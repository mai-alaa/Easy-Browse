
class DeviceState {
  final List<String> devices;
  final String? selectedDevice;

  DeviceState({this.devices = const [], this.selectedDevice});

  DeviceState copyWith({List<String>? devices, String? selectedDevice}) {
    return DeviceState(
      devices: devices ?? this.devices,
      selectedDevice: selectedDevice ?? this.selectedDevice,
    );
  }
}
