import 'package:flutter_application_1/src/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginScreenBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }

}