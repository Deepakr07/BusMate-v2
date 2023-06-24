import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/view/bookingPage.dart';
import 'package:busmate/controller/dropDownController.dart';

class ConfirmSelection extends StatelessWidget {
  final String selectedRoute;
  final String selectedStop;
  final String selectedTicketType;

  ConfirmSelection({
    required this.selectedRoute,
    required this.selectedStop,
    required this.selectedTicketType,
  });

  void navigateToBooking() {
    Get.off(() => BookingPage());
  }

  void navigateToPayment() {
    // Add the code to navigate to the payment page here
  }

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.find<BookingController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(24),
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Confirm Selection",
                    style: kBlackHeadingSize,
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  const Text(
                    "Selected Route",
                    style: kGreyFormTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConfirmSelectionContainer(
                    data: controller.getSelectedRouteName() ?? "NA",
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  const Text(
                    "Selected Stop",
                    style: kGreyFormTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConfirmSelectionContainer(
                    data: controller.getSelectedStopName() ?? "NA",
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  const Text(
                    "Selected Ticket Type",
                    style: kGreyFormTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ConfirmSelectionContainer(
                    data: controller.getSelectedTicket() ?? "NA",
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  const SizedBox(
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
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 39,
                  ),
                  const Text(
                    "* You will be directed to the payment page after confirmation",
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
