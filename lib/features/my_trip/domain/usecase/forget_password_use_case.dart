// forget_password_use_case.dart
// import 'package:dartz/dartz.dart';

import 'package:dartz/dartz.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/auth/domain/repository/auth_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/helper/base_usecase.dart';
import '../../data/requests/request.dart';

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
