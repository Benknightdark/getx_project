import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/views/home_view.dart';

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

void main() => runApp(GetMaterialApp(home: HomeView()));
