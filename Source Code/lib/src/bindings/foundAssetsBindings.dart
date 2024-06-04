import 'package:flutter_application_1/src/controllers/foundAssetsController.dart';
import 'package:get/get.dart';

class FoundAssetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoundAssetsController>(() => FoundAssetsController());
  }
}
