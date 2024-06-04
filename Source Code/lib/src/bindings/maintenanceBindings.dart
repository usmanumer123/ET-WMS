import 'package:flutter_application_1/src/controllers/maintenanceController.dart';
import 'package:get/get.dart';

class MaintenanceBindings extends Bindings{
  @override
   void dependencies(){
    Get.lazyPut<MaintenanceController>(() => MaintenanceController());
  }
}