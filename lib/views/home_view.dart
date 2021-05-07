import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/home_controller.dart';
import 'package:getx_project/utils/views/loading_view.dart';
import 'package:getx_project/views/country_view.dart';

class HomeView extends StatelessWidget {
//state["global"]["totalDeaths"]
  final HomeController c = Get.put(HomeController());
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
                    title: Text('Covid資訊')),

                // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Total Confirmed',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '${c.data['TotalConfirmed']}',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Total Death',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        '${c.data['TotalDeaths']}',
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(color: Colors.black),
                          side: BorderSide(
                            color: Colors.deepPurple,
                            width: 3,
                          ),
                          shape: StadiumBorder(),
                        ),
                        onPressed: () {
                          Get.to(() => CountryView(),
                              arguments: {"title": "城市情況"});
                        },
                        child: Text(
                          '看更多',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          )
        : LoadingView());
  }
}
