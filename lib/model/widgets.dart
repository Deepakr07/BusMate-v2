import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import '../controller/dotIndicator_Controller.dart';
import 'package:get/get.dart';

//Container with green border (used in every inputFields)
class CommonInputFieldContainer extends StatelessWidget {
  const CommonInputFieldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: kGreenMainTheme,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

//Common ContinueButton
class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: kGreenMainTheme,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
    );
  }
}

//horizontal line with OR

class HorizontalLineWithOr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Divider(
              color: Colors.black,
              height: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'OR',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Divider(
              color: Colors.black,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}

//Active Ticket

class activeTicket extends StatelessWidget {
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

class DotIndicator extends StatelessWidget {
  final int itemCount;
  final DotIndicatorController controller;
  final Color activeColor;
  final Color inactiveColor;

  const DotIndicator({
    Key? key,
    required this.itemCount,
    required this.controller,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(itemCount, (index) {
          final color = index == controller.currentIndex.value
              ? activeColor
              : inactiveColor;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          );
        }),
      ),
    );
  }
}

//activeticket list
// class ActiveTicketList extends StatelessWidget {
//   final List<activeTicket> activeTickets;
//
//   const ActiveTicketList({Key? key, required this.activeTickets})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: activeTickets.length,
//       itemBuilder: (context, index) {
//         return activeTickets[index];
//       },
//     );
//   }
// }
