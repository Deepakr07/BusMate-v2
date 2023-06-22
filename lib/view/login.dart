import 'package:busmate/services/auth_service.dart';
import 'package:busmate/view/home.dart';
import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:busmate/view/signUp.dart';
import 'package:get/get.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            Form(
              key: _loginKey,
              child: Container(
                padding: EdgeInsets.all(24),
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "Login",
                            style: kBlackHeadingSize,
                          ),
                          Text(
                            "Log in with your mobile number",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff878080),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            "Enter Phone Number",
                            style: kGreyTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17),
                    TextFormField(
                      validator: (String? value) {},
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      onChanged: (value) {},
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(height: 29),
                    ElevatedGreenButton(
                        text: 'Continue',
                        onTap: () {
                          Get.off(() => HomePage());
                        }),
                    SizedBox(
                      height: 36,
                    ),
                    HorizontalLineWithOr(),
                    SizedBox(
                      height: 19,
                    ),
                    Text(
                      "Continue with your Google account",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kGreyTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 17,
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
                      Text(
                        "Create new Account",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(() => SignUp());
                        },
                        child: Text(
                          "register",
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
      }),
    );
    ;
  }
}
