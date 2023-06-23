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
  static String verify = "";
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
                              "Welcome",
                              style: kBlackHeadingSize,
                            ),
                            Text(
                              "Sign up/Log in with your mobile number",
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
                                  (String verificationId, int? resendToken) {
                                SignUp.verify = verificationId;
                                Get.to(() => Verification(),
                                    transition: Transition.rightToLeftWithFade,
                                    duration:
                                        const Duration(milliseconds: 500));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          }),
                      const SizedBox(
                        height: 38,
                      ),
                      HorizontalLineWithOr(),
                      const SizedBox(
                        height: 19,
                      ),
                      const Text(
                        "Continue with your Google Account",
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
            ],
          );
        },
      ),
    );
  }
}
