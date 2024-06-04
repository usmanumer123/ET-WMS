import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:flutter_blue/flutter_blue.dart';

class DeviceScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  List<BluetoothDevice> pairedDevices = [];
  bool isScanning = true;

  @override
  void initState() {
    super.initState();
    _loadPairedDevices();
    _startScanning();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: appbar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PAIRED DEVICES',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Divider(
              color: UIDataColors.commonColor,
              thickness: 3,
              indent : 0,
              endIndent : 280,
            ),
            SizedBox(height: 30,),
            Container(
              height: 200,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/logos/page-not-found.png',height: 100,width: 100,)),
                  Text("No paired device found"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('AVAILABLE DEVICE',style: TextStyle(fontSize: 16),),
                SizedBox(width: 10,),
                isScanning ? CircularProgressIndicator() : SizedBox(),

                Spacer(),
                IconButton(
                  icon:  Icon(Icons.refresh,color: UIDataColors.commonColor,),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    _startScanning(); // Call the scanning function again
                  },
                ),
              ],
            ),
            Divider(
              color: UIDataColors.commonColor,
              thickness: 3,
              indent : 0,
              endIndent : 280,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: pairedDevices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(pairedDevices[index].name),
                  subtitle: Text(pairedDevices[index].id.toString()),
                );
              },
            ),
            // SizedBox(height: 20),
            // Center(child: isScanning ? CircularProgressIndicator() : SizedBox()),
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
  void _loadPairedDevices() {
    flutterBlue.connectedDevices.then((devices) {
      setState(() {
        pairedDevices = devices;
      });
    });
  }

  void _startScanning() {
    setState(() {
      isScanning = true;
    });
    pairedDevices.clear(); // Clear previously scanned devices
    flutterBlue.startScan();
    Timer(Duration(seconds: 5), () {
      flutterBlue.stopScan();
      setState(() {
        isScanning = false;
      });
    });
    flutterBlue.scanResults.listen((results) {
      // Do something with scan results
      setState(() {
        // Handle scan results
      });
    });
  }
}
