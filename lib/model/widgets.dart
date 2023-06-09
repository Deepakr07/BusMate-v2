import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';

//Container with green border (used in every inputFields)
class CommonInputFieldContainer extends StatelessWidget {
  const CommonInputFieldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: kGreenMainTheme,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

//Common ContinueButton
class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: kGreenMainTheme,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            "Continue",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
    );
  }
}

//horizontal line with OR

class HorizontalLineWithOr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 22),
            child: Divider(
              color: Colors.black,
              height: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            'OR',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Divider(
              color: Colors.black,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
