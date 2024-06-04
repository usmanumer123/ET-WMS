import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future appBottomSheet(dynamic list, Function(int)? onTap) {
  return Get.bottomSheet(Padding(
    padding: const EdgeInsets.all(12.0),
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey[300]!, Colors.grey[600]!],
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      height: 300.0,
      child: ListWheelScrollView(
        diameterRatio: 1,
        itemExtent: 40.0,
      // perspective: .01,
        physics: FixedExtentScrollPhysics(),
        overAndUnderCenterOpacity: 0.5,
        children: List.generate(
          list.length,
          (index) => GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(index); // Pass the index to the onTap function
              }
            },
            child: Container(
              // color: Colors.white,
              child: ListTile(
                selectedTileColor: Colors.blue,
                title: Center(
                  child: Text(
                    list[index],
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}

// String _getLocationName(int index) {
//   switch (index) {
//     case 0:
//       return 'Pakistan';
//     case 1:
//       return 'Lahore';
//     case 2:
//       return 'Faisalabad';
//     case 3:
//       return 'Karachi';
//     case 4:
//       return 'Islamabad';
//     default:
//       return 'Unknown';
//   }
// }
