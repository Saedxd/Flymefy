import 'package:dartz/dartz.dart';
import 'package:flymefy/features/auth/domain/entity/register.dart';
import 'package:flymefy/features/auth/domain/repository/auth_repository.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/helper/base_usecase.dart';
import '../../data/requests/request.dart';

final class RegiterUseCase
    implements BaseUseCase<RegisterRequest, RegisterData> {
  final AuthRepository _repository;

  RegiterUseCase({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, RegisterData>> call(RegisterRequest input) async {
    return await _repository.register(input);
  }
}
