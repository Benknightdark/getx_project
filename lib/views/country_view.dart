import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/contry_controller.dart';
import 'package:getx_project/utils/views/loading_view.dart';

class CountryView extends StatelessWidget {
  final Countryontroller c = Get.put(Countryontroller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => c.dataAvailable
        ? Container(
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: NetworkImage(
                    "https://images.pexels.com/photos/3902882/pexels-photo-3902882.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white10,
                  title: Text(c.title)),
            ),
          )
        : LoadingView());
  }
}
