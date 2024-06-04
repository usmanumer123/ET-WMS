import 'package:flutter/material.dart';

class UIDataDecoration {
  // < ------------------------------------- Define Decoration Here ----------------------->

  static final boxdecor = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.0),
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
        spreadRadius: 2,
        blurRadius: 9,
        offset: const Offset(3, 3),
      ),
    ],
  );

  static final textfieldshadow =
      BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
    BoxShadow(
      color: const Color.fromARGB(18, 18, 18, 18).withOpacity(0.1),
      spreadRadius: 2,
      blurRadius: 5,
      offset: const Offset(3, 3),
    ),
  ]);
}
