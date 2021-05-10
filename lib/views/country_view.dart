import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controllers/contry_controller.dart';
import 'package:getx_project/utils/views/loading_view.dart';
import 'dart:ui';
import 'package:getx_project/views/detail_view.dart';

// ignore: must_be_immutable
class CountryView extends StatelessWidget {
  final Countryontroller c = Get.put(Countryontroller());
  TextEditingController t = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
              title: Obx(() => Text(c.title))),
          body: Obx(() => c.dataAvailable
              ? Flex(
                  direction: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          TextFormField(
                            controller: t,
                            decoration: InputDecoration(
                              focusColor: Colors.black,
                              labelText: "",
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () async {
                                await c.search(t.text);
                              })
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: c.data.length,
                          itemBuilder: (context, index) {
                            final country = c.data[index];
                            return ListTile(
                              onTap: () {
                                Get.to(() => DetailView(), arguments: {
                                  'title': country['Country'],
                                  'code': country['CountryCode']
                                });
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
                  ],
                )
              : Flex(
                  direction: Axis.vertical,
                  children: [
                    LoadingView(),
                  ],
                )),
        ),
      ),
    );
  }
}
//LoadingView()
