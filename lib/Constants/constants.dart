import 'package:flutter/material.dart';

const Color kGreenMainTheme = Color(0xff37c976);
const Color kGreyTextColor = Color(0xff878080);

//Text style constants

//page heading Font-Size

const TextStyle kWhiteHeadingSize = TextStyle(
    fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700); //white
const TextStyle kBlackHeadingSize = TextStyle(
    fontSize: 25, color: Colors.black, fontWeight: FontWeight.w700); //black
//common grey text Style
const TextStyle kGreyTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  color: Color(0xff878080),
);
//ticket styles

const TextStyle kSmallGrey = TextStyle(color: kGreyTextColor, fontSize: 12);
const TextStyle kLargeGrey =
    TextStyle(fontWeight: FontWeight.w500, color: kGreyTextColor);

const TextStyle kSOEStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const TextStyle kDestinationStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

const TextStyle kGreyFormTextStyle = TextStyle(
  color: kGreyTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

//Common container for input fields (with green border)
