// get lang usecase
import 'package:dartz/dartz.dart';
import 'package:flymefy/core/helper/base_usecase.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/general/domain/entity/privacy_terms.dart';
import 'package:flymefy/features/general/domain/entity/support_chat.dart';
import 'package:flymefy/features/general/domain/repository/app_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/domain/entity/forget_password.dart';
import '../../data/request/request.dart';

class GetLangUseCase implements BaseUseCase<NoParam, String> {
  final AppRepository _repository;

  GetLangUseCase({required AppRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, String>> call(NoParam noParam) async {
    return await _repository.getLang();
  }
}

// cashed lang
class CashLangUseCase implements BaseUseCase<String, SuccessOperation> {
  final AppRepository _repository;

  CashLangUseCase({required AppRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, SuccessOperation>> call(String value) async {
    return await _repository.cashLang(value);
  }
}


