import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/routes/routes.dart';
import 'package:get/get.dart';

BottomNavigationBar bottombar(int page) {
  return BottomNavigationBar(
    selectedFontSize: 11,
    unselectedLabelStyle: const TextStyle(color: Colors.black, fontSize: 10),
    type: BottomNavigationBarType.fixed,
    currentIndex: page,
   
    items: [
      BottomNavigationBarItem(
        icon: InkWell(
          onTap: () {
            Get.offAndToNamed(Routes.document);
          },
          child: Icon(
            Icons.description_outlined,
            // color: Color.fromARGB(255, 54, 54, 54),
          ),
        ),
        label: 'Documents',
      ),
      BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Get.offAndToNamed(Routes.maintenance);
              },
              child: Icon(Icons.settings)),
          label: 'Maintenance'),
      BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Get.offAndToNamed(Routes.history);
              },
              child: Icon(Icons.person)),
          label: 'History'),
      BottomNavigationBarItem(
          icon: InkWell(
              onTap: () {
                Get.offAndToNamed(Routes.event);
              },
              child: Icon(Icons.search)),
          label: 'Event'),

      BottomNavigationBarItem(

          icon: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
              onTap: () {
                Get.offAndToNamed(Routes.despreciation);
              },
              child: Icon(Icons.trending_up_rounded)),
          label: 'Despreciation'),
    ],
  );
}
