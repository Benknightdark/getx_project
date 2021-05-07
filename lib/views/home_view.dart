import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
//state["global"]["totalDeaths"]
  final HomeController c = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      children: [
        Obx(() => c.dataAvailable
            ? Text("${c.data["Global"]?["TotalConfirmed"]!}")
            : Text('... waiting ...'))
      ],
    )));
  }
}
