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
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirmation",
                  style: kBlackHeadingSize,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Your Ticket",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(height: 200, child: activeTicket())),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ticket Generated at: ${DateFormat('hh:mm a').format(DateTime.now())}',
                  style: TextStyle(color: kGreyTextColor, fontSize: 16),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(8),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(double.infinity, 45)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side:
                                  BorderSide(color: kGreenMainTheme, width: 2),
                            ),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(
                              color: kGreenMainTheme,
                            ), // Change outline color
                          ),
                        ),
                        child: const Text(
                          'Home',
                          style: TextStyle(color: kGreyTextColor, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all<double>(8),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                                color: kGreenMainTheme, width: 2),
                          ),
                        ),
                        minimumSize: MaterialStateProperty.all<Size>(
                            Size(double.infinity, 45)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kGreenMainTheme),
                      ),
                      child: const Text(
                        'Download',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
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
