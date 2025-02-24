import 'package:dartz/dartz.dart';

import '../../../../core/entity/notification.dart';
import '../../../../core/error/failure.dart';
import '../../../auth/domain/entity/forget_password.dart';
import '../../data/request/request.dart';

abstract interface class NotificationRepository {
  Future<Either<Failure, NotificationResponse>> getNotifications(
      GetNotificationsRequest paginationRequest);

  Future<Either<Failure, GeneralSuccessData>> readingNotification(
      RequestWithId input);
}
