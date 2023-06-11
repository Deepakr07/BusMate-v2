import 'package:flutter/material.dart';
import '../Constants/constants.dart';

//this ticket model is displayed in the active tickets

class activeTicket extends StatelessWidget {
  late final int ticketId;
  late final String route;
  //late final String status;  not displayed in active tickets
  String college = 'SOE';
  late final String destination;
  late final DateTime issueDate;
  late final DateTime expiryDate;
  late final ImageProvider qrImage;
  late final String ticketType; // not displayed in active tickets

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
                                      'Pathadipalam',
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
                                          '10 jan,23',
                                          style: kLargeGrey,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Route', style: kSmallGrey),
                                        Text('Vytilla', style: kLargeGrey),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Expiry date', style: kSmallGrey),
                                        Text(
                                          '9 Feb, 23',
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
                      child: Image(
                        image: AssetImage('./assets/qrcode.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '#Ticket ID',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
