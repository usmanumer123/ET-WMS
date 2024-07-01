import 'package:ET_WMS/src/controllers/signUp_controller.dart';
import 'package:get/get.dart';

class SignUpScreenBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<SingUpScreenController>(() => SingUpScreenController());
  }

}