import 'package:flutter/material.dart';
import 'package:ET_WMS/src/utils/uidata/color.dart';

class ContWidgets extends StatelessWidget {
  final String text;
  const ContWidgets({super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/15,
      color: Colors.grey.shade100,
      child: Align( alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(color: UIDataColors.commonColor),),
          )),
    );
  }
}
