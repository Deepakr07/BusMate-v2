import 'package:busmate/view/login.dart';
import 'package:flutter/material.dart';
import 'package:busmate/model/widgets.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:busmate/model/Bottomnav_model4.dart';
import 'package:busmate/services/auth_service.dart';
import 'package:get/get.dart';

void main() {
  runApp(EditProfile());
}

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  final _editProfileKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomNavBar(),
          body: Form(
            key: _editProfileKey,
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
                        "User Profile",
                        style: kBlackHeadingSize,
                      ),
                      SizedBox(
                        height: 29,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                ]),
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(20),
                            elevation: 6,
                            child: InkWell(
                              onTap: () {
                                AuthService().signOut();
                              },
                              splashColor: kGreenMainTheme,
                              child: Container(
                                width: 95,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: kGreenMainTheme, width: 1),
                                ),
                                child: Center(
                                    child: Text(
                                  "LogOut",
                                  style: TextStyle(
                                      color: kGreyTextColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 34,
                      ),
                      Text(
                        "Name",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      ConfirmSelectionContainer(),
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
                      ConfirmSelectionContainer(),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        "Student ID",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConfirmSelectionContainer(),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        "Mobile Number",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConfirmSelectionContainer(),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                        "E-mail ID",
                        style: kGreyFormTextStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConfirmSelectionContainer(),
                      // SizedBox(
                      //   height: 50,
                      // ),
                      // ElevatedGreenButton(text: 'Continue', onTap: () {}),
                      SizedBox(
                        height: 10,
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
