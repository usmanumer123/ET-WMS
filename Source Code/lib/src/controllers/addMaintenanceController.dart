import 'package:get/get.dart';

class AddMaintenanceController extends GetxController {
  final Rx<String> selectedValue = RxString('initial_value');
  final Rx<String> selectedValue2 = RxString('initial_valu');
var checkbox=false.obs;
  var repeatingCheck = false.obs;

  var monthlyCheck = ''.obs;

  void onRadioSelected(String value) {
    if (value == 'Yes') {
      repeatingCheck.value = true;
    }
    if (value == 'No') {
      repeatingCheck.value = false;
    }

    selectedValue.value = value;
    print(value);
    // update();
  }

  void radioSelected2(String value) {
    if (value == 'daily') {
      monthlyCheck.value = 'daily';
    }
    if (value == 'weekly') {
      monthlyCheck.value = 'weekly';
    }
    if (value == 'monthly') {
      monthlyCheck.value = 'monthly';
    }
    if (value == 'yearly') {
      monthlyCheck.value = 'yearly';
    }
    selectedValue2.value = value;

    print(value);
  }
}
