import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Container(
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
                            "Phone Number",
                            style: kGreyTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17),
                    CommonInputFieldContainer(),
                    SizedBox(
                      height: 19,
                    ),
                    Text(
                      "Password",
                      style: kGreyTextStyle,
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    CommonInputFieldContainer(),
                    SizedBox(height: 29),
                    ContinueButton(),
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
                    Image.asset('./assets/google-icon.png')
                  ],
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
                        GestureDetector(
                          onTap: () {},
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
      ),
    );
  }
}
