import 'package:flutter/material.dart';
import 'package:ET_WMS/src/utils/uidata/color.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CommonBtn extends StatelessWidget {
  final String title;
  Function()? onPressd;
  CommonBtn({required this.title,this.onPressd,});
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPressd,
      child: Container(
          width: Get.width - 40,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: UIDataColors.commonColor,
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
