import 'package:fintech/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TextOnStyle {
  //onboard Textsize
  static const TextStyle h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: ColorsUse.textColorPrimary,
  );
  static const TextStyle h2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: "inter",

    color: ColorsUse.textColorSecondary,
  );
  static const TextStyle phoneNumber = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: ColorsUse.signUp,
  );
  static const TextStyle phoneNumberDes = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsUse.signUp,
  );
  //hinttext
  static const TextStyle hintText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorsUse.signUp,
  );
  static const TextStyle buttonStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsUse.signUp,
  );
  static const TextStyle signIntyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsUse.signUp,
  );
  static const TextStyle loanAppBarStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Color(0xff1F1F1F),
  );
  static const TextStyle loanRequestStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: ColorsUse.onBoardContainer,
  );
}
