// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/maintenanceController.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/bottomBar.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';

class Maintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaintenanceController _ = Get.find<MaintenanceController>();
    return Scaffold(
      appBar: appbar(),
      body: Column(
        children: [
          TabBar(
            controller: _.tabController,
            labelColor:
                const Color.fromARGB(255, 0, 0, 0), // Customize tab colors
            unselectedLabelColor: Colors.grey,
            onTap: (index) => _.selectedIndex.value = index,
            tabs: const [
              Tab(text: 'UPCOMING'),
              Tab(text: 'MANAGE'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _.tabController,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.bottomSheet(SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(top: 30, left: 20),
                            height: 380,
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 213, 213, 213),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Status',
                                  style: TextStyle(fontSize: 20),
                                ),
                            
                                RadioButtonGroup(options:[
                                  'All',
                                  'Schedule',
                                  'In Progress',
                                  'On Hold',
                                  'Complete'
                                ]),
                              ],
                            ),
                          ),
                        ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('FILTER'),
                          Icon(
                            Icons.filter_alt_outlined,
                            size: 18,
                          ).marginSymmetric(horizontal: 10, vertical: 20)
                        ],
                      ).marginOnly(right: 10),
                    ),
                    Center(
                      child: Text(
                        'We cant find any upcomming maintenance',
                        style: TextStyle(
                            color: const Color.fromARGB(113, 0, 0, 0)),
                      ),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    'We cant find any maintenance',
                    style: TextStyle(color: const Color.fromARGB(113, 0, 0, 0)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addMaintenance);
        },
        backgroundColor: UIDataColors.commonColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: bottombar(1),
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
            'MAINTENANCE',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RadioButtonGroup extends StatelessWidget {
  final List<String> options;

  final MaintenanceController _ = Get.find<MaintenanceController>();

  RadioButtonGroup({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((option) => _buildRadioListTile(option)).toList(),
    );
  }

  Widget _buildRadioListTile(String option) {
    return Obx(() =>  RadioListTile<String>(
      value: option,
      groupValue: _.selectedValue.value,
      onChanged: (value) => _.onRadioSelected(value!),
      title: Text(option),
    ));
  }
}
