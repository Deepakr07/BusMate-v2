import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:busmate/model/widgets.dart';

void main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
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
                            CommonInputFieldContainer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      ContinueButton(),
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
                        onTap: () {},
                        child: Image.asset('./assets/google-icon.png'),
                      ),
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
                          SizedBox(width: 8),
                          Text(
                            "login",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff434343),
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
      ),
    );
  }
}
