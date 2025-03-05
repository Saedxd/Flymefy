import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flymefy/core/error/failure.dart';

import '../app_export.dart';
import 'api_codes.dart';
import 'api_messages.dart';

final class AppConstants {
  static final AppConstants _instance = AppConstants._internal();

  factory AppConstants() {
    return _instance;
  }

  AppConstants._internal();

  static const String helpCenterPhoneNumber = '11111111111';

  static const String assetTranslationsJson = 'assets/translations/';
  static const String envFileName = '.env';
  static const String version = 'V 1.0.0';
  static const String privacyUrl = 'https://www.google.com';
  static const String googleMapKey = 'AIzaSyBZJ8pKfjFq0yRhCAgVlxJ0JQqfjaKEjP8';
  //code verification
  static const int verificationCodeLength = 4;

  //appLangPrefsKey

  static const String appLangPrefsKey =
      '${AppStrings.appName}APP_LANG_PREFS_KEY';

  //appAppAuthenticationLevelPrefsKey
  static const String appAppAuthenticationLevelPrefsKey =
      '${AppStrings.appName}APP_AUTHENTICATION_LEVEL_PREFS_KEY';

  //token
  static const String appTokenPrefsKey =
      '${AppStrings.appName}APP_TOKEN_PREFS_KEY';
  //
  //appBaseUrlPrefsKey
  static const String appBaseUrlPrefsKey =
      '${AppStrings.appName}APP_BASE_URL_PREFS_KEY';

  //loading widget parameter
  static const double strokeWidth = 4;
  static const Color backgroundCircularLoading = ColorManager.primaryColor;
  static const Color valueCircularLoading = ColorManager.whiteColor;

  //failure
  static const Failure unknownfailure = Failure(
      code: ResponseCode.unknownError, message: ResponseMessage.unknownError);
  // default value of primitive
  static const String defaultEmptyString = '';
  static const int defaultEmptyInteger = 0;
  static const double defaultEmptyDouble = 0;
  static const double defaultEmptyDoubleWithTwoDigit = 0;
  static const bool defaultEmptyBoolFalse = false;
  static const bool defaultEmptyBoolTrue = true;
  static const List<String> defaultEmptyListString = [];
  static const List defaultEmptyGenericList = [];
  static const Map defaultEmptyMap = {};

  //onBoarding screen
  static const int timeDelayOnBoardingScreen = 4;
  static const Duration timerDurationTick = Duration(seconds: 1);
  static const int timerDuration = 300;

//default core Setting theme ...
  static const String defaultThemeModeApp = 'light';
  static const String lightTheme = 'light';
  static const String darkTheme = 'dark';
  static const String systemTheme = 'system';
  static const ThemeMode defaultTheme = ThemeMode.light;
  static const ThemeMode theme = ThemeMode.light;

  //default core Setting language
  static const String defaultLanguageAppCode = 'en';
  static const String arabicLanguageCode = 'ar';
  static const String englishLanguageCode = 'en';

  static const Locale englishLocal = Locale('en', '');

  static const Locale arabicLocal = Locale('ar', '');
  static const Locale defaultLocal = Locale('en', '');
  static const Iterable<Locale> supportedLocales = [
    englishLocal,
    arabicLocal,
  ];

//default core Setting version
  static const String appVersion = '1.0.0';
  static const String iosVersion = '1.0.0';
  static const bool forceUpdateVersion = true;
  static const String enableVersion = '1';
  static const String appName = AppStrings.appName;

//scheme url launcher
  static const String androidAppUrlLauncher = 'market://details?id=';
  static const String iosAppUrlLauncher = 'https://apps.apple.com/us/app/';
  static const String telSchemeUrlLauncher = 'tel://';
  static const String mailSchemeUrlLauncher = 'mailto:';
  static const String linkSchemeUrlLauncher = 'https';

  static const String websiteLink = 'https://rest-fort.org/';

// link google map
  static const String googleMapUrl1 =
      'https://www.google.com/maps/search/?api=1&query=';
  static const String appleMapUrl = 'https://maps.apple.com/?sll=';

// image size camera and gallery picker
  static const double maxWidthImgPickerCamera = 1800;
  static const double maxWidthImgPickerGallery = 1800;
  static const int qualityImgPickerGallery =
      60; //quality in Percentage 0....100 %
  static const double maxHeightImgPickerCamera = 1800;
  static const double maxHeightImgPickerGallery = 1800;
  static const int qualityImgPickerCamera = 60;

// local Notification
  static const String appLocalNotificationAndroidIcon = '@mipmap/ic_launcher';
  static const String appLocalNotificationAndroidSoundName = 'sound';
  static const String appLocalNotificationIosSoundName = 'sound.aiff';
  static const String appLocalNotificationAndroidTicker = 'ticker';
  static const String appLocalNotificationAndroidChannelId =
      'high_importance_channel';
  static const String appLocalNotificationAndroidChannelName = 'channel_name';
  static const String appLocalNotificationAndroidChannelDescription =
      'description';
  static const bool appLocalNotificationIosRequestAlertPermission = true;
  static const bool appLocalNotificationIosRequestBadgePermission = true;
  static const bool appLocalNotificationIosRequestSoundPermission = true;
  static const bool appLocalNotificationIosRequestVibrationPermission = true;

//location Setting
  //android Setting location
  static const String notificationTextForegroundAndroidLocation =
      AppStrings.notificationTextForegroundAndroidLocation;
  static const String notificationTitleForegroundAndroidLocation =
      AppStrings.notificationTitleForegroundAndroidLocation;
  static const bool enableWakeLockForegroundAndroidLocation = false;
  static const bool enableWifiLockForegroundAndroidLocation = false;
  static const String notificationIconForegroundAndroidLocation =
      '@drawable/imgLocationAndroidNotification';
  static const bool enableForceLocationManagerAndroid = true;
  static const Duration intervalDurationLocationAndroid = Duration(seconds: 1);
  static const Duration timeLimitLocationAndroid = Duration(seconds: 1);
  static const int distanceFilterLocationAndroid = 100;

// local Notification

