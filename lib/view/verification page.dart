import 'package:busmate/model/widgets.dart';
import 'package:busmate/view/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/view/createProfile.dart';
import 'package:pinput/pinput.dart';

//verification
void main() {
  runApp(Verification());
}

class Verification extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Verification({Key? key}) : super(key: key);
  final _verificationKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var code = "";
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
                onChanged: (value) {
                  code = value;
                },
                onCompleted: (pin) => print(pin),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedGreenButton(
                text: 'Continue',
                onTap: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: SignUp.verify, smsCode: code);

                    // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                    Get.offAll(
                        () =>
                            CreateProfile(), //TODO: Condition to check weather the user already created profile with the UID, If Already present, the user should be directed to the home page, else to Create Profile Page
                        //TODO:(The condition can be checked by checking if there exist any user profile with same authUID as the Currently signed in account)
                        transition: Transition.rightToLeft,
                        duration: Duration(milliseconds: 500));
                  } catch (e) {
                    Get.snackbar("Error",
                        "Please check whether you have entered the correct OTP");
                    print("Invalid OTP");
                  }
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
