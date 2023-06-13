import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(SetupPassword());
}

class SetupPassword extends StatelessWidget {
  const SetupPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(24),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Setup Password",
                style: kBlackHeadingSize,
              ),
              SizedBox(
                height: 24,
              ),
              Text("Enter password"),
              SizedBox(
                height: 21,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                onChanged: (value) {},
                decoration: kTextFieldDecoration,
              ),
              SizedBox(
                height: 32,
              ),
              Text("Confirm Password"),
              SizedBox(
                height: 21,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                onChanged: (value) {},
                decoration: kTextFieldDecoration,
              ),
              SizedBox(
                height: 46,
              ),
              ContinueButton()
            ],
          ),
        ),
      ),
    );
  }
}