  //asset path json images sound

  static const String assetImagesPath = 'assets/img';
  static const String assetJsonPath = 'assets/json';

  static const String assetTranslationPath = 'assets/translations';

  //network data

  // ---------------------auth api extension urls---------------------

  static const String apiLogin = '/user/login';
  static const String apiRegister = '/user/register';
  static const String apiForgetPassword = '/user/forgotPassword';
  static const String apiVerifyCode = '/user/verifyOtp';
  static const String apiResetPassword = '/user/resetForgotPassword';
  static const String apiResendCode = '/user/resendOtpCode';
  static const String apiChangePassword = '';
  static const String apiUpdateProfile = '/user/updateMyProfile';
  static const String apiGetProfile = '';
  static const String apiRefreshToken = '';
  static const String apiGetWhereTo = '/frontend/whereTo';
  static const String apiGetUnitDetails = '/frontend/getUnitDetails';
  static const String apiBookingRequest = '/user/bookingRequest';
  //apiBookingCheckOutRequest
  static const String apiBookingCheckOutRequest = '/user/bookingRequestDone';
  //{{url}}/user/addPromoCode
  static const String apiAddPromoCode = '/user/addPromoCode';
  static const String apiEditPromoCode = '/user/updatePromoCode';
  //{{url}}/user/getMyPromoCode
  static const String apiGetMyPromoCode = '/user/getMyPromoCode';
  //{{url}}/user/usePromoCodeWhenBooking
  static const String apiUsePromoCodeWhenBooking =
      '/user/usePromoCodeWhenBooking';
  //apiFirePromoCode
  static const String apiFirePromoCode = '/user/usePromoCodeWhenBooking';
  static const List<String> apiWithoutToken = [
    apiLogin,
    apiRegister,
    apiForgetPassword,
    apiResetPassword,
    apiVerifyCode,
    apiResendCode
  ];

  // ---------------------home api extension urls---------------------

  static const String apiGetHomeData = '';
  static const String addDeleteFavCar = '';

  static const String apiGetFavoriteCars = '';

  static const String apiSearchCar = '';

  static const String uploadSingleImg = '';
  static const String uploadMultiImg = '';

  static const String apiGetFAQList = '';

  static const String apiGetUser = '/user/getMyProfile';
  static const String apiUpdateName = '';
  static const String apiUpdateEmail = '';
  static const String apiUpdatePhone = '/user/changePhoneNumber';
  static const String apiUpdatePassword = '/user/changeMyPassword';
  static const String apiUpdateImage = '';
  static const String apiVerifyPhoneNumber = '';

  static const String apiCreateComplaint = '';
  static const String apiGetComplaintReplies = '';
  static const String apiGetComplaints = '';
  static const String apiLogout = '/user/logout';

  static const String createChat = '';

  static const String apiGetFlightsFromSearch = '/shopping';
  static const String apiGetCitysAirportsApi = '/search/airports';
}

class LocationSettingConstant {
  static final LocationSettingConstant _instance =
      LocationSettingConstant._internal();

  factory LocationSettingConstant() {
    return _instance;
  }

  LocationSettingConstant._internal();

  //android Setting location
  static const String notificationTextForegroundAndroidLocation =
      AppStrings.notificationTextForegroundAndroidLocation;
  static const String notificationTitleForegroundAndroidLocation =
      AppStrings.notificationTitleForegroundAndroidLocation;
  static const bool enableWakeLockForegroundAndroidLocation = false;
  static const bool enableWifiLockForegroundAndroidLocation = false;
  static const String notificationIconForegroundAndroidLocation =
      "@drawable/splash";
  static const bool enableForceLocationManagerAndroid = true;
  static const Duration intervalDurationLocationAndroid = Duration.zero;
  static const Duration timeLimitLocationAndroid = Duration.zero;
  static const int distanceFilterLocationAndroid = 1;
  static const LocationAccuracy locationAccuracyAndroid = LocationAccuracy.best;

  //apple Setting Location
  static const Duration timeLimitLocationIos = Duration.zero;
  static const int distanceFilterLocationIos = 1;
  static const LocationAccuracy locationAccuracyIos = LocationAccuracy.best;
  static const ActivityType activityTypeLocationIos = ActivityType.other;
  static const bool pauseLocationUpdatesAutomaticallyIos = false;
  static const bool showBackgroundLocationIndicatorIos = false;

  //other PlatForm
  static const Duration timeLimitLocationOtherPlatForm = Duration.zero;
  static const LocationAccuracy locationAccuracyOtherPlatForm =
      LocationAccuracy.best;
  static const int distanceFilterLocationOtherPlatForm = 1;
  static const String markerRiderEndPoint = "MARKER_RIDER_ID_END_POINT";
  static const String markerRiderStartPoint = "MARKER_RIDER_ID_START_POINT";
  static const String markerDriverPoint = "MARKER_Driver_POINT";
  static const String googleMapKey = "";
}

List<String> specialPffersArabicList = [
  Assets.assetsImgSpecialAr5,
  Assets.assetsImgSpecialAr10,
  Assets.assetsImgSpacialAr15,
];

List<String> specialPffersEnglishList = [
  Assets.assetsImgSpecialEn5,
  Assets.assetsImgSpecialEn10,
  Assets.assetsImgSpecialEn15,
];
