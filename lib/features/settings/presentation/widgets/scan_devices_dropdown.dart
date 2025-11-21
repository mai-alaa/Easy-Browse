import 'package:easy_browse/features/settings/presentation/cubits/scan_devices/scan_devices_cubit.dart';
import 'package:easy_browse/features/settings/presentation/cubits/scan_devices/scan_devices_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanDevices extends StatelessWidget {
  const ScanDevices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final cubit = BlocProvider.of<DeviceCubit>(context);
        
        await cubit.scanAllDevices();
      },
      child: BlocBuilder<DeviceCubit, DeviceState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<DeviceCubit>(context);
    
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              value: state.selectedDevice,
              hint: const Text('Tap to Scan Devices'),
              isExpanded: true,
              underline: const SizedBox(), 
              items: state.devices.isEmpty
      ? [
          const DropdownMenuItem(
            value: null,
            enabled: false,
            child: Text('No devices found'),
          )
        ]
      : state.devices
          .map((device) => DropdownMenuItem(
                value: device,
                child: Text(device),
              ))
          .toList(),
              onChanged: state.devices.isEmpty
      ? null
      : (val) {
          if (val != null) cubit.selectDevice(val);
        },
            ),
          );
        },
      ),
    );
  }
}