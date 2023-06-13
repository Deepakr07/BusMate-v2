import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(EditProfile());
}

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24),
            width: double.infinity,
            height: double.infinity,
            child: FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Profile",
                      style: kBlackHeadingSize,
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: Image.network(
                                  "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                              .image,
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
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 34,
                    ),
                    Text(
                      "Change Name",
                      style: kGreyFormTextStyle,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      onChanged: (value) {},
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Text(
                      "Change Department",
                      style: kGreyFormTextStyle,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    TextField(
                      cursorColor: Colors.black,
                      onChanged: (value) {},
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                      "Change Student ID",
                      style: kGreyFormTextStyle,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      onChanged: (value) {},
                      decoration: kTextFieldDecoration,
                    ),
                    SizedBox(
                      height: 51,
                    ),
                    ContinueButton()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
