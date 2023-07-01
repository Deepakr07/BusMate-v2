import 'package:flutter/material.dart';
import '../Constants/constants.dart';

//this ticket model is displayed in the active tickets

class activeTicket extends StatelessWidget {
  late final String ticketId;
  late final String route;
  //late final String status;  not displayed in active tickets
  String college = 'SOE';
  late final String destination;
  late final String issueDate;
  late final String expiryDate;
  late final String qrImage;
  late final String ticketType;
  late int rides = 0;

  activeTicket(
      {required this.ticketId,
      required this.route,
      required this.destination,
      required this.issueDate,
      required this.expiryDate,
      required this.qrImage,
      required this.rides});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),
        width: 330,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(10),
                height: double.infinity,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SOE',
                                      style: kSOEStyle,
                                    ),
                                    Image.asset('./assets/doubleArrow.png'),
                                    Text(
                                      destination,
                                      style: kDestinationStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Issue date', style: kSmallGrey),
                                        Text(
                                          issueDate,
                                          style: kLargeGrey,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Route', style: kSmallGrey),
                                        Text(route, style: kLargeGrey),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Expiry date', style: kSmallGrey),
                                        Text(
                                          expiryDate,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: kGreyTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Image.network(qrImage),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ID#: " + ticketId,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  Text(
                    "Rides: $rides",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
