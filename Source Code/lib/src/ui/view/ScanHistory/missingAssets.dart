import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/bottombar.dart';
import 'package:get/get.dart';
class MissingAssets extends StatefulWidget {
  const MissingAssets({super.key});

  @override
  State<MissingAssets> createState() => _MissingAssetsState();
}

class _MissingAssetsState extends State<MissingAssets> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Missing Assets'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(0.0), // Adjust padding as needed
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children:const [
                      Icon(Icons.lightbulb, color: Colors.yellow),
                      SizedBox(width: 8), // Add space between Icon and Text
                      Expanded(child: Text('List of assets that are missing in the selected Site or location')),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: const[
                    Text('Result:',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Text('2 Assets',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Asset tag ID: L-10001'),
                          Text(
                            '• Available',
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ).marginSymmetric(vertical: 10),
                      Divider(),
                      Container(
                        width: Get.width / 2,
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
                                Text('zzz')
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
                                Text('NA')
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
                                Text('NA')
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
                                Text('NA')
                              ],
                            ).marginOnly(top: 5, bottom: 5),
                          ],
                        ),
                      )
                    ]).marginSymmetric(horizontal: 15),
              ).marginOnly(bottom: 10),
              Container(
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Asset tag ID: EPC-567'),
                          Text(
                            '• Available',
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ).marginSymmetric(vertical: 10),
                      Divider(),
                      Container(
                        width: Get.width / 2,
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
                                Text('zzz')
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
                                Text('NA')
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
                                Text('NA')
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
                                Text('NA')
                              ],
                            ).marginOnly(top: 5, bottom: 5),
                          ],
                        ),
                      )
                    ]).marginSymmetric(horizontal: 15),
              ).marginOnly(bottom: 10),
            ],
          ),

        ],
      ),
      bottomNavigationBar: historyBottom(1),
    );
  }
}
