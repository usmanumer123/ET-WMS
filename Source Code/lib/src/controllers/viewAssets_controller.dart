import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/helpers/db_helper.dart';

import 'package:get/get.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ViewAssetsController extends GetxController {
  DatabaseHelper db = Get.put(DatabaseHelper());
  dynamic data = [];
  RxBool isLoading = true.obs;
  // final RxString result = ''.obs;
  List check=[];

  dynamic scanId = '';
  scanData(id) {
    isLoading.value = true;
    // scanId = id;
    check.add(id);
    bool foundCheck=false;
    for (var i = 0; i < data.length; i++) {
      print(data.length);
      if (id == data[i]['productId']) {
        print(i);

        foundCheck=true;
        dynamic obj = data[i];
        print(obj);
        data.removeAt(i);
        data.insert(0, obj);
        break;
      }
    }
    if(!foundCheck) {
      print('not found');
      Get.defaultDialog(
        title: "Oops'Not Found",
        content: Text('Please Try Again'),

      );
    }
    isLoading.value = false;
  }

  @override
  void onInit() async {
    getData();
    super.onInit();
  }

  Future<void> viewAsset() async {

    var res = await Get.to<String>(() => SimpleBarcodeScannerPage());
    print(res);
    if (res != null) {
      scanData(res);
    }
  }

  getData() async {
    List all = await db.getTasks('assets');
    data =List.from(all);
    isLoading.value = false;
  }
}
