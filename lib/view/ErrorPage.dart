import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(const ErrorPage());
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kGreenMainTheme,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('./assets/payment error.png'),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Try Again",
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
        ),
      ),
    );
  }
}
