import 'package:dartz/dartz.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/auth/domain/entity/register.dart';
import 'package:flymefy/features/auth/domain/entity/user.dart';

import '../../../../../core/entity/data_value.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/service/either.dart';
import '../../data/requests/request.dart';

abstract interface class PaymentRepository {
  // Future<Either<Failure, UserAppInfo>> login(LoginRequest loginRequest);
  // Future<Either<Failure, UserAppInfo>> getUserData();

  // Future<Either<Failure, RegisterData>> register(
  //     RegisterRequest registerRequest);

  // Future<Either<Failure, GeneralSuccessData>> forgetPassword(
  //     ForgetPasswordRequest resetPasswordRequest);

  // Future<Either<Failure, SuccessOperation>> validateForgetPasswordOTP(
  //     ValidateForgetPasswordOtpRequest confirmCodeRequest);
  // //confirm code
  // Future<Either<Failure, SuccessOperation>> validateOTP(
  //     ValidateOtpRequest confirmCodeRequest);
  // Future<Either<Failure, SuccessOperation>> validateOTPRegister(
  //     ValidateOtpRegisterRequest confirmCodeRequest);
  // Future<Either<Failure, SuccessOperation>> forgetPasswordResendOTP(
  //     ForgetPasswordRequest resetPasswordRequest);

  // Future<Either<Failure, SuccessOperation>> resendOTP(
  //     ResondOtpRequest confirmCodeRequest);

  // // Future<Either<Failure, SuccessOperation>> changePassword(
  // //     ChangePasswordRequest resetPasswordCodeRequest);

  // Future<Either<Failure, TokenData>> refreshToken();
  // Future<Either<Failure, SuccessOperation>> validateOTPChangeNumbers(
  //     ValidateOtpChangeNumbersRequest confirmCodeRequest);
}
