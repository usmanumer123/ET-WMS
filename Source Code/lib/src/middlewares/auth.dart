import 'package:flutter/material.dart';
import 'package:ET_WMS/src/utils/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthMiddleware extends GetMiddleware {
  // ignore: non_constant_identifier_names
  final Priority = 0;
  GetStorage box = GetStorage();

  @override
  RouteSettings? redirect(route) {
    // print(box.read('auth'));
    return box.read('auth')??false
        ? null
        : RouteSettings(name: Routes.login);
  }
}
