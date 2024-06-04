import 'package:flutter_application_1/src/controllers/signUp_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SingUpScreenController>(() => SingUpScreenController());
  }

}