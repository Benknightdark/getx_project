import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/contry_controller.dart';
import 'package:getx_project/utils/views/loading_view.dart';
import 'dart:ui';

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
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white10,
                    title: Text(c.title)),
                body: Center(
                  child: ListView.builder(
                      itemCount: c.data.length,
                      itemBuilder: (context, index) {
                        final country = c.data[index];
                        return ListTile(
                          onTap: () {
                            // Get.toNamed('/home/country/details',
                            //     arguments: country);
                          },
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://flagpedia.net/data/flags/normal/${country['CountryCode'].toLowerCase()}.png"),
                          ),
                          title: Text(country['Country']),
                          subtitle: Text(
                              // ignore: lines_longer_than_80_chars
                              'Total Infects： ${country['TotalConfirmed']}'),
                        );
                      }),
                ),
              ),
            ),
          )
        : LoadingView());
  }
}
