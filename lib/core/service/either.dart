import 'package:equatable/equatable.dart';

final class Units {
  const Units._();
}

final class NoParam {
  const NoParam._();
}

final class NoData extends Equatable {
  const NoData._();

  @override
  List<Object?> get props => [];
}

final class SuccessOperation extends Equatable {
  final bool value;
  const SuccessOperation(this.value);

  @override
  List<Object?> get props => [value];
}

const noParam = NoParam._();
const units = Units._();
const noData = NoData._();
