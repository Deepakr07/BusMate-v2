import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/model/ActiveTicket_model.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:busmate/view/home.dart';
import 'package:busmate/controller/bottomNavBarController.dart';

void main() {
  runApp(TicketConfirmation());
}

class TicketConfirmation extends StatelessWidget {
  final BottomNavBarController _controller = Get.find();

  void navigateToHome() {
    _controller.changePage(0);
    Get.off(() => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Confirmation",
              style: kBlackHeadingSize,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Your Ticket",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 200,
                child: activeTicket(
                  destination: 'Pathadipalam',
                  route: 'Vytilla',
                  expiryDate: '19 Feb, 23',
                  issueDate: '19 Feb, 23',
                  ticketId: '55544654654',
                  ticketType: 'Daily',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Ticket Generated at: ${DateFormat('hh:mm a').format(DateTime.now())}',
              style: const TextStyle(color: kGreyTextColor, fontSize: 16),
            ),
            const SizedBox(
              height: 65,
            ),
            Row(
              children: [
                Expanded(
                  child: borderbutton(
                    text: 'Home',
                    onTap: navigateToHome,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: ElevatedGreenButton(
                    text: 'Download',
                    onTap: () => {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
