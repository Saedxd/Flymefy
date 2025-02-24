// forget_password_use_case.dart
// import 'package:dartz/dartz.dart';

import 'package:dartz/dartz.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/auth/domain/repository/auth_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/helper/base_usecase.dart';

// final class ForgetPasswordUseCase
//     implements BaseUseCase<ForgetPasswordRequest, GeneralSuccessData> {
//   final AuthRepository _repository;

//   ForgetPasswordUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, GeneralSuccessData>> call(
//       ForgetPasswordRequest input) async {
//     return await _repository.forgetPassword(input);
//   }
// }

// final class ForgetPasswordResendOPTUseCase
//     implements BaseUseCase<ForgetPasswordRequest, SuccessOperation> {
//   final AuthRepository _repository;

//   ForgetPasswordResendOPTUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, SuccessOperation>> call(
//       ForgetPasswordRequest input) async {
//     return await _repository.forgetPasswordResendOTP(input);
//   }
// }

// final class ValidateForgetPasswordOPTUseCase
//     implements BaseUseCase<ValidateForgetPasswordOtpRequest, SuccessOperation> {
//   final AuthRepository _repository;

//   ValidateForgetPasswordOPTUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, SuccessOperation>> call(
//       ValidateForgetPasswordOtpRequest input) async {
//     return await _repository.validateForgetPasswordOTP(input);
//   }
// }

// // confirmCodeUseCase
// final class ValidateOPTUseCase
//     implements BaseUseCase<ValidateOtpRequest, SuccessOperation> {
//   final AuthRepository _repository;

//   ValidateOPTUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, SuccessOperation>> call(
//       ValidateOtpRequest input) async {
//     return await _repository.validateOTP(input);
//   }
// }

// final class ValidateRegisterOPTUseCase
//     implements BaseUseCase<ValidateOtpRegisterRequest, SuccessOperation> {
//   final AuthRepository _repository;

//   ValidateRegisterOPTUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, SuccessOperation>> call(
//       ValidateOtpRegisterRequest input) async {
//     return await _repository.validateOTPRegister(input);
//   }
// }

// final class ResendOPTUseCase
//     implements BaseUseCase<ResondOtpRequest, SuccessOperation> {
//   final AuthRepository _repository;

//   ResendOPTUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, SuccessOperation>> call(ResondOtpRequest input) async {
//     return await _repository.resendOTP(input);
//   }
// }

// // changePasswordUseCase
// final class ChangePasswordUseCase
//     implements BaseUseCase<ChangePasswordRequest, SuccessOperation> {
//   final AuthRepository _repository;

//   ChangePasswordUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, SuccessOperation>> call(
//       ChangePasswordRequest input) async {
//     return await _repository.changePassword(input);
//   }
// }

// final class ValidateOTPChangeNumbersUseCase
//     implements BaseUseCase<ValidateOtpChangeNumbersRequest, SuccessOperation> {
//   final AuthRepository _repository;

//   ValidateOTPChangeNumbersUseCase({required AuthRepository repository})
//       : _repository = repository;

//   @override
//   Future<Either<Failure, SuccessOperation>> call(
//       ValidateOtpChangeNumbersRequest input) async {
//     return await _repository.validateOTPChangeNumbers(input);
//   }
// }
