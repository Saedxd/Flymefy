import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../logger/logger.dart';
import '../resources_manager/constant.dart';

Future<String> getTokenFirbase() async {
  if (Platform.isIOS) {
    String? apnToken = await FirebaseMessaging.instance.getAPNSToken();
    if (apnToken != null) {
      Logger.log(apnToken);
      return await FirebaseMessaging.instance.getToken() ??
          AppConstants.defaultEmptyString;
    }
  } else if (Platform.isAndroid) {
    String? token = await FirebaseMessaging.instance.getToken();
    debugPrint("token : $token");
    if (token != null) {
      Logger.log(token);
      return token;
    }
  }

  return AppConstants.defaultEmptyString;
}
