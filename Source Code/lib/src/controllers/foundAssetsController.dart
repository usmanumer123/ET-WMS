import 'package:flutter_application_1/src/utils/helpers/db_helper.dart';

import 'package:get/get.dart';

class FoundAssetsController extends GetxController {
  DatabaseHelper db = Get.put(DatabaseHelper());
  List filterData = [];
  dynamic data = [];
  var arg = Get.arguments;
  RxBool isLoading = true.obs;
  // var scandata = arg;
  foundAssest() async {
    if (arg != null) {
      isLoading.value=true;
      data = await db.getTasks('assets');
      filterData = data
          .where((assets) => assets['productId']!
              .toString()
              .toLowerCase()
              .contains(arg.toLowerCase()))
          .toList();
    }
    isLoading.value=false;
  }

  @override
  void onInit() {
    foundAssest();
    super.onInit();
  }
}
