import 'package:dartz/dartz.dart';
import 'package:flymefy/core/entity/notification.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/notification/data/request/request.dart';

import '../../../../core/helper/base_usecase.dart';
import '../repository/repository.dart';

final class GetNotificationsUseCase
    implements BaseUseCase<GetNotificationsRequest, NotificationResponse> {
  final NotificationRepository _repository;

  GetNotificationsUseCase({required NotificationRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, NotificationResponse>> call(
      GetNotificationsRequest paginationRequest) async {
    return await _repository.getNotifications(paginationRequest);
  }
}

class ReadingNotificationUseCase
    implements BaseUseCase<RequestWithId, GeneralSuccessData> {
  final NotificationRepository _repository;

  ReadingNotificationUseCase({required NotificationRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, GeneralSuccessData>> call(RequestWithId input) async {
    return await _repository.readingNotification(input);
  }
}
