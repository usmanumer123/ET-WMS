import 'package:flutter_application_1/src/controllers/addAsset_controller.dart';
import 'package:get/get.dart';

class AddAssetBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AddAssetsController>(() => AddAssetsController());
  }

}