import 'package:dartz/dartz.dart';
import 'package:flymefy/features/auth/domain/entity/user.dart';
import 'package:flymefy/features/auth/domain/repository/auth_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/helper/base_usecase.dart';
import '../../../../../core/service/either.dart';
import '../../data/requests/request.dart';

// final class LoginUseCase implements BaseUseCase<LoginRequest, UserAppInfo> {
//   final AuthRepository _repository;

//   LoginUseCase({required AuthRepository repository}) : _repository = repository;

//   @override
//   Future<Either<Failure, UserAppInfo>> call(LoginRequest input) async {
//     return await _repository.login(input);
//   }
// }

// getUserData
final class GetUserDataUseCase implements BaseUseCase<NoParam, UserAppInfo> {
  final AuthRepository _repository;

  GetUserDataUseCase({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, UserAppInfo>> call(NoParam input) async {
    return await _repository.getUserData();
  }
}
