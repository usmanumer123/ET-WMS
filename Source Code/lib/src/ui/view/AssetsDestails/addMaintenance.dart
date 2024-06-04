// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:flutter_application_1/src/controllers/addMaintenanceController.dart';
import 'package:flutter_application_1/src/ui/widgets/commonBtn.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';

import 'package:get/get.dart';

class AddMaintenance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AddMaintenanceController _ = Get.find<AddMaintenanceController>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Obx(() => Container(
              height: _.repeatingCheck.value
                  ? Get.height > 700
                      ? Get.height * 1.18
                      : Get.height * 1.5
                  : Get.height > 700
                      ? Get.height - 100
                      : Get.height * 1.1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        'ADD NEW MAINTENANCE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.close,
                          color: Color.fromARGB(148, 0, 0, 0),
                        ).marginOnly(right: 15),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormFildWidgets(
                        title: 'Title',
                      ).marginOnly(
                        top: 20,
                      ),
                      TextFormFildWidgets(
                        title: 'Cost',
                      ).marginOnly(
                        top: 20,
                      ),
                      TextFormFildWidgets(
                        title: 'Maintenance By',
                      ).marginOnly(
                        top: 20,
                      ),
                      Text(
                        'Repeating',
                        style: TextStyle(
                            fontSize: 17,
                            color: const Color.fromARGB(255, 73, 73, 73)),
                      ).marginOnly(top: 30),
                      RadioButtonGroup(options: [
                        'Yes',
                        'No',
                      ]),
                      Obx(() => _.repeatingCheck.value
                          ? Column(
                              children: [
                                Row(
                                  children: [
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            value: 'daily',
                                            groupValue: _.selectedValue2.value,
                                            onChanged: (value) =>
                                                _.radioSelected2(
                                              value.toString(),
                                            ),
                                          ),
                                          Text('Daily'),
                                        ],
                                      ).marginOnly(left: 12),
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            value: 'weekly',
                                            groupValue: _.selectedValue2.value,
                                            onChanged: (value) =>
                                                _.radioSelected2(
                                                    value.toString()),
                                          ),
                                          Text('Weekly'),
                                        ],
                                      ).marginOnly(left: 90),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            value: 'hhh',
                                            groupValue: _.selectedValue2.value,
                                            onChanged: (value) =>
                                                _.radioSelected2(
                                              value.toString(),
                                            ),
                                          ),
                                          Text('Monthly'),
                                        ],
                                      ).marginOnly(left: 12),
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          Radio(
                                            value: 'kkk',
                                            groupValue: _.selectedValue2.value,
                                            onChanged: (value) =>
                                                _.radioSelected2(
                                                    value.toString()),
                                          ),
                                          Text('Yearly'),
                                        ],
                                      ).marginOnly(left: 70),
                                    ),
                                  ],
                                ),
                                Obx(() => _.monthlyCheck.value == 'daily'
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text('Recur On*'),
                                          Wrap(
                                            children: [
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    side: BorderSide(
                                                      width: 01,
                                                    ),
                                                    value: _.checkbox.value,
                                                    onChanged: (bool? v) {
                                                      print(Get.height);
                                                      _.checkbox.value =
                                                          v ?? false;
                                                    },
                                                  ),
                                                  Text('Mon')
                                                      .marginOnly(right: 10)
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    side: BorderSide(
                                                      width: 01,
                                                    ),
                                                    value: _.checkbox.value,
                                                    onChanged: (bool? v) {
                                                      _.checkbox.value =
                                                          v ?? false;
                                                    },
                                                  ),
                                                  Text('Tue')
                                                      .marginOnly(right: 10)
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    side: BorderSide(
                                                      width: 01,
                                                    ),
                                                    value: _.checkbox.value,
                                                    onChanged: (bool? v) {
                                                      _.checkbox.value =
                                                          v ?? false;
                                                    },
                                                  ),
                                                  Text('Wed')
                                                      .marginOnly(right: 10)
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    side: BorderSide(
                                                      width: 01,
                                                    ),
                                                    value: _.checkbox.value,
                                                    onChanged: (bool? v) {
                                                      _.checkbox.value =
                                                          v ?? false;
                                                    },
                                                  ),
                                                  Text('Thu')
                                                      .marginOnly(right: 10)
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    side: BorderSide(
                                                      width: 01,
                                                    ),
                                                    value: _.checkbox.value,
                                                    onChanged: (bool? v) {
                                                      _.checkbox.value =
                                                          v ?? false;
                                                    },
                                                  ),
                                                  Text('Fri')
                                                      .marginOnly(right: 10)
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    side: BorderSide(
                                                      width: 01,
                                                    ),
                                                    value: _.checkbox.value,
                                                    onChanged: (bool? v) {
                                                      _.checkbox.value =
                                                          v ?? false;
                                                    },
                                                  ),
                                                  Text('Sat')
                                                      .marginOnly(right: 10)
                                                ],
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                children: [
                                                  Checkbox(
                                                    side: BorderSide(
                                                      width: 01,
                                                    ),
                                                    value: _.checkbox.value,
                                                    onChanged: (bool? v) {
                                                      _.checkbox.value =
                                                          v ?? false;
                                                    },
                                                  ),
                                                  Text('Sun')
                                                      .marginOnly(right: 10)
                                                ],
                                              )
                                            ],
                                          ),
                                          TextFormFildWidgets(title: 'Time*')
                                              .marginOnly(bottom: 20)
                                        ],
                                      )
                                    : SizedBox())
                              ],
                            )
                          : SizedBox()),
                      TextFormFildWidgets(
                        title: 'Due Date*',
                        icon: Icons.calendar_month,
                      ),
                      TextFormFildWidgets(
                        title: 'Complete Date',
                        icon: Icons.calendar_month,
                      ).marginOnly(
                        top: 20,
                      ),
                      TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(top: 10, left: 10),
                          hintText: 'Notes',
                          hintStyle: TextStyle(
                              color: const Color.fromARGB(148, 158, 158, 158)),
                          border: OutlineInputBorder(
                            // For a solid border
                            borderRadius: BorderRadius.circular(
                                6.0), // Customize corner radius
                            borderSide: BorderSide(
                              // Customize border style and color
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ).marginOnly(top: 20),
                    ],
                  ).marginSymmetric(horizontal: 25),
                  Spacer(),
                  CommonBtn(title: 'ADD').marginOnly(bottom: 25),
                ],
              ),
            )),
      )),
    );
  }
}

class RadioButtonGroup extends StatelessWidget {
  final List<String> options;

  final AddMaintenanceController _ = Get.find<AddMaintenanceController>();

  RadioButtonGroup({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: options
          .map((option) => SizedBox(
                width: Get.width / 2.5,
                child: _buildRadioListTile(option),
              ))
          .toList(),
    );
  }

  Widget _buildRadioListTile(String option) {
    return Obx(() => RadioListTile<String>(
          value: option,
          groupValue: _.selectedValue.value,
          onChanged: (value) => _.onRadioSelected(value!),
          title: Text(option),
        ));
  }
}
