import 'package:flutter/material.dart';
import 'package:ET_WMS/src/utils/uidata/appImages.dart';
import 'package:ET_WMS/src/utils/uidata/color.dart';
class ContainerWidgets extends StatelessWidget {
  final String title;
  final String text;
  // final String color;

  const ContainerWidgets({Key? key,
    required this.title,
    required this.text,
    // required this.color,

  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.4,
      color: UIDataColors.commonColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(AppImage.logo4,
            height: MediaQuery.of(context).size.height*0.2,
            width: MediaQuery.of(context).size.width,),
          SizedBox(height: 15,),
          Text(text,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
          Text(title,style: TextStyle(fontSize: 16,color: Colors.white),)
        ],
      ),
    );
  }
}
