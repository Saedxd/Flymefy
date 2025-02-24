import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flymefy/core/entity/data_value.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/extension/data_source.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/resources_manager/constant.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/auth/domain/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logger/logger.dart';

abstract interface class AppPreferences {
  // lang
  Future<SuccessOperation> cashLang(String value);
  Future<String> getLang();

  Future<SuccessOperation> cashAppAuthenticationLevel(
    AppAuthenticationLevel levelApp,
  );

  Future<AppAuthenticationLevelData> getAppAuthenticationLevel();

  //gettoken
  Future<SuccessOperation> cashToken(UserAppInfo data);
  Future<UserAppInfo> getToken();
  Future<SuccessOperation> logout();

  //save url for api
}

class AppPreferencesImpl implements AppPreferences {
  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _secureStorage;

  AppPreferencesImpl(
      {required SharedPreferences sharedPreferences,
      required FlutterSecureStorage secureStorage})
      : _sharedPreferences = sharedPreferences,
        _secureStorage = secureStorage;
  @override
  Future<SuccessOperation> cashLang(String value) {
    return _sharedPreferences
        .setString(AppConstants.appLangPrefsKey, value)
        .isOperationSucceeded();
  }

  @override
  Future<String> getLang() {
    return Future.value(
        _sharedPreferences.getString(AppConstants.appLangPrefsKey) ??
            AppConstants.defaultLocal.languageCode);
  }

  @override
  Future<SuccessOperation> cashAppAuthenticationLevel(
      AppAuthenticationLevel level) async {
    return await _sharedPreferences
        .setString(AppConstants.appAppAuthenticationLevelPrefsKey, level.name)
        .isOperationSucceeded();
  }

  @override
  Future<AppAuthenticationLevelData> getAppAuthenticationLevel() async {
    final user = await getToken();
    return _sharedPreferences
        .getString(AppConstants.appAppAuthenticationLevelPrefsKey)
        .getAppAuthenticationLevel(user: user);
  }

  @override
  Future<SuccessOperation> cashToken(UserAppInfo value) async {
    try {
      await _secureStorage.write(
          key: AppConstants.appTokenPrefsKey,
          value: json.encode(value.toMap()));

      debugPrint("success saved in secure storage");

      return const SuccessOperation(true);
    } catch (e) {
      Logger.log(e.toString());
      throw DataSourceNetworkError.formatException.getFailure();
    }
  }

  @override
  Future<UserAppInfo> getToken() async {
    try {
      final value =
          await _secureStorage.read(key: AppConstants.appTokenPrefsKey);
      if (value != null) {
        return UserAppInfo.fromMap(json.decode(value));
      } else {
        return const UserAppInfo();
      }
    } catch (e) {
      Logger.log(e.toString());
      return const UserAppInfo();
    }
  }

  @override
  Future<SuccessOperation> logout() async {
    try {
      await cashToken(const UserAppInfo());
      return cashAppAuthenticationLevel(
        AppAuthenticationLevel.unAuthenticated,
      );
    } catch (error) {
      log(error.toString());
      return const SuccessOperation(false);
    }
  }
}
