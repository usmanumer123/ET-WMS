import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/controllers/foundAssetsController.dart';
import 'package:flutter_application_1/src/models/task_model.dart';
import 'package:flutter_application_1/src/utils/helpers/db_helper.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class AddAssetsController extends GetxController {
  DatabaseHelper db = Get.put(DatabaseHelper());

  var arg = Get.arguments;
  final TextEditingController assetTagIdController = TextEditingController();
  final TextEditingController purchasedController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController serialNoController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController disposedDateController = TextEditingController();
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController depreciationController = TextEditingController();
  final TextEditingController totalCostController = TextEditingController();
  final TextEditingController assetsLifeController = TextEditingController();
  final TextEditingController salvageController = TextEditingController();
  final TextEditingController dateAcquiredController = TextEditingController();

  final RxString result = ''.obs;
  @override
  void onInit() {
    assetTagIdController.text = arg ?? '';
    super.onInit();
  }



  Future<void> viewAsset() async {
    print('rrrrr');
    var res = await Get.to<String>(() => SimpleBarcodeScannerPage());
    print(res);
    if (res != null) {
      assetTagIdController.text=res;
      // result.value = res;
      // print('bbbbbbbbb $result');
      // Get.toNamed(Routes.foundAssets,arguments: res);
    }
  }

  save() {
  
    db.insertTask(Task(
        productId: assetTagIdController.text,
        brand: brandController.text.isEmpty ? 'NA' : brandController.text,
        description: descriptionController.text.isEmpty
            ? 'NA'
            : descriptionController.text,
        purchasedDate:
            purchasedController.text.isEmpty ? 'NA' : purchasedController.text,
        category:
            categoryController.text.isEmpty ? 'NA' : categoryController.text,
        model: modelController.text.isEmpty ? 'NA' : modelController.text,
        serialNumber:
            serialNoController.text.isEmpty ? 'NA' : serialNoController.text,
        cost: costController.text.isEmpty ? 'NA' : costController.text,
        assignedTo: "NA",
        lastScanDate: "03/20/2024",
        dueDate: "NA",
        disposedDate: disposedDateController.text.isEmpty
            ? 'NA'
            : disposedDateController.text,
        createdDate: createdDateController.text.isEmpty
            ? 'NA'
            : createdDateController.text,
        site: siteController.text.isEmpty ? 'NA' : siteController.text,
        location:
            locationController.text.isEmpty ? 'NA' : locationController.text,
        depreciation: selectedRadio.value == 'Option2' ? 'No' : 'Yes',
        depreciationMethod: depreciationController.text.isEmpty
            ? 'NA'
            : depreciationController.text,
        totalCost:
            totalCostController.text.isEmpty ? 'NA' : totalCostController.text,
        assetLife: assetsLifeController.text.isEmpty
            ? 'NA'
            : assetsLifeController.text,
        salvageValue:
            salvageController.text.isEmpty ? 'NA' : salvageController.text,
        dateAquired: dateAcquiredController.text.isEmpty
            ? 'NA'
            : dateAcquiredController.text,
        img: pickedFile?.path ?? 'na'));

    Get.delete<FoundAssetsController>();
    Get.offAndToNamed(Routes.dashboard);
  }

  var imageFile = Rx<File?>(null);
  var selectedRadio = 'Option2'.obs;
  var showTextField = true.obs;
  // final RxBool showTextField = true.obs;
  var pickedFile;
  void pickImage(ImageSource source) async {
    pickedFile = await ImagePicker().pickImage(source: source);
    imageFile.value = pickedFile != null ? File(pickedFile.path) : null;
  }

  void deleteImage() {
    imageFile.value = null;
  }

  void setSelectedRadio(String value) {
    selectedRadio.value = value;
    if (value == 'Option1') {
      showTextField.value = true;
    } else {
      showTextField.value = false;
    }
  }

  @override
  void onClose() {
    assetTagIdController.dispose();
    purchasedController.dispose();
    categoryController.dispose();
    descriptionController.dispose();
    brandController.dispose();
    modelController.dispose();
    serialNoController.dispose();
    costController.dispose();
    disposedDateController.dispose();
    createdDateController.dispose();
    siteController.dispose();
    locationController.dispose();
    depreciationController.dispose();
    totalCostController.dispose();
    assetsLifeController.dispose();
    salvageController.dispose();
    dateAcquiredController.dispose();
    super.onClose();
  }
}
