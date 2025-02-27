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
import '../../../../../core/error/error_handler.dart';
import '../../../../../core/error/permission.dart';
import '../../../../../core/service/app_preferance.dart';
import '../../../../../core/service/network_info.dart';
import '../../domain/entity/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ClientApi _authApi;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
      {required ClientApi authApi,
      required AppPreferences appPreferences,
      required NetworkInfo networkInfo})
      : _authApi = authApi,
        _appPreferences = appPreferences,
        _networkInfo = networkInfo;

  @override
  Future<Either<Failure, GeneralSuccessData>> forgetPassword(
      ForgetPasswordRequest resetPasswordRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(
        AppConstants.apiForgetPassword,
        data: resetPasswordRequest.toJson(),
      );

      if (response.isOperationSucceededApi()) {
        return Right(GeneralSuccessData());
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(
        ExceptionHandling.handleError(
          error,
          data: response != null ? response.data : '',
        ).failure,
      );
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> validateForgetPasswordOTP(
      ValidateForgetPasswordOtpRequest confirmCodeRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(
        AppConstants.apiVerifyCode,
        queryParameters: confirmCodeRequest.toJson(),
      );

      if (response.isOperationSucceededApi()) {
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> forgetPasswordResendOTP(
      ForgetPasswordRequest resetPasswordRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(
        AppConstants.apiResendCode,
        data: resetPasswordRequest.toJson(),
      );

      if (response.isOperationSucceededApi()) {
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  // Future<Either<Failure, SuccessOperation>> changePassword(
  //     ChangePasswordRequest resetPasswordCodeRequest) async {
  //   Response? response;
  //   try {
  //     response = await _authApi.postApi(
  //       AppConstants.apiResetPassword,
  //       data: resetPasswordCodeRequest.toJson(),
  //     );

  //     if (response.isOperationSucceededApi()) {
  //       return Right(SuccessOperation(true));
  //     } else {
  //       return Left(ApiException.handleApiError(response.data).failure);
  //     }
  //   } catch (error) {
  //     return Left(ExceptionHandling.handleError(error,
  //             data: response != null ? response.data : '')
  //         .failure);
  //   }
  // }

  @override
  Future<Either<Failure, UserAppInfo>> getUserData() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserAppInfo>> login(LoginRequest loginRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(
        AppConstants.apiLogin,
        data: loginRequest.toJson(),
      );

      if (response.isOperationSucceededApi()) {
        await _appPreferences.cashToken(response.toUserApp());

        return Right(response.toUserApp());
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, TokenData>> refreshToken() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, RegisterData>> register(
      RegisterRequest registerRequest) async {
    Response? response;
    try {
      response = await _authApi.postApiWithImages(AppConstants.apiRegister,
          images: registerRequest.toImages(), data: registerRequest.toJson());

      if (response.isOperationSucceededApi()) {
        await _appPreferences.cashToken(response.toUserApp());
        return Right(
          response.toRegisterData(),
        );
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      log('error: $error');
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> resendOTP(
      ResondOtpRequest confirmCodeRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(AppConstants.apiResendCode, headers: {
        'Authorization': confirmCodeRequest.token.toBearerTokenStyle,
      });

      if (response.isOperationSucceededApi()) {
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> validateOTP(
      ValidateOtpRequest confirmCodeRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(AppConstants.apiVerifyCode,
          headers: {
            'Authorization': confirmCodeRequest.token.toBearerTokenStyle,
          },
          queryParameters: confirmCodeRequest.toJson());

      if (response.isOperationSucceededApi()) {
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      log('error: $error');
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> validateOTPRegister(
      ValidateOtpRegisterRequest confirmCodeRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(AppConstants.apiVerifyCode,
          headers: {
            'Authorization':
                confirmCodeRequest.registerData.token.toBearerTokenStyle,
          },
          queryParameters: confirmCodeRequest.toJson());

      if (response.isOperationSucceededApi()) {
        await _appPreferences
            .cashToken(confirmCodeRequest.registerData.toUserApp());
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }

  @override
  Future<Either<Failure, SuccessOperation>> validateOTPChangeNumbers(
      ValidateOtpChangeNumbersRequest confirmCodeRequest) async {
    Response? response;
    try {
      response = await _authApi.postApi(AppConstants.apiVerifyCode,
          queryParameters: confirmCodeRequest.toJson());

      if (response.isOperationSucceededApi()) {
        return const Right(SuccessOperation(true));
      } else {
        return Left(ApiException.handleApiError(response.data).failure);
      }
    } catch (error) {
      return Left(ExceptionHandling.handleError(error,
              data: response != null ? response.data : '')
          .failure);
    }
  }
}
