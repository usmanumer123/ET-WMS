import 'package:flutter_application_1/src/controllers/addMaintenanceController.dart';
import 'package:get/get.dart';

class AddMaintenanceBindings extends Bindings{
  @override 
  void dependencies(){
    Get.lazyPut<AddMaintenanceController>(() => AddMaintenanceController());
  }
}