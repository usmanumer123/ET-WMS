import 'package:flutter/material.dart';
import 'package:ET_WMS/src/ui/widgets/commonBtn.dart';
import 'package:ET_WMS/src/utils/routes/routes.dart';
import 'package:ET_WMS/src/ui/widgets/container_widget.dart';
import 'package:ET_WMS/src/ui/widgets/textformfild_widgets.dart';
import 'package:get/get.dart';
class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            ContainerWidgets(title: "Please Enter Your Credentials to get Access", text: "Forgot"),
            SizedBox(
              height: 140,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormFildWidgets(title: 'Email ID', icon: Icons.email_outlined),
                  SizedBox(
                    height: 40,
                  ),
                  CommonBtn(title: 'Submit',onPressd: (){Get.toNamed(Routes.login);},)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
