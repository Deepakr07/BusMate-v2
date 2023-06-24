import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/view/bookingPage.dart';

void main() {
  runApp(ConfirmSelection());
}

class ConfirmSelection extends StatelessWidget {
  const ConfirmSelection({Key? key}) : super(key: key);
  void navigateToBooking() {
    Get.off(() => BookingPage());
  }

  void navigateToPayment() {
    Get.off(() => ConfirmSelection());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(24),
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Confirm Selection",
                    style: kBlackHeadingSize,
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  Text(
                    "Selected Route",
                    style: kGreyFormTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ConfirmSelectionContainer(
                    data: "hey",
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Text(
                    "Selected Stop",
                    style: kGreyFormTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ConfirmSelectionContainer(
                    data: "hey",
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  Text(
                    "Selected Ticket Type",
                    style: kGreyFormTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ConfirmSelectionContainer(
                    data: "hey",
                  ),
                  SizedBox(
                    height: 33,
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: borderbutton(
                          text: 'Go Back',
                          onTap: navigateToBooking,
                        ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Expanded(
                          child: ElevatedGreenButton(
                        text: 'Confirm',
                        onTap: navigateToPayment,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 39,
                  ),
                  Text(
                    "* You will be directed to payment page after confirmation",
                    style: TextStyle(
                      fontSize: 16,
                      color: kGreyTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
