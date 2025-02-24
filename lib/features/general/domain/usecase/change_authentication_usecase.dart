import 'package:dartz/dartz.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/helper/base_usecase.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/general/data/request/request.dart';
import 'package:flymefy/features/general/domain/repository/app_repository.dart';

import '../../../auth/domain/entity/forget_password.dart';
import '../../../auth/domain/entity/user.dart';

final class ChangeAuthenticationUseCase
    implements
        BaseUseCase<AppAuthenticationLevelUseCaseInput, SuccessOperation> {
  final AppRepository _repository;

  ChangeAuthenticationUseCase({required AppRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(
      AppAuthenticationLevelUseCaseInput input) {
    return _repository.cashLevelAuthenticationApp(
        AppAuthenticationLevelRequest(input.appAuthenticationLevel));
  }
}

final class AppAuthenticationLevelUseCaseInput {
  AppAuthenticationLevel appAuthenticationLevel;
  AppAuthenticationLevelUseCaseInput(
    this.appAuthenticationLevel,
  );
}

//get user
final class GetUserUseCase implements BaseUseCase<NoParam, UserAppInfo> {
  final AppRepository _repository;

  GetUserUseCase({required AppRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, UserAppInfo>> call(NoParam noParams) {
    return _repository.getUser();
  }
}

//logout
final class LogoutUseCase implements BaseUseCase<NoParam, GeneralSuccessData> {
  final AppRepository _repository;

  LogoutUseCase({required AppRepository repository}) : _repository = repository;

  @override
  Future<Either<Failure, GeneralSuccessData>> call(NoParam noParams) {
    return _repository.logout();
  }
}

final class StoreCountryIsoCode
    implements BaseUseCase<UserAppInfo, SuccessOperation> {
  final AppRepository _repository;

  StoreCountryIsoCode({required AppRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(UserAppInfo input) async {
    return await _repository.storeCountryIsoCode(input);
  }
}
