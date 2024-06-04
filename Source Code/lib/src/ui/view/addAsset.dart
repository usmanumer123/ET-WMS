// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/addAsset_controller.dart';
import 'package:flutter_application_1/src/ui/widgets/commonBtn.dart';
import 'package:flutter_application_1/src/ui/widgets/container.dart';
import 'package:flutter_application_1/src/ui/widgets/modelbottomSheet.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddAssets extends StatelessWidget {
  final AddAssetsController controller = Get.put(AddAssetsController());
  bool showTextField = true;
RxList<String> category=<String>['Tools','Vehicles','Furniture','Electronics','Grocery','Stationery'].obs;
RxList<String> site=<String>['Engro ISB','Engro KHI','Engro LHR','Engro SKI'].obs;
RxList<String> location=<String>['IT Department','HR Department','Admin Department',].obs;
RxList<String> depreciation=<String>['Digits Method','Straight line Method','Monthly Depreciation','Rate of Depreciation'].obs;


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    TextFormFildWidgets(
                      title: 'Asset Tag ID:*',
                      iconButton: IconButton(onPressed: (){
                        controller.viewAsset();
                      },iconSize: 22,
                        icon: const Icon(Icons.center_focus_strong_outlined),
                        color: UIDataColors.commonColor,),
                      txtcontroller: controller.assetTagIdController,
                  
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      read: true,
                      title: 'Purchased date',
                      iconButton:IconButton(onPressed: ()async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));
                        if (pickedDate != null) {
                          DateTime dateTime = pickedDate;
                          var formattedDate =
                              "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                          controller.purchasedController.text =
                              formattedDate.toString();
                        }
                      },
                        icon: const Icon(Icons.date_range),),
                      txtcontroller: controller.purchasedController,

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      read: true,
                      title: 'Category',
                      iconButton:IconButton(onPressed: (){
                        appBottomSheet(category,(index){
                          Get.back();
                          controller.categoryController.text=   category[index];
                        });
                      }, icon: const Icon(Icons.keyboard_arrow_down_outlined),),
                      txtcontroller: controller.categoryController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Description',
                      txtcontroller: controller.descriptionController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Brand',
                      txtcontroller: controller.brandController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Model',
                      txtcontroller: controller.modelController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Serial No',
                      txtcontroller: controller.serialNoController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Cost',
                      txtcontroller: controller.costController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Disposed Date',
                      iconButton: IconButton(onPressed: ()async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));
                        if (pickedDate != null) {
                          DateTime dateTime = pickedDate;
                          var formattedDate =
                              "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
                          controller.disposedDateController.text =
                              formattedDate.toString();
                        }
                      },
                          icon: const Icon(Icons.date_range)),
                      txtcontroller: controller.disposedDateController,
                      read: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Created Date',
                      read: true,
                      iconButton: IconButton(onPressed: ()async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime(2050));
                        if (pickedDate != null) {
                          DateTime dateTime = pickedDate;
                          var formattedDate =
                              "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                          controller.createdDateController.text =
                              formattedDate.toString();
                        }
                      },
                          icon: const Icon(Icons.date_range)),
                      txtcontroller: controller.createdDateController,

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ContWidgets(text: 'ASSETS LOCATION'),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      title: 'Site',
                      read: true,
                      iconButton: IconButton(onPressed: (){
                        appBottomSheet(site,(index){
                          Get.back();
                          controller.siteController.text=   site[index];
                        });
                      },
                          icon: const Icon(Icons.keyboard_arrow_down_outlined)),
                      txtcontroller: controller.siteController,
                      onPressd: () {
                        appBottomSheet(site,(index){
                          Get.back();
                          controller.siteController.text=   site[index];
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormFildWidgets(
                      read: true,
                      title: 'Location',
                      iconButton: IconButton(onPressed: (){
                        appBottomSheet(location,(index){
                          Get.back();
                          controller.locationController.text=   location[index];
                        });
                      }, icon: Icon(Icons.keyboard_arrow_down_outlined)),
                      txtcontroller: controller.locationController,
                      // onPressd: () {
                      //   appBottomSheet(location,(index){
                      //     Get.back();
                      //     controller.locationController.text=   location[index];
                      //   });
                      // },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ContWidgets(
                      text: 'ASSETS IMAGE',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.grey.shade100,
                      height: 270,
                      width: 400,
                      child: Obx(() {
                        return controller.imageFile.value == null
                            ? Center(child: Text('No image selected.'))
                            : Image.file(controller.imageFile.value!);
                      }),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: 170,
                      child: ElevatedButton(
                        onPressed: () =>
                            controller.pickImage(ImageSource.camera),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                UIDataColors.commonColor)),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'UPLOAD IMAGE',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ContWidgets(text: 'DEPRECIATION'),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Depreciation",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: RadioListTile(
                            title: Text('Yes'),
                            value: 'Option1',
                            groupValue: controller.selectedRadio.value,
                            onChanged: (value) {
                              controller.setSelectedRadio(value as String);
                              print(
                                  'Selected Radio Value: ${controller.selectedRadio.value}');
                            },
                          ),
                        ),
                        Flexible(
                          child: RadioListTile(
                            title: const Text('No'),
                            value: 'Option2',
                            groupValue: controller.selectedRadio.value,
                            onChanged: (value) {
                              controller.setSelectedRadio(value as String);
                              controller.update();
                              print(
                                  'Selected Radio Value: ${controller.selectedRadio.value}');
                            },
                          ),
                        ),
                      ],
                    ),
                    if(controller.selectedRadio.value=="Option1")
                    Visibility(
                      visible: showTextField,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            TextFormFildWidgets(
                              read: true,
                              title: 'Depreciation Method',
                              iconButton: IconButton(onPressed: (){
                                appBottomSheet(depreciation,(index){
                                  Get.back();
                                  controller.depreciationController.text=   depreciation[index];
                                });
                              }, icon: Icon(Icons.keyboard_arrow_down_sharp)),
                              txtcontroller: controller.depreciationController,
                              // onPressd: () {
                              //   appBottomSheet(depreciation,(index){
                              //     Get.back();
                              //     controller.depreciationController.text=   depreciation[index];
                              //   });
                              // },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormFildWidgets(
                              txtcontroller: controller.totalCostController,
                              title: 'Total Cost(USD)*',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormFildWidgets(
                              txtcontroller: controller.assetsLifeController,
                              title: 'Asset Life(Month)*',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormFildWidgets(
                              txtcontroller: controller.salvageController,
                              title: 'Salvage Value(USD)*',
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormFildWidgets(
                              txtcontroller: controller.dateAcquiredController,
                                iconButton: IconButton(onPressed: ()async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime(2050));
                                  if (pickedDate != null) {
                                    DateTime dateTime = pickedDate;
                                    var formattedDate =
                                        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

                                    controller.dateAcquiredController.text =
                                        formattedDate.toString();
                                  }
                                },
                                    icon: Icon(Icons.date_range)),
                                // onPressd: () async {
                                //   DateTime? pickedDate = await showDatePicker(
                                //       context: context,
                                //       initialDate: DateTime.now(),
                                //       firstDate: DateTime(1950),
                                //       lastDate: DateTime(2050));
                                //   if (pickedDate != null) {
                                //     DateTime dateTime = pickedDate;
                                //     var formattedDate =
                                //         "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
                                //
                                //     controller.dateAcquiredController.text =
                                //         formattedDate.toString();
                                //   }
                                // },
                                title: 'Date Acquired',
                                icon: Icons.date_range),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonBtn(
                    title: 'SAVE',
                    onPressd: () {
                      controller.save();
                      // Get.toNamed(Routes.dashboard);
                    },
                  )),
            ),
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
            'ADD ASSET',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ),
    );
  }
}

