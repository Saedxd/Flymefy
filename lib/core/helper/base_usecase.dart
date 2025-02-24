import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract interface class BaseUseCase<Input, Output> {
  Future<Either<Failure, Output>> call(Input input);
}
