import 'package:busmate/Constants/constants.dart';
import 'package:flutter/material.dart';

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
        body: Container(
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
                          color: Color(0xff878080)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
