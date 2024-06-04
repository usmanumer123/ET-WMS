import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/foundAssetsController.dart';
import 'package:flutter_application_1/src/ui/view/ScanHistory/bottombar.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';

class NewAssets extends StatelessWidget {
  const NewAssets({super.key});

  @override
  Widget build(BuildContext context) {
    FoundAssetsController _ = Get.find<FoundAssetsController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('New Assets'),
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
                    children: const [
                      Icon(Icons.lightbulb, color: Colors.yellow),
                      SizedBox(width: 8), // Add space between Icon and Text
                      Expanded(
                          child: Text(
                              'List of scanned assets that are not in the system and available to add')),
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
                      _.filterData.isEmpty ? '1 Assets' : '0 Assets',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _.filterData.isEmpty
                      ? Row(
                          children: [
                            Text(
                              'TagId:',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${_.arg}',
                            ),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  Get.offAndToNamed(Routes.addAsset,arguments: _.arg.toString());
                                },
                                child: Text('ADD'))
                          ],
                        )
                      : SizedBox(),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: historyBottom(3),
    );
  }
}
