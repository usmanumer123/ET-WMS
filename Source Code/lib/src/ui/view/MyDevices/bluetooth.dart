import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/view/MyDevices/deviceScan.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _BluetoothScreenState createState() => _BluetoothScreenState();
}

class _BluetoothScreenState extends State<BluetoothScreen> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  bool isBluetoothOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Image.asset('assets/images/logos/bluetooth.png',height: 250,width: 250,),
            Text('Turn on Bluetooth to connect to nearby devices'),
            SizedBox(height: 10,),
            Switch(
              value: isBluetoothOn,
              onChanged: (value) {
                setState(() {
                  isBluetoothOn = value;
                  if (isBluetoothOn) {
                    _turnOnBluetooth();
                  } else {
                    _turnOffBluetooth();
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
  PreferredSize appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.0,
              blurRadius: 3.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: AppBar(
          title: Text(
            'MY DEVICES',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ),
    );
  }

  void _turnOnBluetooth() async {
    await flutterBlue.state.firstWhere((state) => state == BluetoothState.on);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DeviceScreen(),
      ),
    );
  }

  void _turnOffBluetooth() {
    print('Bluetooth turned off');
  }
}
