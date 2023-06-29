import 'package:busmate/controller/profileController.dart';
import 'package:busmate/model/userModel.dart';
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
    final controller = Get.put(profileController());
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
                  child: FutureBuilder(
                    future: controller.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          UserModel userData = snapshot.data as UserModel;
                          return Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: Image.asset(
                                                    './assets/profile-icon.png')
                                                .image,
                                            radius: 20,
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            userData.name,
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                              ConfirmSelectionContainer(
                                data: userData.name,
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
                              ConfirmSelectionContainer(
                                data: userData.department,
                              ),
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
                              ConfirmSelectionContainer(
                                data: userData.studentId,
                              ),
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
                              ConfirmSelectionContainer(
                                data: userData.mobileNo,
                              ),
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
                              ConfirmSelectionContainer(
                                data: userData.Email,
                              ),
                              // SizedBox(
                              //   height: 50,
                              // ),
                              // ElevatedGreenButton(text: 'Continue', onTap: () {}),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else {
                          return const Center(
                            child: Text("Somthing went wrong"),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
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
