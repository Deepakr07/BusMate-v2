import 'package:busmate/model/widgets.dart';
import 'package:flutter/material.dart';
import 'package:busmate/model/ActiveTicket_model.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const TicketConfirmation());
}

class TicketConfirmation extends StatelessWidget {
  const TicketConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
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
                    child: SizedBox(height: 200, child: activeTicket())),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Ticket Generated at: ${DateFormat('hh:mm a').format(DateTime.now())}',
                  style: const TextStyle(color: kGreyTextColor, fontSize: 16),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  children: [
                    Expanded(
                      child: borderbutton(
                        text: 'Home',
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                        child: ElevatedGreenButton(
                      text: 'Download',
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
