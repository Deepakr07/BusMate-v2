import 'package:busmate/model/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:busmate/Constants/constants.dart';

void main() {
  runApp(const Verification());
}

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Verification",
                  style: kBlackHeadingSize,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'You will recieve a code to verify your mobile number ',
                  style: kGreyTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Enter your OTP code here',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    otpTextBox(),
                    otpTextBox(),
                    otpTextBox(),
                    otpTextBox(),
                    otpTextBox(),
                    otpTextBox(),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                GreenButton(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'didn’t recieved the code',
                  style: kGreyFormTextStyle,
                ),
                Text('Resend',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff434343),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class otpTextBox extends StatelessWidget {
  const otpTextBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 55,
      child: Builder(
        builder: (BuildContext context) {
          return TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin) {},
              style: Theme.of(context).textTheme.titleLarge,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              decoration: kOtpText //.copyWith(hintText: '0'
              );
        },
      ),
    );
  }
}
