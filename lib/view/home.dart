import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/weatherController.dart';
import '../controller/date_controller.dart';
import '../model/ActiveTicket_List.dart';
import '../model/widgets.dart';
import '../controller/dotIndicator_Controller.dart';
import 'package:busmate/model/Bottomnav_model4.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  final dateController = Get.put(DateController());
  final WeatherController weatherController = Get.put(WeatherController());
  final DotIndicatorController dotController =
      Get.put(DotIndicatorController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kGreenMainTheme,
        bottomNavigationBar: BottomNavBar(),
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              //mainAxisAlignment:
                              //MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Hi, User Name',
                                  style: kWhiteHeadingSize,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Obx(() => Text(
                                      DateFormat('dd-MMM-yyyy').format(
                                          Get.find<DateController>()
                                              .currentDate
                                              .value),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFE4E4E4)),
                                    )),
                              ],
                            )),
                        Expanded(
                          child: Container(
                            height: 55,
                            padding: const EdgeInsets.only(
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
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 30,
                            ),
                            Text(
                              'Kochi Today',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Obx(
                      () {
                        if (weatherController.isloading.value) {
                          return const Center(
                              child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white)));
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: weatherController.weatherIcon.value,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                weatherController
                                    .currentWeatherDescription.value,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFE4E4E4)),
                              )
                            ],
                          );
                        }
                      },
                    ),
                  )
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
              child: Column(
                children: [
                  const Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Active Tickets',
                        style: kBlackHeadingSize,
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height < 700
                                    ? 174
                                    : 200,
                                child: PageView.builder(
                                  itemCount: activeTickets.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final activeTicket = activeTickets[index];
                                    return SizedBox(
                                      width: 330,
                                      child: activeTicket,
                                    );
                                  },
                                  onPageChanged: (int index) {
                                    dotController.updateIndex(index);
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              DotIndicator(
                                itemCount: activeTickets.length,
                                controller: dotController,
                              ),
                            ],
                          )))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
