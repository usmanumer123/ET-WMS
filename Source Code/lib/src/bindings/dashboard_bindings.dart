import 'package:ET_WMS/src/controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardBindings extends Bindings{
    @override
  void dependencies(){
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}