import 'package:equatable/equatable.dart';


final class CashedItem extends Equatable {
  final dynamic data;
  final int cashTime = DateTime.now().microsecondsSinceEpoch;
  CashedItem(this.data);

  @override
  List<Object?> get props => [data];
}
