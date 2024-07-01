import 'package:flutter/material.dart';
import 'package:ET_WMS/src/ui/widgets/commonBtn.dart';
import 'package:ET_WMS/src/ui/widgets/textformfild_widgets.dart';
import 'package:ET_WMS/src/utils/uidata/color.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: Get.width,
              color: UIDataColors.commonColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4),
                            spreadRadius: 4.0,
                            blurRadius: 35.0,
                            offset: Offset(0.0, 10.0),
                          ),
                        ],
                        color: Color.fromARGB(255, 166, 145, 189),
                        borderRadius: BorderRadius.circular(60)),
                    child: Center(
                        child: Icon(
                      Icons.person,
                      size: 80,
                      color: Color.fromARGB(141, 246, 246, 246),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Upload Photo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ).marginOnly(top: 10)
                ],
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: Get.width / 2.3,
                    child: TextFormFildWidgets(title: 'First Name')),
                SizedBox(
                    width: Get.width / 2.3,
                    child: TextFormFildWidgets(title: 'Last Name'))
              ],
            ).marginSymmetric(horizontal: 15),
            SizedBox(height: 30,),

            TextFormFildWidgets(title: 'Designation')
                .marginSymmetric(horizontal: 15),
            SizedBox(height: 30,),

            TextFormFildWidgets(title: 'Phone no.')
                .marginSymmetric(horizontal: 15),
            SizedBox(height: 30,),

            TextFormFildWidgets(title: 'Email ID')
                .marginSymmetric(horizontal: 15),
            SizedBox(height: 30,),

            CommonBtn(title: 'UPDATE'),
            SizedBox(height: 30,),

            Divider(
              color: Color.fromARGB(35, 65, 65, 65),
              thickness: 2,
            ),
            SizedBox(height: 30,),

            TextFormFildWidgets(title: 'Password')
                .marginSymmetric(horizontal: 15),
            SizedBox(height: 30,),

            TextFormFildWidgets(title: 'Confirm Password')
                .marginSymmetric(horizontal: 15),
            SizedBox(height: 30,),

            CommonBtn(title: 'UPDATE'),
            SizedBox(height: 30,),

            Divider(
              color: Color.fromARGB(35, 65, 65, 65),
              thickness: 2,
            ),
            SizedBox(height: 30,),

            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'ACCOUNT SETTING',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 42, 42, 42),
                    fontSize: 16,
                  ),
                )).marginOnly(left: 15),
            SizedBox(height: 30,),

            CommonBtn(title: 'DELETE ACCOUNT'),
            SizedBox(height: 30,),


          ],
        ),
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
          title: Text(
            'PROFILE',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
