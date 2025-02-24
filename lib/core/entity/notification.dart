import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/*
    "notification_ID": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "notification_Title": "string",
    "notification_Body": "string",
    "notification_Route": "string",
    "notification_Date": "string",
    "is_Readed": true
*/
class NotificationResponse extends Equatable {
  final int status;
  final bool success;
  final String? message;
  final List<NotificationItem> data;
  final Pagination pagination;

  const NotificationResponse({
    this.status = 0,
    this.success = false,
    this.message = '',
    this.data = const [],
    this.pagination = const Pagination(),
  });

  // CopyWith method
  NotificationResponse copyWith({
    int? status,
    bool? success,
    String? message,
    List<NotificationItem>? data,
    Pagination? pagination,
  }) {
    return NotificationResponse(
      status: status ?? this.status,
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
      pagination: pagination ?? this.pagination,
    );
  }

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      status: json['status'] ?? 0,
      success: json['success'] ?? false,
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => NotificationItem.fromJson(item))
          .toList(),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
      'pagination': pagination.toJson(),
    };
  }

  @override
  List<Object?> get props => [status, success, message, data, pagination];
}


class NotificationItem extends Equatable {
  final int id;
  final String notificationTitle;
  final String notificationText;
  final int modelId;
  final String model;
  final String isRead;
  final int? senderId;
  final String? modelImage;
  final String? modelName;
  final String date;
  final String dateFormat;
  final String notificationType;
  final String? receiver;

  const NotificationItem({
    this.id = 0, // Default value set to 0
    this.notificationTitle = '', // Default value set to empty string
    this.notificationText = '', // Default value set to empty string
    this.modelId = 0, // Default value set to empty string
    this.isRead = '', // Default value set to empty string
    this.senderId = 0, // Optional field, can be null
    this.date = '', // Default value set to empty string
    this.dateFormat = '', // Default value set to empty string
    this.notificationType = '', // Default value set to empty string
    this.model = '', // Default value set to empty string
    this.modelImage, // Optional field, can be null
    this.modelName, // Optional field, can be null
    this.receiver = '',
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'] ?? 0,
      notificationTitle: json['notification_title'] ?? '',
      notificationText: json['notification_text'] ?? '',
      modelId: json['model_id'] ?? 0,
      isRead: json['is_read'] ?? '',
      senderId: json['sender_id'] ?? 0,
      date: json['date'] ?? '',
      dateFormat: json['date_format'] ?? '',
      notificationType: json['notification_type'] ?? '',
      model: json['model'] ?? '',
      modelImage: json['model_image'],
      modelName: json['model_name'],
      receiver: json['receiver'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notification_title': notificationTitle,
      'notification_text': notificationText,
      'model_id': modelId,
      'is_read': isRead,
      'sender_id': senderId,
      'date': date,
      'date_format': dateFormat,
      'notification_type': notificationType,
      'model': model,
      'model_image': modelImage,
      'model_name': modelName,
      'receiver': receiver,
    };
  }

  @override
  List<Object?> get props => [
        id,
        notificationTitle,
        notificationText,
        modelId,
        isRead,
        senderId,
        date,
        dateFormat,
        notificationType,
        model,
        modelImage,
        modelName,
        receiver,
      ];
}

extension NotificationResponseExtension on Response {
  NotificationResponse toNotificationDomain() {
    return NotificationResponse.fromJson(data);
  }
}
class Pagination extends Equatable {
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final int total;
  final int currentPage;

  const Pagination({
    this.firstPageUrl = '',
    this.from = 1,
    this.lastPage = 1,
    this.lastPageUrl = '',
    this.nextPageUrl = '',
    this.path = '',
    this.perPage = 1,
    this.total = 1,
    this.currentPage = 1,
  });

  @override
  List<Object> get props => [
        firstPageUrl,
        from,
        lastPage,
        lastPageUrl,
        nextPageUrl,
        path,
        perPage,
        total,
        currentPage,
      ];

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      firstPageUrl: json['first_page_url'] ?? '',
      from: json['from'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      lastPageUrl: json['last_page_url'] ?? '',
      nextPageUrl: json['next_page_url'] ?? '',
      path: json['path'] ?? '',
      perPage: json['per_page'] ?? 0,
      total: json['total'] ?? 0,
      currentPage: json['current_page'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_page_url': firstPageUrl,
      'from': from,
      'last_page': lastPage,
      'last_page_url': lastPageUrl,
      'next_page_url': nextPageUrl,
      'path': path,
      'per_page': perPage,
      'total': total,
    };
  }

  bool get hasNext => nextPageUrl.isNotEmpty;

  bool get isFirstPage => firstPageUrl.isEmpty;

  //copy with
  Pagination copyWith({
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    int? perPage,
    int? total,
    int? currentPage,
  }) {
    return Pagination(
      firstPageUrl: firstPageUrl ?? this.firstPageUrl,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      lastPageUrl: lastPageUrl ?? this.lastPageUrl,
      nextPageUrl: nextPageUrl ?? this.nextPageUrl,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      total: total ?? this.total,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
