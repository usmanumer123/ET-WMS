// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/addDocController.dart';
import 'package:flutter_application_1/src/ui/widgets/commonBtn.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';

class AddDocument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AddDocController _ = Get.find<AddDocController>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'ADD NEW DOCUMENT',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                TextFormFildWidgets(
                  title: 'Title',
                )
                    .marginSymmetric(horizontal: 25)
                    .marginOnly(top: 20, bottom: 30),
                Divider(
                  thickness: 4,
                  color: const Color.fromARGB(255, 239, 239, 239),
                )
              ],
            ),
            // Spacer(),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    _.uploadDocument2();
                    // _.check();
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(162, 227, 227, 227),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.file_upload_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  'Uplod Documents',
                  style: TextStyle(
                      color: UIDataColors.commonColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ).marginOnly(top: 10),
                Text('Supported File Formate: .docx, .doc, .pdf, .cvs',
                        style: TextStyle(
                            color: Color.fromARGB(255, 125, 125, 125),
                            fontSize: 12,
                            fontWeight: FontWeight.bold))
                    .marginOnly(top: 20),
                Text('Max File Size: 10MB',
                    style: TextStyle(
                        color: Color.fromARGB(255, 125, 125, 125),
                        fontSize: 12,
                        fontWeight: FontWeight.bold))
              ],
            ),
            CommonBtn(title: 'SAVE').marginOnly(bottom: 25),
          ],
        ),
      )),
    );
  }
}
