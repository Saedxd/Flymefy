import 'package:dartz/dartz.dart';
import 'package:flymefy/core/entity/data_value.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/helper/base_usecase.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/general/domain/repository/app_repository.dart';

final class GetAuthenticationUseCase
    implements BaseUseCase<NoParam, AppAuthenticationLevelData> {
  final AppRepository _repository;

  GetAuthenticationUseCase({required AppRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, AppAuthenticationLevelData>> call(NoParam noParams) {
    return _repository.getLevelAuthenticationApp();
  }
}
