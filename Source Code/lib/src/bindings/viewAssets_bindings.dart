import 'package:flutter_application_1/src/controllers/viewAssets_controller.dart';
import 'package:get/get.dart';

class ViewAssetsBindings extends Bindings{
    @override
  void dependencies(){
    Get.lazyPut<ViewAssetsController>(() => ViewAssetsController());
  }
}