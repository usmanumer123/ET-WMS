// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/scan_controller.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';


class ScanScreen extends StatelessWidget {
  final ScanController controller = Get.put(ScanController());
  static  RxString selectedValue = 'selectedValue'.obs;
  static  RxString selectedValue2 = 'selectedValue2'.obs;
  static  RxString selectedValue3 = 'selectedValue3'.obs;
  RxString selectedRadio = ''.obs;
  void setSelectedRadio(String value) {

  }

  // get title => null;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: appbar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Scan Option',
                  style: TextStyle(fontSize: 16,color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(child: RadioListTile(
                            title: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/logos/rfid_reader.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(width: 20),
                                  Text('Scan with RFID Reader'),
                                ],
                            ),
                            value: 'Option1',
                            groupValue: controller.selectedRadio.value,
                            onChanged: (value) {
                              controller.setSelectedRadio(value as String);
                              print('Selected Radio Value: ${controller.selectedRadio.value}');
                            },
                          ),
                          ),
                        ],
                      ),
                      Center(child: Text('No Device is connected', style: TextStyle(fontSize: 14,color: Colors.grey),)),
                      Divider(
                        thickness: 0,
                        color: Colors.grey.shade500,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){Get.toNamed(Routes.bluetooth);}, icon: Icon(Icons.settings,color: UIDataColors.commonColor,)),
                            Text('CONNECT DEVICE'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Flexible(child: RadioListTile(
                        title: Row(
                          children: [
                            Image.asset(
                              'assets/images/logos/barcode.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(width: 20),
                            Text('Scan with camera'),
                          ],
                        ),
                        value: 'Option2',
                        groupValue: controller.selectedRadio.value,
                        onChanged: (value) {
                          controller.setSelectedRadio(value as String);
                          controller.update();
                          print('Selected Radio Value: ${controller.selectedRadio.value}');
                        },
                      ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Column(
                        children:[
                          RadioListTile(
                            title:  Text('Inventory Scan'),
                            value: selectedValue.value,
                            groupValue: selectedRadio.value,
                            onChanged: (value) {
                              selectedRadio.value=value!;
                              // setSelectedRadio(value as String);
                            },
                          ),
                          RadioListTile(
                            title:  Text('Bulk Scan'),
                            value: selectedValue2.value,
                            groupValue: selectedRadio.value,
                            onChanged: (value) {
                              selectedRadio.value=value!;
                              // setSelectedRadio(value as String);
                            },
                          ),
                          RadioListTile(
                            title: const Text('Audit Scan'),
                            value: selectedValue3.value,
                            groupValue: selectedRadio.value,
                            onChanged: (value) {
                              selectedRadio.value=value!;
                              print('Selected value${selectedRadio.value}');
                              // setSelectedRadio(value as String);
                            },
                          ),
                        ],
                      ),
                      if(selectedRadio.value!="selectedValue3")
                        Obx(
                            () => Visibility(
                          visible: controller.showTextField.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Choose Site and Location to start scan',
                                  style: TextStyle(fontSize: 16,color: Colors.grey)),
                              SizedBox(height: 10),
                              TextFormFildWidgets(
                                title: 'Site',
                                icon: Icons.keyboard_arrow_down_sharp,
                                txtcontroller: controller.siteController,
                                onPressd: () {
                                  controller.siteController.clear();
                                  Get.defaultDialog(
                                    title: 'Site',
                                    content: Text('No option for Depreciation Method'),
                                  );
                                },
                              ),
                              SizedBox(height: 20),
                              TextFormFildWidgets(
                                title: 'Location',
                                icon: Icons.keyboard_arrow_down_sharp,
                                txtcontroller: controller.locationController,
                                onPressd: () {
                                  controller.locationController.clear();
                                  Get.defaultDialog(
                                    title: 'Location',
                                    content: Text('No option for Depreciation Method'),
                                  );
                                },
                              ),
                              // Text('Barcode Result: ${controller.result.value}'),
                            ],
                          ),
                        ),
                      ),
                      if(selectedRadio.value=="selectedValue3")
                        TextFormFildWidgets(
                          title: 'File',
                          icon: Icons.keyboard_arrow_down_sharp,
                          txtcontroller: controller.locationController,
                          onPressd: () {
                            controller.locationController.clear();
                            Get.defaultDialog(
                              title: 'File',
                              content: Text('No option for Depreciation Method'),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                      onPressed: controller.startScan,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: const Text(
                        'Scan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
            "ASSET AUDIT",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
