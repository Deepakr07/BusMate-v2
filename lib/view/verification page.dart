import 'package:busmate/model/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/view/createProfile.dart';
import 'package:pinput/pinput.dart';

void main() {
  runApp(Verification());
}

class Verification extends StatelessWidget {
  Verification({Key? key}) : super(key: key);
  final _verificationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _verificationKey,
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
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                length: 6,
                showCursor: true,
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedGreenButton(
                text: 'Continue',
                onTap: () => {
                  Get.offAll(() => CreateProfile(),
                      transition: Transition.rightToLeft,
                      duration: Duration(milliseconds: 500))
                },
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text('Edit Phone Number',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434343),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
