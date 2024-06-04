import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/widgets/commonBtn.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';
class AddSite extends StatefulWidget {
  const AddSite({super.key});

  @override
  State<AddSite> createState() => _AddSiteState();
}

class _AddSiteState extends State<AddSite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormFildWidgets(title: 'Site Nme', ),
            SizedBox(height: 20,),
            TextFormFildWidgets(title: 'Description', ),
            SizedBox(height: 20,),

            TextFormFildWidgets(title: 'Address', ),
            SizedBox(height: 20,),

            TextFormFildWidgets(title: 'City', ),
            SizedBox(height: 20,),

            TextFormFildWidgets(title: 'State',),
            SizedBox(height: 20,),

            TextFormFildWidgets(title: 'Postal Code',),
            Spacer(),

            CommonBtn(title: 'ADD SITE',onPressd: (){Get.toNamed(Routes.checkout);},)
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
            'ADD NEW SITE',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
