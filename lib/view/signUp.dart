import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:busmate/model/widgets.dart';
import 'package:get/get.dart';
import 'package:busmate/view/login.dart';
import 'package:busmate/view/verification page.dart';
import 'package:busmate/services/auth_service.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  var phoneNumber = "";
  static const countryCode = '+91';
  SignUp({Key? key}) : super(key: key);
  final _signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Form(
                key: _signUpKey,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Sign up",
                              style: kBlackHeadingSize,
                            ),
                            Text(
                              "Sign up with your mobile number",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff878080),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              "Enter Phone Number",
                              style: kGreyTextStyle,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              onChanged: (value) {
                                phoneNumber = value;
                              },
                              validator: (String? value) {},
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              cursorColor: Colors.black,
                              decoration: kTextFieldDecoration,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      ElevatedGreenButton(
                          text: 'Continue',
                          onTap: () async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "${countryCode + phoneNumber}",
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {},
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                            Get.to(() => Verification(),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 500));
                          }),
                      const SizedBox(
                        height: 38,
                      ),
                      HorizontalLineWithOr(),
                      const SizedBox(
                        height: 19,
                      ),
                      const Text(
                        "Sign Up with your Google Account",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kGreyTextColor,
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      InkWell(
                        onTap: () {
                          AuthService().signInWithGoogle(context);
                        },
                        child: Image.asset('./assets/google-icon.png'),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: constraints.maxHeight *
                    0.05, //places the text 5percent from the bottom of the screen
                child: FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          "already have an account",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            Get.off(() => Login());
                          },
                          child: const Text(
                            "login",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff434343),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
