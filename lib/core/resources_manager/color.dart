import 'package:flutter/material.dart';

class ColorManager {
  static final ColorManager _instance = ColorManager._internal();

  factory ColorManager() {
    return _instance;
  }

  ColorManager._internal();

  static const Color primaryColor = Color(0xFF641027);
  static const Color secondaryColor = Color(0xFF77B7B);
  static const Color secondColor = Color.fromARGB(255, 255, 255, 255);
  static Color primaryColorDark = const Color.fromARGB(255, 2, 2, 2);

  static const Color focusColor = Color(0xFFF6F4F4);
  static const Color fillcolor = Color(0xFF2D4568);

  static const Color hintGrayColor = Color(0xFFC3C3C3);
  static const Color greyBackgroundColor = Color(0xffF2F2F2);
  static const Color focusColorDark = Color(0xFFF6F1F1);
  static const Color subtitleColor = Color(0xFF979797);
  static const Color textBlack = Color(0xFF2C2C2C);
  static const Color greyColor = Color(0xFFF6F6F6);
  static const Color newGreyColor = Color(0xFFE8E8E8);
  static const Color drwaerIconsTextColor = Color(0xFFA3A3A3);
  static const Color borderColor = Color(0xFFD7D5D7);
  static const Color forgetPasswordBackgroundButtonColor = Color(0xFFF3F3F3);

  static const Color circleColorIndicator = Color(0xFFD9D9D9);

  static const Color hintColor = Color.fromARGB(255, 184, 181, 181);
  static const Color hintColorDark = Color.fromARGB(255, 254, 255, 254);

  static const Color pendingColor = Color.fromARGB(255, 150, 149, 138);
  static const Color dividerColorDark = Color(0xFFD6D6D6);

  static const Color descriptionColor = Color(0xFF292929);

  static const Color lightThemeColor = Color(0xffffffff);
  static const Color darkThemeColor = Color(0xFF000000);
  static const Color backgroundColor = Color(0xfff1efef);
  static const Color borderInputColor = Color(0xffCCCCCC);
  static const Color lableInputColor = Color(0xff2C2C2C);
  static const Color hintInputColor = Color(0xff797979);
  static const Color dateColor = Color(0xff6C6C6C);
  static const Color semiGreyColor = Color(0xff7D7D7D);
  static const Color lightGreyColor = Color(0xffE3E3E3);
  static const Color darkGreyColor = Color(0xffE8E8E8);
  static const Color transparentColor = Colors.transparent;
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Color(0xFF1D1B1C);
  static const Color semiBlackColor = Color(0xFF2E2E2E);
  static const Color darkBlackColor = Color(0xFF1D1B1C);
  static const Color darkerBlackColor = Color(0xFF242424);
  static const Color semiGrayBlackColor = Color(0xFF676767);
  static const Color inputTextColor = Color.fromARGB(255, 34, 32, 32);
  static const Color redColor = Color(0xFFDC0101);
  // static const Color redColor = Color(0xFF641027);
  static const Color errorColor = Color(0xFF641027);

  static const Color backgroundColorCircularLoading = Colors.black26;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
