import 'package:flutter/material.dart';
import 'package:busmate/Constants/constants.dart';
import 'package:flutter/services.dart';
import '../controller/dotIndicator_Controller.dart';
import 'package:get/get.dart';

//Container with green border (used in every inputFields)
// class CommonInputFieldContainer extends StatelessWidget {
//   const CommonInputFieldContainer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: kGreenMainTheme,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//   }
// }

//Common ContinueButton
class GreenButton extends StatelessWidget {
  const GreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: kGreenMainTheme,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Center(
        child: Text(
          "Continue",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
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

//Custom widget for home page dot indicator for the number of active tickets

class DotIndicator extends StatelessWidget {
  final int itemCount;
  final DotIndicatorController controller;
  final Color activeColor;
  final Color inactiveColor;

  const DotIndicator({
    Key? key,
    required this.itemCount,
    required this.controller,
    this.activeColor = kGreenMainTheme,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(itemCount, (index) {
          final color = index == controller.currentIndex.value
              ? activeColor
              : inactiveColor;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          );
        }),
      ),
    );
  }
}

//border Button

class borderbutton extends StatelessWidget {
  String text;
  final VoidCallback onTap;
  borderbutton({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(8),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 40)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: kGreenMainTheme, width: 2),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: kGreenMainTheme,
          ), // Change outline color
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: kGreyTextColor, fontSize: 16),
      ),
    );
  }
}

//elevated green  button with increased shadow
class ElevatedGreenButton extends StatelessWidget {
  late String text;
  final VoidCallback onTap;
  ElevatedGreenButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(8),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: kGreenMainTheme, width: 2),
          ),
        ),
        minimumSize:
            MaterialStateProperty.all<Size>(const Size(double.infinity, 40)),
        backgroundColor: MaterialStateProperty.all<Color>(kGreenMainTheme),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class ConfirmSelectionContainer extends StatelessWidget {
  late final String data;

  ConfirmSelectionContainer({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 49,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: kGreenMainTheme)),
      child: Padding(
        padding: const EdgeInsets.only(left: 21, top: 15, bottom: 15),
        child: Text(
          data,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
