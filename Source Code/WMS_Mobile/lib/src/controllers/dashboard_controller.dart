
import 'package:ET_WMS/src/utils/helpers/db_helper.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  DatabaseHelper db = Get.put(DatabaseHelper());
  RxBool assetsCheck=false.obs;

  RxList assets = [].obs;
  RxBool isLoading = true.obs;


  @override
  void onInit() async {
    super.onInit();
  
    getData();
  }

  getData() async {
    isLoading.value = true;
    assets.value = await db.getTasks('assets');
    isLoading.value = false;
  }
}
