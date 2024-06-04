
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/routes/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.toNamed(Routes.login);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        // color: Colors.blue,
        child: Image.asset(
          "assets/images/logos/emerg_logo.png",
          height: 300,
          width: 300,
        ),
            ),
      )
    );
  }

}



