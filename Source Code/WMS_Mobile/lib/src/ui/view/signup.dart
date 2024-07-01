import 'package:flutter/material.dart';
import 'package:ET_WMS/src/ui/widgets/commonBtn.dart';
import 'package:ET_WMS/src/utils/routes/routes.dart';
import 'package:ET_WMS/src/ui/widgets/container_widget.dart';
import 'package:ET_WMS/src/ui/widgets/textformfild_widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SingUpScreenController _ = Get.find<SingUpScreenController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            ContainerWidgets(title: "Please Enter Your Credentials to get Access", text: "SignUp"),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormFildWidgets(title: 'First Name', icon: Icons.perm_identity),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormFildWidgets(title: 'Last Name', icon: Icons.perm_identity),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormFildWidgets(title: 'Email ID', icon: Icons.email_outlined),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormFildWidgets(title: 'Password', icon: Icons.lock_outline),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormFildWidgets(title: 'Confirm Password', icon: Icons.lock_outline),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: TextButton(
                  //     onPressed: () async {
                  //       Get.toNamed(Routes.login);
                  //     },
                  //     style: TextButton.styleFrom(
                  //         backgroundColor: UIDataColors.commonColor,
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(6)),
                  //         padding: const EdgeInsets.symmetric(
                  //           vertical: 20,)),
                  //     child: const Text('SignUp',
                  //         style: TextStyle(color: Colors.white)),
                  //   ),
                  // ),
                  CommonBtn(title: 'SignUp',onPressd: (){Get.toNamed(Routes.login);},)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
