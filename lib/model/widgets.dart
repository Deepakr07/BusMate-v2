import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';

//Container with green border (used in every inputFields)
class CommonInputFieldContainer extends StatelessWidget {
  const CommonInputFieldContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: kGreenMainTheme,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
