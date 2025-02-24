import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flymefy/features/auth/domain/entity/user.dart';

import '../../../core/enum/enums.dart';
import '../../../core/resources_manager/constant.dart';

final class TokenData extends Equatable {
  final String token;
  final int expiresIn;

  const TokenData(
    this.token,
    this.expiresIn,
  );

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
      json['token'] != null
          ? json['token'] as String
          : AppConstants.defaultEmptyString,
      json['expiresIn'] != null
          ? json['expiresIn'] as int
          : AppConstants.defaultEmptyInteger,
    );
  }

  @override
  List<Object?> get props => [token, expiresIn];
}

final class AppAuthenticationLevelData extends Equatable {
  final AppAuthenticationLevel authenticationLevel;
  final UserAppInfo userAppInfo;
  const AppAuthenticationLevelData(this.authenticationLevel, this.userAppInfo);

  @override
  List<Object?> get props => [authenticationLevel];
}

final class LocalAppData extends Equatable {
  final Locale value;
  const LocalAppData(this.value);

  @override
  List<Object?> get props => [value];
}

final class ThemeModeData extends Equatable {
  final ThemeMode value;
  const ThemeModeData(this.value);

  @override
  List<Object?> get props => [value];
}
