import 'package:busmate/model/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/view/createProfile.dart';

void main() {
  runApp(Verification());
}

class Verification extends StatelessWidget {
  Verification({Key? key}) : super(key: key);
  final verificationFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Form(
            key: verificationFormKey,
            child: Container(
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
                  Text(
                    'Enter your OTP code here',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      otpTextBox(),
                      otpTextBox(),
                      otpTextBox(),
                      otpTextBox(),
                      otpTextBox(),
                      otpTextBox(),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  GestureDetector(
                  onTap: () => {
                        Get.off(() => CreateProfile(),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 300))
                      },
                  child: GreenButton()),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'didn’t recieved the code',
                    style: kGreyFormTextStyle,
                  ),
                  Text('Resend',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff434343),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
