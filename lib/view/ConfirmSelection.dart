import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/view/bookingPage.dart';
import 'package:busmate/controller/dropDownController.dart';
import 'package:busmate/controller/PaymentController.dart';
import 'package:intl/intl.dart';
import 'package:busmate/controller/confirmSelectionController.dart';

class ConfirmSelection extends StatelessWidget {
  var currentDate = DateTime.now();
  var issueDate;
  var ExpiryDate;
  var Amount;
  var stop;
  var route;
  var formattedExpiryDate;
  var formattedIssueDate;
  var ticketType;
  int count = 0;
  void navigateToBooking() {
    Get.off(() => BookingPage());
  }

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.find<BookingController>();
    final paymentController _paymentController = Get.put(paymentController());
    final ConfirmSelectionController confirmController =
        Get.put(ConfirmSelectionController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return confirmController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: kGreenMainTheme,
                  ),
                )
              : Container(
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
                              data: controller.getSelectedRouteName()),
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
                              data: controller.getSelectedStopName()),
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
                                  onTap: () {
                                    issueDate = currentDate;
                                    formattedIssueDate = DateFormat('dd-MMM-yy')
                                        .format(issueDate);
                                    stop = controller.getSelectedStopName();
                                    route = controller.getSelectedRouteName();
                                    ticketType = controller.getSelectedTicket();
                                    print(issueDate);
                                    if (controller.getSelectedTicket() ==
                                        "Weekly (₹30)") {
                                      ExpiryDate =
                                          currentDate.add(Duration(days: 7));
                                      formattedExpiryDate =
                                          DateFormat('dd-MMM-yy')
                                              .format(ExpiryDate);
                                      Amount = 30;
                                      count = 10;
                                      print(formattedExpiryDate);
                                    } else if (controller.getSelectedTicket() ==
                                        "Monthly (₹80)") {
                                      ExpiryDate =
                                          currentDate.add(Duration(days: 30));
                                      formattedExpiryDate =
                                          DateFormat('dd-MMM-yy')
                                              .format(ExpiryDate);
                                      Amount = 80;
                                      count = 50;
                                      print(formattedExpiryDate);
                                    } else if (controller.getSelectedTicket() ==
                                        "Daily (₹10)") {
                                      ExpiryDate =
                                          currentDate.add(Duration(days: 1));
                                      formattedExpiryDate =
                                          DateFormat('dd-MMM-yy')
                                              .format(ExpiryDate);
                                      Amount = 10;
                                      count = 2;
                                      print(formattedExpiryDate);
                                    }
                                    print(Amount);
                                    _paymentController.computeTicketDetails(
                                        stop,
                                        route,
                                        ticketType,
                                        Amount,
                                        formattedIssueDate,
                                        formattedExpiryDate,
                                        count);
                                    _paymentController.startPayment(Amount);
                                  },
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
                );
        }),
      ),
    );
  }
}
