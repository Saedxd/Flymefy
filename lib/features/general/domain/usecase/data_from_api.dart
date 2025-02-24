import 'package:dartz/dartz.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/helper/base_usecase.dart';
import 'package:flymefy/features/general/domain/entity/faqs.dart';
import 'package:flymefy/features/general/domain/repository/app_repository.dart';

// class GetFaqUseCase implements BaseUseCase<PaginationRequest, FaqsResponse> {
//   final AppRepository _repository;

//   GetFaqUseCase({required AppRepository repository}) : _repository = repository;

//   @override
//   Future<Either<Failure, FaqsResponse>> call(PaginationRequest input) async {
//     return await _repository.getFaq(input);
//   }
// }
