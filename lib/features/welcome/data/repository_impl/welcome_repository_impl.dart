import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flymefy/core/entity/data_value.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/mapper/auth_mapper.dart';
import 'package:flymefy/core/network/api.dart';
import 'package:flymefy/core/resources_manager/constant.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/auth/data/requests/request.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/auth/domain/entity/register.dart';
import 'package:flymefy/features/auth/domain/repository/auth_repository.dart';
import 'package:flymefy/features/welcome/domain/repository/auth_repository.dart';

import '../../../../../core/error/error_handler.dart';
import '../../../../../core/error/permission.dart';
import '../../../../../core/service/app_preferance.dart';
import '../../../../../core/service/network_info.dart';
import '../../domain/entity/user.dart';

class WelcomeRepositoryImpl implements WelcomeRepository {
  final ClientApi _authApi;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;

  WelcomeRepositoryImpl(
      {required ClientApi authApi,
      required AppPreferences appPreferences,
      required NetworkInfo networkInfo})
      : _authApi = authApi,
        _appPreferences = appPreferences,
        _networkInfo = networkInfo;


}
