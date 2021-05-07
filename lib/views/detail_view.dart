import 'dart:ui';

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
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      title: Text('details'),
                      backgroundColor: Colors.black12,
                      elevation: 0,
                      centerTitle: true,
                    ),
                    body: Center(
                      child: Container(
                        color: Colors.white54,
                        child: SingleChildScrollView(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${c.data['Country']}',
                                  style: TextStyle(
                                      fontSize: 45,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 35,
                                ),
                                Text(
                                  'Total Confirmed',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  '${c.data['Confirmed']}',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Total Deaths',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  '${c.data['Deaths']}',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Total Recoverd',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  '${c.data['Recovered']}',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Total Active',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  '${c.data['Active']}',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          )
        : LoadingView());
  }
}
