import 'package:busmate/model/ActiveTicket_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/profileController.dart';
import '../controller/weatherController.dart';
import '../controller/date_controller.dart';
import '../model/ActiveTicket_List.dart';
import '../model/widgets.dart';
import '../controller/dotIndicator_Controller.dart';
import 'package:busmate/model/Bottomnav_model4.dart';
import 'package:busmate/model/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  final dateController = Get.put(DateController());
  final _firestore = FirebaseFirestore.instance;
  final WeatherController weatherController = Get.put(WeatherController());
  final DotIndicatorController dotController =
      Get.put(DotIndicatorController());

  String? userUid;
  void getUserUid() {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userUid = user.uid;
    } else {
      // Handle the case when the user is not logged in
      // You can set userUid to null or handle the situation accordingly
      userUid = null;
    }
  }

  Future<void> activeTicketStream() async {
    Stream<QuerySnapshot> snapshotStream =
        _firestore.collection('Tickets').snapshots();

    await for (var snapshot in snapshotStream) {
      for (var ticket in snapshot.docs) {
        Object? data = ticket.data();
        print(data);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(profileController());
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
                                FutureBuilder(
                                    future: controller.getUserData(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        if (snapshot.hasData) {
                                          UserModel userData =
                                              snapshot.data as UserModel;
                                          return Text(
                                            'Hi, ${userData.name}',
                                            style: kWhiteHeadingSize,
                                          );
                                        } else if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  snapshot.error.toString()));
                                        } else {
                                          return const Center(
                                            child: Text("Somthing went wrong"),
                                          );
                                        }
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
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
                              Expanded(
                                child: StreamBuilder(
                                  stream: _firestore
                                      .collection('Tickets')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: CircularProgressIndicator(
                                          backgroundColor: kGreenMainTheme,
                                        ),
                                      );
                                    }
                                    final QuerySnapshot<Map<String, dynamic>>
                                        querySnapshot = snapshot.data!;
                                    final List<
                                            QueryDocumentSnapshot<
                                                Map<String, dynamic>>> tickets =
                                        querySnapshot.docs;
                                    activeTickets = [];
                                    for (var ticket in tickets) {
                                      final destination =
                                          ticket.data()['Destination'];
                                      final expiryDate =
                                          ticket.data()['ExpiryDate'];
                                      final issueDate =
                                          ticket.data()['IssueDate'];
                                      final count = ticket.data()['count'];
                                      final route = ticket.data()['Route'];
                                      final ticketType =
                                          ticket.data()['TicketType'];
                                      final id = ticket.data()['id'];
                                      final image = ticket.data()['ImageUrl'];
                                      final uid = ticket.data()['Uid'];

                                      activeTickets.add(activeTicket(
                                          ticketId: id,
                                          route: route,
                                          destination: destination,
                                          issueDate: issueDate,
                                          expiryDate: expiryDate,
                                          ticketType: ticketType));
                                      // print(destination);
                                    }
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height <
                                                  700
                                              ? 174
                                              : 200,
                                      child: PageView.builder(
                                        itemCount: activeTickets.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final activeTicket =
                                              activeTickets[index];
                                          return SizedBox(
                                            width: 330,
                                            child: activeTicket,
                                          );
                                        },
                                        onPageChanged: (int index) {
                                          dotController.updateIndex(index);
                                        },
                                      ),
                                    );

                                    // return your desired UI widget here
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
