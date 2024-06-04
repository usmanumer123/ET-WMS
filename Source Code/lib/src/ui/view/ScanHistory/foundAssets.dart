import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/foundAssetsController.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/bottombar.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';

class FoundAssets extends StatelessWidget {
  final FoundAssetsController _ = Get.find<FoundAssetsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SCAN RESULTS',
          style: TextStyle(fontSize: 20, color:Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(0.0), // Adjust padding as needed
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Icon(Icons.lightbulb, color: Colors.yellow),
                  SizedBox(width: 8), // Add space between Icon and Text
                  Expanded(
                      child: Text(
                          'List of assets that are found in the selected Site or location ')),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  'Result:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${_.filterData.length} Assets',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Obx(() => _.isLoading.value
              ? CircularProgressIndicator()
              : _.filterData.isNotEmpty
                  ? Container(
                      height: Get.height / 1.8,
                      width: Get.width,
                      child: ListView.builder(
                          itemCount: _.filterData.length,
                          itemBuilder: (BuildContext context, ind) {
                            return InkWell(
                              onTap: () {
                                // Get.toNamed(Routes.assetsDetails,
                                //     arguments: _.data[ind]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1.0,
                                      blurRadius: 20.0,
                                      offset: Offset(0.0, 5.0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Asset tag ID:'),
                                              Text(
                                                ' ${_.filterData[ind]['productId']}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: UIDataColors
                                                        .commonColor),
                                              )
                                            ],
                                          ),
                                          Text(
                                            '• Available',
                                            style:
                                                TextStyle(color: Colors.green),
                                          )
                                        ],
                                      ).marginSymmetric(vertical: 10),
                                      Divider(),
                                      Container(
                                        // width: Get.width / 2,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.description_outlined,
                                                  size: 17,
                                                ).marginOnly(right: 5),
                                                SizedBox(
                                                    width: Get.width / 2.8,
                                                    child:
                                                        Text('Description:')),
                                                // Spacer(),
                                                Text(
                                                    ' ${_.filterData[ind]['description']}')
                                              ],
                                            ).marginOnly(top: 5, bottom: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.add_location_alt,
                                                  size: 17,
                                                ).marginOnly(right: 5),
                                                SizedBox(
                                                    width: Get.width / 2.8,
                                                    child: Text('Site:')),
                                                // Spacer(),
                                                Text(
                                                    ' ${_.filterData[ind]['site']}')
                                              ],
                                            ).marginOnly(top: 5, bottom: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.maps_home_work_outlined,
                                                  size: 17,
                                                ).marginOnly(right: 5),
                                                SizedBox(
                                                    width: Get.width / 2.8,
                                                    child: Text('Location:')),
                                                // Spacer(),
                                                Text(
                                                    ' ${_.filterData[ind]['location']}')
                                              ],
                                            ).marginOnly(top: 5, bottom: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.category,
                                                  size: 17,
                                                ).marginOnly(right: 5),
                                                SizedBox(
                                                    width: Get.width / 2.8,
                                                    child: Text('Category:')),
                                                // Spacer(),
                                                Text(
                                                    ' ${_.filterData[ind]['category']}')
                                              ],
                                            ).marginOnly(top: 5, bottom: 5),
                                          ],
                                        ),
                                      )
                                    ])
                                    .marginSymmetric(
                                      horizontal: 15,
                                    )
                                    .marginOnly(bottom: 8),
                              ).marginOnly(bottom: 10),
                            );
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                          child: Text(
                        'There are not assets present in the selected Site or Location',
                        style: TextStyle(fontSize: 15),
                      )),
                    ))
        ],
      ),
      bottomNavigationBar: historyBottom(0),
    );
  }
}
