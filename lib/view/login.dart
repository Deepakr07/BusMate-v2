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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: CommonInputFieldContainer(),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: CommonInputFieldContainer(),
                    ),
                    SizedBox(height: 29),
                    ContinueButton(),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
