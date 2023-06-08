import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/date_controller.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final dateController = Get.put(DateController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kGreenMainTheme,
          body: Column(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(24),
                height: double.infinity,
                width: double.infinity,
                color: kGreenMainTheme,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  //mainAxisAlignment:
                                  //MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Hi, User Name',
                                      style: kWhiteHeadingSize,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() => Text(
                                          DateFormat('dd-MMM-yyyy').format(
                                              Get.find<DateController>()
                                                  .currentDate
                                                  .value),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFFE4E4E4)),
                                        )),
                                  ],
                                )),
                            Expanded(
                              child: Container(
                                height: 55,
                                padding: EdgeInsets.only(
                                    left: 30, bottom: 5, top: 5),
                                child: CircleAvatar(
                                  maxRadius: 50,
                                  minRadius: 30,
                                  backgroundColor: kGreenMainTheme,
                                  backgroundImage: Image.network(
                                          'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
                                      .image,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                'Kochi Today',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: Container(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('./assets/rainy-icon.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rainy',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFE4E4E4)),
                            )
                          ],
                        )))
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35))),
                height: double.infinity,
                width: double.infinity,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
