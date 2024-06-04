import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/login_controller.dart';
import 'package:flutter_application_1/src/ui/widgets/commonBtn.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:flutter_application_1/src/ui/widgets/container_widget.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenController _ = Get.find<LoginScreenController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ContainerWidgets(
                title: "Please Enter Your Credentials to get Access",
                text: "Login"),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormFildWidgets(
                      txtcontroller: _.email,
                      title: 'Email ID',
                      icon: Icons.email_outlined),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormFildWidgets(
                      txtcontroller: _.password,
                      title: 'Password',
                      icon: Icons.lock_outline),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.forgot);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: UIDataColors.commonColor,
                            fontSize: 14,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CommonBtn(
                    title: 'Login',
                    onPressd: () {
                   _.logIn();
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.signUp);
                      },
                      child: Text(
                        "Dont Have ant Account? SignUp",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff4c505b),
                          fontSize: 18,
                        ),
                      )),
                  SizedBox(height: 60,),
                  Text('Release:10MAY2024(0.0.1)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
