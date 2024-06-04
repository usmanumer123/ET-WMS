// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/historyController.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/bottomBar.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HistoryController _ = Get.find<HistoryController>();
    return Scaffold(
      appBar: appbar(),
      body: Column(
        children: [
          Container(
            color: UIDataColors.commonColor,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                    ).marginSymmetric(horizontal: 10, vertical: 20),
                    Text(
                      'Change Date',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {

                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ).marginSymmetric(horizontal: Get.width / 6.5),
                    ),
                    Column(
                      children: [
                        Obx(() => Text(
                              _.present['date'].toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Text(
                          'monday',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 208, 177, 0)),
                        ).marginOnly(bottom: 10)
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: bottombar(2),
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
          title: Text(
            'HISTORY',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
