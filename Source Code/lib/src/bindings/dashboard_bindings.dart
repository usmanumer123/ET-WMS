import 'package:flutter_application_1/src/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings{
    @override
  void dependencies(){
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}