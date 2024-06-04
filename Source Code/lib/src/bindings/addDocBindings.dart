import 'package:flutter_application_1/src/controllers/addDocController.dart';
import 'package:get/get.dart';

class AddDocBindings extends Bindings{
  @override 
  void dependencies(){
    Get.lazyPut<AddDocController>(() => AddDocController());
  }
}