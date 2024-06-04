import 'package:flutter_application_1/src/ui/view/dashboard.dart';
import 'package:flutter_application_1/src/utils/helpers/db_helper.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  DatabaseHelper db = Get.put(DatabaseHelper());
  RxBool assetsCheck=false.obs;

  RxList assets = [].obs;
  RxBool isLoading = true.obs;
  late List<ChartData> data;

  @override
  void onInit() async {
    super.onInit();
    data = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 80),
      ChartData('Others', 52)
    ];
    getData();
  }

  getData() async {
    isLoading.value = true;
    assets.value = await db.getTasks('assets');
    isLoading.value = false;
  }
}
