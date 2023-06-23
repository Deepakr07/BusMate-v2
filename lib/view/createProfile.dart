import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:get/get.dart';
import 'package:busmate/view/home.dart';

void main() {
  runApp(CreateProfile());
}

class CreateProfile extends StatelessWidget {
  CreateProfile({Key? key}) : super(key: key);
  final _createProfileKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Form(
            key: _createProfileKey,
            child: Container(
              padding: EdgeInsets.all(24),
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Profile",
                        style: kBlackHeadingSize,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: Image.network(
                              "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                            ).image,
                            radius: 40,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "User Name",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Text(
                        "Full Name",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            return "Enter Correct Name";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Text(
                        "Department",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                            return "Enter Correct Department";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Text(
                        "Student ID",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[0-9]+$').hasMatch(value!)) {
                            return "Enter Correct Student ID";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Text(
                        "Mobile Number",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^\d{10,}$').hasMatch(value!)) {
                            return "Enter Correct Mobile Number";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Text(
                        "E-mail",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                                  .hasMatch(value!)) {
                            return "Enter Correct E-mail";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Colors.black,
                        onChanged: (value) {},
                        decoration: kTextFieldDecoration,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedGreenButton(
                        text: 'Continue',
                        onTap: () {
                          if (_createProfileKey.currentState!.validate()) {
                            Get.off(HomePage());
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
