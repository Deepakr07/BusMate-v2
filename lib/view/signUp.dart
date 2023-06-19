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
                  padding: EdgeInsets.all(24),
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
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Enter Phone Number",
                              style: kGreyTextStyle,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              onChanged: (value) {},
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
                      GestureDetector(
                          onTap: () {
                            Get.off(() => Verification(),
                                transition: Transition.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 500));
                          },
                          child: GreenButton()),
                      SizedBox(
                        height: 38,
                      ),
                      HorizontalLineWithOr(),
                      SizedBox(
                        height: 19,
                      ),
                      Text(
                        "Sign Up with your Google Account",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kGreyTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      GestureDetector(
                          onTap: () {
                            AuthService().signInWithGoogle();
                          },
                          child: Image.asset('./assets/google-icon.png'))
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
                        Text(
                          "already have an account",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            Get.off(() => Login());
                          },
                          child: Text(
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
