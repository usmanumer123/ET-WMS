import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/viewAssets_controller.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';

class ViewAssets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ViewAssetsController _ = Get.find<ViewAssetsController>();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        appBar: appbar(),
        body: Obx(
          () => _.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : body(_),
        ));
  }

  SingleChildScrollView body(ViewAssetsController _) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0), // Set border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(0, 5),
                  blurRadius: 15.0,
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle:
                    TextStyle(color: const Color.fromARGB(148, 158, 158, 158)),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  size: 22,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  iconSize: 22,
                  icon: const Icon(Icons.center_focus_strong_outlined),
                  color: UIDataColors.commonColor,
                  onPressed: () {
                    _.viewAsset();
                  },
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Results: ${_.data?.length} Assets',
              ),
              InkWell(
                  onTap: () {}, child: Icon(Icons.format_list_numbered_rounded))
            ],
          ).marginSymmetric(horizontal: 15).marginOnly(bottom: 10),
          Container(
            padding: EdgeInsets.only(bottom: 80),
            height: Get.height / 1.2,
            width: Get.width,
            child: ListView.builder(
                itemCount: _.data.length,
                itemBuilder: (BuildContext context, ind) {
                  dynamic colorCheck = false;
                  for (var i = 0; i < _.check.length; i++) {
                    if (_.check[i] == _.data[ind]['productId']) {
                      colorCheck = true;
                      break;
                    }
                  }

                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.assetsDetails, arguments: _.data[ind]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: colorCheck
                            ? const Color.fromARGB(255, 119, 230, 123)
                            : Colors.white,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Asset tag ID: ${_.data[ind]['productId']}'),
                                Text(
                                  '• Available',
                                  style: TextStyle(color: Colors.green),
                                )
                              ],
                            ).marginSymmetric(vertical: 10),
                            Divider(),
                            Container(
                              width: Get.width / 1.5,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.description_outlined,
                                        size: 17,
                                      ).marginOnly(right: 5),
                                      Text('Description:'),
                                      Spacer(),
                                      Text(
                                        ' ${_.data[ind]['description']}',
                                        overflow: TextOverflow.fade,
                                      )
                                    ],
                                  ).marginOnly(top: 5, bottom: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.add_location_alt,
                                        size: 17,
                                      ).marginOnly(right: 5),
                                      Text('Site:'),
                                      Spacer(),
                                      Text(' ${_.data[ind]['site']}')
                                    ],
                                  ).marginOnly(top: 5, bottom: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.maps_home_work_outlined,
                                        size: 17,
                                      ).marginOnly(right: 5),
                                      Text('Location:'),
                                      Spacer(),
                                      Text(' ${_.data[ind]['location']}')
                                    ],
                                  ).marginOnly(top: 5, bottom: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.category,
                                        size: 17,
                                      ).marginOnly(right: 5),
                                      Text('Category:'),
                                      Spacer(),
                                      Text(' ${_.data[ind]['category']}')
                                    ],
                                  ).marginOnly(top: 5, bottom: 13),
                                ],
                              ),
                            )
                          ]).marginSymmetric(horizontal: 15),
                    ).marginOnly(bottom: 10).marginSymmetric(horizontal: 15),
                  );
                }),
          )
        ],
      ),
    );
  }

  PreferredSize appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.0,
              blurRadius: 3.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: AppBar(
          title: Center(
            child: Text(
              'ASSETS',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            Center(
                child: InkWell(
              onTap: () {
                Get.toNamed(Routes.addAsset);
              },
              child: Icon(
                Icons.add,
                size: 30,
                color: UIDataColors.commonColor,
              ),
            )).marginOnly(right: 18),
          ],
        ),
      ),
    );
  }
}
