import 'package:equatable/equatable.dart';

class BaseResponse<T, E> extends Equatable {
  String message;
  bool success;
  int statusCode;
  T data;
  E errors;

  BaseResponse({
    required this.message,
    required this.success,
    required this.statusCode,
    required this.data,
    required this.errors,
  });

  BaseResponse copyWith({
    String? message,
    bool? success,
    int? statusCode,
    dynamic data,
    dynamic errors,
  }) {
    return BaseResponse(
      message: message ?? this.message,
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      data: data ?? this.data,
      errors: errors ?? this.errors,
    );
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      message: json['message'] as String,
      success: json['success'] as bool,
      statusCode: json['statusCode'] as int,
      data: json['data'] as T,
      errors: json['errors'] as E,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'success': success,
      'statusCode': statusCode,
      'data': data,
      'errors': errors,
    };
  }

  @override
  List<Object?> get props => [message, success, statusCode, data];
}
