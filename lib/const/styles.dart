import 'package:flutter/material.dart';
import 'package:stripe_payment/const/colors.dart';

class AppStyles {
  static TextStyle w400f22lulo = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 22,
    fontFamily: "lulo",
    letterSpacing: -1,
    color: kGrey400Color,
  );
  static TextStyle w400f15lulo = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: -1,
    fontFamily: "lulo",
    color: kGrey600Color,
  );
  static TextStyle w600f15josefin = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    fontFamily: "gill sans",
    color: kGrey400Color,
  );
  static TextStyle w300f11josefin = const TextStyle(
    fontWeight: FontWeight.w300,
    fontSize: 11,
    fontFamily: "gill sans",
    color: kGrey300Color,
    // letterSpacing: -1,
  );
  static TextStyle w400f14josefin = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: "gill sans",
    color: kGrey400Color,
  );
  static TextStyle w400f11josefin = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    fontFamily: "gill sans",
    color: kGrey100Color,
  );
  static TextStyle w500f10josefin = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    fontFamily: "gill sans",
    color: kPrimaryColor,
  );
  static TextStyle w400f14spartan = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: "spartan",
    color: kGrey400Color,
    letterSpacing: -1,
  );
  static TextStyle w500f7poppins = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 7.7,
    fontFamily: "poppins",
    color: kGrey2Color,
    letterSpacing: -0.1,
  );

  static TextStyle hintTextStyle = const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14, color: kLightBgGreyColor);
}
