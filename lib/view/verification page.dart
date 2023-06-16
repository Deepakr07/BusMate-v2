import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(const Verification());
}

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Verification",
                  style: kBlackHeadingSize,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'You will recieve a code to verify your mobile number ',
                  style: kGreyTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kOtpText,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kOtpText,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kOtpText,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kOtpText,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kOtpText,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kOtpText,
                      ),
                    ),
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
