import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/widgets/commonBtn.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';
class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  static const String option1 = 'Option 1';
  static const String option2 = 'Option 2';

  String selectedRadio = option1;

  bool showTextField = false;

  void setSelectedRadio(String value) {
    setState(() {
      selectedRadio = value;
      if (value == option2) {
        showTextField = true;
      } else {
        showTextField = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormFildWidgets(title: "CheckOut Date*", icon: Icons.date_range,onPressd: ()async{
                DateTime? pickedDate = await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050));
                if(pickedDate != null){
                }
              }),
              SizedBox(height: 20,),
              Text('CheckOut to'),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Flexible(
                    child: RadioListTile(
                      title:  Text('Employee'),
                      value: option1,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setSelectedRadio(value as String);
                      },
                    ),
                  ),
                  Flexible(
                    child: RadioListTile(
                      title: const Text('Site/Location'),
                      value: option2,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setSelectedRadio(value as String);
                      },
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: showTextField,
                child: TextFormFildWidgets(
                  title: 'Site',
                  icon: Icons.keyboard_arrow_down_sharp,onPressd: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Site'),
                          content: Text('No option for Depreciation Method'),
                        );
                      });
                },
                ),
              ),
              SizedBox(height: 20,),
              TextFormFildWidgets(title: 'Location', icon: Icons.keyboard_arrow_down_sharp,onPressd: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                            'Location'),
                        content: Text('No option for Depreciation Method'),
                      );
                    });
              },),
              SizedBox(height: 20,),
              TextFormFildWidgets(title: 'Due Date', icon: Icons.date_range,onPressd: ()async{
                DateTime? pickedDate = await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2050));
                if(pickedDate != null){
                }
              },),
              SizedBox(height: 20,),
              TextFormFildWidgets(title: 'Note', ),
              SizedBox(
                height: 20,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width:  MediaQuery.of(context).size.height /5,
                    height: 50,

                    child: TextButton(
                      onPressed: (){
                        Get.toNamed(Routes.addSite);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: UIDataColors.commonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,)),
                      child: const Text('ADD SITE',
                          style: TextStyle(color: Colors.white,fontSize: 16)),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width:  MediaQuery.of(context).size.height /5,
                    height: 50,
                    child: TextButton(
                      onPressed: (){
                        Get.toNamed(Routes.addLocation);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: UIDataColors.commonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,)),
                      child: const Text('ADD LOCATION',
                          style: TextStyle(color: Colors.white,fontSize: 16)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
            CommonBtn(title: 'CHECK OUT',onPressd: (){Get.back();},)

            ],
          ),
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
            'CHECKOUT',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}
