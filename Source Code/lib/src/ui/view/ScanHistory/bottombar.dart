import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';

BottomNavigationBar historyBottom(int page) {
  return BottomNavigationBar(
    selectedFontSize: 11,
    unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 10),
    type: BottomNavigationBarType.fixed,
    currentIndex: page,

    items: [
      BottomNavigationBarItem(
        icon: InkWell(
          onTap: () {
            Get.toNamed(Routes.foundAssets);
          },
          child: Icon(
            Icons.search,
            // color: Color.fromARGB(255, 54, 54, 54),
          ),
        ),
        label: 'Found Assets',
      ),
      BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Get.toNamed(Routes.missingAssets);
              },
              child: Icon(Icons.description_outlined)),
          label: 'Missing Assets'),
      BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Get.toNamed(Routes.misplaced);
              },
              child: Icon(Icons.note_alt_outlined)),
          label: 'Misplaced Assets'),
      BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Get.toNamed(Routes.newAssets);
              },
              child: Icon(Icons.star)),
          label: 'New Assets'),

    ],
  );
}
