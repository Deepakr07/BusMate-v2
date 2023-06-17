import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(ConfirmSelection());
}

class ConfirmSelection extends StatelessWidget {
  const ConfirmSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(24),
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
                ConfirmSelectionContainer(),
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
                ConfirmSelectionContainer(),
                SizedBox(
                  height: 39,
                ),
                Text(
                  "Select Ticket Type",
                  style: kGreyFormTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                ConfirmSelectionContainer(),
                SizedBox(
                  height: 39,
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    Expanded(
                      child: borderbutton(
                        text: 'Home',
                      ),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                    Expanded(
                        child: ElevatedGreenButton(
                      text: 'Download',
                    ))
                  ],
                ),
                SizedBox(
                  height: 32,
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
    );
  }
}
