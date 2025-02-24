import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flymefy/core/input_validation/input_border.dart';
import 'package:flymefy/core/resources_manager/color.dart';
import 'package:flymefy/core/resources_manager/font.dart';
import 'package:flymefy/core/resources_manager/style.dart';
import 'package:flymefy/core/resources_manager/values.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'constant.dart';

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();

  factory ThemeManager() {
    return _instance;
  }

  ThemeManager._internal();

  ThemeData get getLightTheme => _getLightTheme();

  ThemeData get getDarkTheme => _getDarkTheme();

  void changeStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        _setStatusBarAndNavigationBarColors(
            SystemUiOverlayStyle.light, ColorManager.lightThemeColor);
        break;
      case ThemeMode.dark:
        _setStatusBarAndNavigationBarColors(
            SystemUiOverlayStyle.dark, ColorManager.darkThemeColor);
        break;
      case ThemeMode.system:
      default:
        (AppConstants.defaultThemeModeApp == AppConstants.darkTheme)
            ? _setStatusBarAndNavigationBarColors(
                SystemUiOverlayStyle.dark, ColorManager.darkThemeColor)
            : _setStatusBarAndNavigationBarColors(
                SystemUiOverlayStyle.light, ColorManager.lightThemeColor);
        break;
    }
  }

  void _setStatusBarAndNavigationBarColors(
      SystemUiOverlayStyle overlayStyle, Color color) {
    overlayStyle == SystemUiOverlayStyle.dark
        ? SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.black,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.black,
            systemNavigationBarIconBrightness: Brightness.light,
          ))
        : SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
            .copyWith(
                statusBarColor: Colors.white,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white,
                systemNavigationBarIconBrightness: Brightness.dark));
  }

  _getLightTheme() => ThemeData(
        useMaterial3: true,
        fontFamily: "AirbnbCereal",

        extensions: const [
          SkeletonizerConfigData(
            effect: ShimmerEffect(),
            justifyMultiLineText: true,
            textBorderRadius:
                TextBoneBorderRadius(BorderRadiusDirectional.vertical()),
            ignoreContainers: false,
          ), // default constructor has light theme config
        ],
        scaffoldBackgroundColor: ColorManager.whiteColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

        visualDensity: VisualDensity.adaptivePlatformDensity,
        navigationBarTheme: NavigationBarThemeData(
          elevation: AppSize.appSize3,
          height: 65,
          shadowColor: const Color(0xFF82A9BC).withOpacity(.16),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (Set<WidgetState> states) => states.contains(WidgetState.selected)
                  ? const TextStyle(
                      color: ColorManager.primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: FontManager.fontSize14)
                  : const TextStyle(
                      color: Color(0xFFBDBDBD),
                      fontWeight: FontWeight.w400,
                      fontSize: FontManager.fontSize12)),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (Set<WidgetState> states) => states.contains(WidgetState.selected)
                ? const IconThemeData(
                    color: ColorManager.whiteColor,
                    size: AppSize.appSize26,
                  )
                : const IconThemeData(
                    color: Color(0xFFBDBDBD), size: AppSize.appSize26),
          ),
        ),

        /* ---------------------------------------- colors values ----------------------------------*/
        primaryColor: ColorManager.primaryColor,

        brightness: Brightness.light,
        dividerColor: ColorManager.primaryColor,
        focusColor: ColorManager.primaryColor,
        hintColor: ColorManager.primaryColor,
        splashColor: ColorManager.primaryColor,
        /* ------------------------------------------ themes style --------------------------------- */
        //AppBar Theme style
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: ColorManager.primaryColor),
        //AppBar Theme style
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            centerTitle: true,
            shape: Border(
                bottom:
                    BorderSide(color: Colors.grey.withOpacity(.3), width: 1)),
            elevation: AppSize.appSize0,
            titleTextStyle: getRegularStyle(
                color: ColorManager.primaryColor,
                fontSize: FontManager.fontSize16)),
        //Card Theme style
        cardTheme: const CardTheme(
            color: ColorManager.whiteColor,
            elevation: AppSize.appSize10,
            shadowColor: ColorManager.primaryColor),
        //elevated Button Theme style
        iconTheme: const IconThemeData(
            color: ColorManager.primaryColor, size: AppSize.appSize40),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                disabledBackgroundColor:
                    ColorManager.primaryColor.withOpacity(AppSize.appSize0_60),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.appSize4)),
                elevation: AppSize.appSize5,
                textStyle: getRegularStyle(
                  color: ColorManager.primaryColor,
                  fontSize: FontManager.fontSize14,
                ).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: FontManager.fontSize18))),
        //Button Theme style
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: TextStyle(
              fontFamily: "AirbnbCereal",
              fontWeight: FontWeight.w500,
              fontSize: 11,
              color: ColorManager.primaryColor,
            ),
            unselectedLabelStyle: TextStyle(
                fontFamily: "AirbnbCereal",
                fontWeight: FontWeight.w500,
                fontSize: 11,
                color: Colors.white),
            elevation: AppSize.appSize0_10,
            backgroundColor: ColorManager.secondColor),
        buttonTheme: const ButtonThemeData(
            shape: StadiumBorder(),
            disabledColor: ColorManager.primaryColor,
            splashColor: ColorManager.primaryColor,
            buttonColor: ColorManager.focusColor),
        //text Button Theme style

        //color scheme style
        colorScheme: const ColorScheme.light(
          primary: ColorManager.primaryColor,
          secondary: ColorManager.primaryColor,
        ),
        //theme input
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: FontManager.fontSize20,
              fontWeight: FontManager.bold,
              color: ColorManager.secondColor,
              height: AppSize.appSize1_2),
          headlineSmall: TextStyle(
              fontSize: FontManager.fontSize22,
              fontWeight: FontManager.bold,
              color: ColorManager.primaryColor,
              height: AppSize.appSize1_2),
          headlineLarge: TextStyle(
              fontSize: FontManager.fontSize16,
              fontWeight: FontManager.light,
              color: ColorManager.primaryColor,
              height: AppSize.appSize1_2),
          titleSmall: TextStyle(
              fontSize: FontManager.fontSize16,
              fontWeight: FontManager.bold,
              color: ColorManager.primaryColor,
              height: AppSize.appSize1_2),
          titleMedium: TextStyle(
              fontSize: FontManager.fontSize14,
              fontWeight: FontManager.simaBold,
              color: ColorManager.primaryColor,
              height: AppSize.appSize1_2),
          bodyMedium: TextStyle(
              fontSize: FontManager.fontSize14,
              fontWeight: FontManager.bold,
              color: ColorManager.primaryColor,
              height: AppSize.appSize1_2),
          bodySmall: TextStyle(
              fontSize: FontManager.fontSize12,
              fontWeight: FontManager.bold,
              color: ColorManager.primaryColor,
              height: AppSize.appSize1_2),
          bodyLarge: TextStyle(
              fontSize: FontManager.fontSize12,
              fontWeight: FontManager.bold,
              color: ColorManager.primaryColor,
              height: AppSize.appSize1_2),
        ),
        //theme input
        inputDecorationTheme: InputDecorationTheme(
          //content padding value
          contentPadding: const EdgeInsets.all(AppSize.appSize8),
          border: getInputBorder(),
          //hint style
          hintStyle: getHintStyle(),

          //error style
          errorStyle: getErrorStyle(),
          //enabled Border error border style
          enabledBorder: getInputBorder(),
          //focused  border style
          focusedBorder: getInputBorder(),
          //error border style
          errorBorder: getInputBorderError(),
          //focused error border style
          focusedErrorBorder: getInputBorderError(),
          filled: true,

          iconColor: ColorManager.fillcolor.withOpacity(AppSize.appSize0_70),
          fillColor: ColorManager.fillcolor.withOpacity(AppSize.appSize0_10),
        ),
      );
  _getDarkTheme() => ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      /* ----------------- colors values -------------------*/
      primaryColor: ColorManager.primaryColorDark,
      brightness: Brightness.light,
      dividerColor: ColorManager.primaryColorDark,
      focusColor: ColorManager.primaryColorDark,
      hintColor: ColorManager.primaryColorDark,
      splashColor: ColorManager.primaryColorDark,
      /* --------------------- themes style --------------------------------- */
      //AppBar Theme style
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0, foregroundColor: ColorManager.primaryColor),
      //AppBar Theme style
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primaryColor,
          shadowColor: ColorManager.primaryColor,
          elevation: AppSize.appSize4,
          titleTextStyle: getRegularStyle(
              color: ColorManager.primaryColor,
              fontSize: FontManager.fontSize16)),
      //Card Theme style
      cardTheme: const CardTheme(
          color: ColorManager.primaryColor,
          elevation: AppSize.appSize4,
          shadowColor: ColorManager.primaryColor),
      //elevated Button Theme style
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.appSize1_2)),
              textStyle: getRegularStyle(
                color: ColorManager.focusColor,
                fontSize: FontManager.fontSize14,
              ))),
      //Button Theme style
      buttonTheme: const ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.primaryColor,
          splashColor: ColorManager.primaryColor,
          buttonColor: ColorManager.focusColor),
      //text Button Theme style

      //color scheme style
      colorScheme: const ColorScheme.light(
        primary: ColorManager.primaryColor,
        secondary: ColorManager.primaryColor,
      ),
      //theme input

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: TextStyle(
            fontFamily: "AirbnbCereal",
            fontWeight: FontWeight.w500,
            fontSize: 11,
            color: ColorManager.primaryColor,
          ),
          unselectedLabelStyle: TextStyle(
              fontFamily: "AirbnbCereal",
              fontWeight: FontWeight.w500,
              fontSize: 11,
              color: Colors.white),
          elevation: AppSize.appSize0_10,
          backgroundColor: ColorManager.secondColor),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
            fontSize: FontManager.fontSize20,
            fontWeight: FontManager.bold,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
        headlineSmall: TextStyle(
            fontSize: FontManager.fontSize22,
            fontWeight: FontManager.bold,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
        headlineLarge: TextStyle(
            fontSize: FontManager.fontSize16,
            fontWeight: FontManager.light,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
        titleSmall: TextStyle(
            fontSize: FontManager.fontSize16,
            fontWeight: FontManager.bold,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
        titleMedium: TextStyle(
            fontSize: FontManager.fontSize14,
            fontWeight: FontManager.simaBold,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
        bodyMedium: TextStyle(
            fontSize: FontManager.fontSize14,
            fontWeight: FontManager.bold,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
        bodySmall: TextStyle(
            fontSize: FontManager.fontSize12,
            fontWeight: FontManager.bold,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
        bodyLarge: TextStyle(
            fontSize: FontManager.fontSize12,
            fontWeight: FontManager.bold,
            color: ColorManager.primaryColor,
            height: AppSize.appSize1_2),
      ),
      //theme input
      inputDecorationTheme: InputDecorationTheme(
        //content padding value
        contentPadding: const EdgeInsets.all(AppSize.appSize8),
        //hint style
        hintStyle: getRegularStyle(
            color: ColorManager.primaryColor, fontSize: FontManager.fontSize14),
        //label style
        labelStyle: getMediumStyle(
            color: ColorManager.primaryColor, fontSize: FontManager.fontSize14),
        //error style
        errorStyle: getMediumStyle(
            color: ColorManager.primaryColor, fontSize: FontManager.fontSize14),
        //enabled Border error border style
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.appSize8)),
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.appSize1_4)),
        //focused  border style
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.appSize8)),
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.appSize1_4)),
        //error border style
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.appSize8)),
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.appSize1_4)),
        //focused error border style
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.appSize8)),
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.appSize1_4)),
      ));
}
