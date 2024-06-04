import 'package:flutter_application_1/src/controllers/historyController.dart';
import 'package:get/get.dart';

class HistoryBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}