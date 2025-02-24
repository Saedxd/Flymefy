import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flymefy/core/entity/data_value.dart';
import 'package:flymefy/core/error/error_handler.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/error/permission.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/mapper/auth_mapper.dart';
import 'package:flymefy/core/mapper/general_mapper.dart';
import 'package:flymefy/core/network/api.dart';
import 'package:flymefy/core/resources_manager/constant.dart';
import 'package:flymefy/core/service/app_preferance.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/core/service/network_info.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/general/data/request/request.dart';
import 'package:flymefy/features/general/domain/entity/faqs.dart';
import 'package:flymefy/features/general/domain/entity/location.dart';
import 'package:flymefy/features/general/domain/entity/support_chat.dart';
import 'package:flymefy/features/general/domain/repository/app_repository.dart';

import '../../../auth/domain/entity/user.dart';
import '../../domain/entity/privacy_terms.dart';

class AppRepositoryImpl implements AppRepository {
  final NetworkInfo _networkInfo;
  final ClientApi _clientApi;
  final AppPreferences _appPreferences;

  AppRepositoryImpl(
      {required NetworkInfo networkInfo,
      required ClientApi clientApi,
      required AppPreferences appPreferences})
      : _networkInfo = networkInfo,
        _clientApi = clientApi,
        _appPreferences = appPreferences;

  @override
  Future<Either<Failure, SuccessOperation>> cashLang(String value) async {
    try {
      return Right(await _appPreferences.cashLang(value));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, String>> getLang() async {
    try {
      return Right(await _appPreferences.getLang());
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, AppAuthenticationLevelData>>
      getLevelAuthenticationApp() async {
    try {
      return Right(await _appPreferences.getAppAuthenticationLevel());
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> cashLevelAuthenticationApp(
      AppAuthenticationLevelRequest appAuthenticationLevelRequest) async {
    try {
      return Right(await _appPreferences.cashAppAuthenticationLevel(
          appAuthenticationLevelRequest.appAuthenticationLevel));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error).failure);
    }
  }

  @override
  Future<Either<Failure, LocationSearchData>> getAutoCompletePlaces(
      LocationSearchRequest locationSearchRequest) async {
    throw UnimplementedError();
  }

  // getfaqs

  @override
  Future<Either<Failure, LocationSearchData>> getNearByPlaces(
      LocationNearByRequest locationNearByRequest) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, LocationSearch>> getLocationNameByLatLng(
      LatLng input) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserAppInfo>> getUser() async {
    Response? response;
    try {
      response = await _clientApi.getApi(AppConstants.apiGetUser);
      await _appPreferences.cashToken(response.toUserApp());
      if (response.isOperationSucceededApi()) {
        return Right(response.toUserApp());
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      log(error.toString());
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, GeneralSuccessData>> logout() async {
    Response? response;
    try {
      response = await _clientApi.postApi(AppConstants.apiLogout);

      if (response.isOperationSucceededApi()) {
        log('logout');
        await _appPreferences.logout();
        return const Right(GeneralSuccessData());
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      log(error.toString());
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }


  @override
  Future<Either<Failure, SuccessOperation>> storeCountryIsoCode(
      UserAppInfo user) async {
    Response? response;

    try {
      await _appPreferences.cashToken(user);

      return const Right(SuccessOperation(true));
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }



}
