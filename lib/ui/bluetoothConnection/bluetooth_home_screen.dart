import 'package:api_sample_flutter/ui/bluetoothConnection/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothHomeScreen extends StatelessWidget {

  late BluetoothCharacteristic characteristics;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BluetoothController>(
        init: BluetoothController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.0,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Bluetooth App',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: controller.scanDevices,
                    child: const Text(
                      'Scan Device',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                StreamBuilder<List<ScanResult>>(
                  // stream: controller.scanResults,
                  stream: null,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
                          return Card(
                            elevation: 2.0,
                            child: ListTile(
                              onTap: () {
                                connectToDevice(data.device);
                              },
                              title: Text(
                                data.device.name,
                              ),
                              subtitle: Text(
                                data.device.id.id,
                              ),
                              trailing: Text(
                                data.rssi.toString(),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No Devices Found!',
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void connectToDevice(BluetoothDevice device) async {
    if (device == null) return;
    await device.connect(autoConnect: true);

    List<BluetoothService> services = await device.discoverServices();
    services.forEach((element) {
      element.characteristics.forEach((characteristics) {
        // if (characteristics.deviceId.toString() == 'E1:6E:47:D9:E2:4F') {
          this.characteristics = characteristics;
          print("Characteristics::::: $characteristics");
        // }
      });
    });
  }
}