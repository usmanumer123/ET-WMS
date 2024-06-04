import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';
class ScanHistory extends StatefulWidget {
  const ScanHistory({super.key});

  @override
  State<ScanHistory> createState() => _ScanHistoryState();
}

class _ScanHistoryState extends State<ScanHistory> {
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Scan History'),
          centerTitle: true,
          bottom:  TabBar(
            tabs: const [
              Tab(
                text: 'UNSYNCED',
              ),
              Tab(
                text: 'SYNCED',
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Column(
                  children:const [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        Icon(Icons.lightbulb,color: Colors.yellow,),
                        SizedBox(width: 10,),
                        Text('Successfully Synced scan results will move to Synced tab',
                          softWrap: false,
                          maxLines: 2,),
                      ],),
                    ), SizedBox(height: 300,),
                    Align(alignment: Alignment.center,
                        child: Text("We can't find any offline scan results")),
                  ],
                ),
              ),
            ),
           SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   color: Colors.grey.shade100,
                   padding: EdgeInsets.all(8.0),
                   child: Row(
                     children:const [
                       Icon(Icons.lightbulb, color: Colors.yellow),
                       SizedBox(width: 8),
                       Text('Top on the list to view the detail of scan results'),
                     ],
                   ),
                 ),
                 Image.asset('assets/images/logos/search.jpg',height: 300,),
                 Text('Not Result Found',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10,),
                 Text("We can't find any Online scan results"),
                 SizedBox(height: 15,),
                 InkWell(onTap: (){ Get.toNamed(Routes.foundAssets);},
                   child: Container(
                     color: Colors.white,
                     child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('Asset tag ID: 11'),
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
                 ),
               ],
             ),
           )
          ],
        ),
        // bottomNavigationBar: historyBottom(0),
      ),
    );
  }
}
