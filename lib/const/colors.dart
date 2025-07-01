import 'package:flutter/material.dart';

//instructr app
const kPrimaryColor = Color(0XFF6B3DA1);
const kScaffoldColor = Color(0XFFF8F8F8);
const kWhiteColor = Color(0xFFFFFFFF);
const kYellowColor = Color(0XFFF7941D);
const kOrangeColor = Color(0XFFF68712);
const kBlueColor = Color(0XFF4548A5);
const kPurpleTextColor = Color(0XFF8855C8);
const kPurple1Color = Color(0XFF9F73D9);
const kPurple2Color = Color(0XFFBA9AE6);
const kGrey400Color = Color(0XFF4F4C4D);
const kGrey4Color = Color(0XFFD1D1D6);
const kGrey100Color = Color(0XFFBBBABA);
const kGrey50Color = Color(0XFFE9E9E9);
const kGrey200Color = Color(0XFF9A9898);
const kGrey500Color = Color(0XFF231F20);
const kGrey2Color = Color(0XFFAEAEB2);
const kGrey6Color = Color(0XFFF2F2F7);
const kGrey300Color = Color(0XFF6C696A);
const kGrey600Color = Color(0XFF201C1D);
const kDisabledButtonColor = Color(0XFFB29BCD);
const kLightGreyColor = Color(0XFF595959);
const kPinkColor = Color(0XFFF0377A);
const kGray38Color = Color(0XFF383838);
const kGray33Color = Color(0XFF333333);
const kGray54Color = Color(0XFF545454);
const kGray23Color = Color(0XFF232323);
const kGrayButton = Color(0XFF787880);
const kBackgroundBlack = Color(0XFF0F0D0D);

const inActiveIconColor = Color(0xFFB6B6B6);
const kBlackColor = Color(0xFF00001E);
const kDarkBlackColor = Color(0xFF000000);
const kLightGrayColor = Color(0XFF5D5D5D);
const kHintTextColor = Color(0XFF858585);
const kLightBgGreyColor = Color(0XFFE9E9EB);
const kErrorColor = Color(0xffF5222D);
const kGreenColor = Color(0xff20C375);

Map<int, Color> color = {
  50: const Color(0xFFEDE8F4),
  100: const Color(0xFFD3C5E3),
  200: const Color(0xFFB59ED0),
  300: const Color(0xFF9777BD),
  400: const Color(0xFF815AAF),
  500: const Color(_primaryPrimaryValue),
  600: const Color(0xFF633799),
  700: const Color(0xFF582F8F),
  800: const Color(0xFF4E2785),
  900: const Color(0xFF3C1A74),
};
const int _primaryPrimaryValue = 0xFF6B3DA1;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFCAAEFF),
  200: Color(_primaryAccentValue),
  400: Color(0xFF8748FF),
  700: Color(0xFF772FFF),
});
const int _primaryAccentValue = 0xFFA97BFF;

String defaultProfile =
    'https://firebasestorage.googleapis.com/v0/b/instructr-app.appspot.com/o/pngegg.png?alt=media&token=ccb538bf-8f07-4e2c-ad47-9ca4d5d57667';
String defaultCarImage =
    'https://images.unsplash.com/photo-1570294646112-27ce4f174e38?ixlib=rb-4.0.3';
