import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MaintenanceController extends GetxController with GetSingleTickerProviderStateMixin{

 final RxInt selectedIndex = RxInt(0);

  late final TabController tabController = TabController(vsync: this, length: 2); 
  final Rx<String> selectedValue = RxString('initial_value'); 

  void onRadioSelected(String value) {
    selectedValue.value = value;
    print(value);
    // update();
  }

  @override
  void onInit() {
    super.onInit();
    update(); 
  }

  @override
  void dispose() {
    tabController.dispose(); 
    super.dispose();
  }

}