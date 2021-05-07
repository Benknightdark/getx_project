import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/detail_controller.dart';
import 'package:getx_project/utils/views/loading_view.dart';

class DetailView extends StatelessWidget {
  final DetailController c = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => c.dataAvailable
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: NetworkImage(
                    "https://flagpedia.net/data/flags/normal/${c.code.toLowerCase()}.png"),
              ),
            ),
          )
        : LoadingView());
  }
}
