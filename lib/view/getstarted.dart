import 'package:busmate/Constants/constants.dart';
import 'package:busmate/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:busmate/view/signUp.dart';

void main() {
  runApp(GetStarted());
}

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenMainTheme,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: kGreenMainTheme,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("./assets/BM-logo.png"),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22),
              child: GestureDetector(
                onTap: () {
                  Get.off(() => SignUp(),
                      transition: Transition.rightToLeftWithFade,
                      duration: const Duration(milliseconds: 500));
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: kGreenMainTheme,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
