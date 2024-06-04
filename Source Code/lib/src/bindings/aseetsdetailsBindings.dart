import 'package:flutter_application_1/src/controllers/assetsDetailsController.dart';
import 'package:get/get.dart';

class AssetsDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssetsDetailsController>(() => AssetsDetailsController());
  }
}
