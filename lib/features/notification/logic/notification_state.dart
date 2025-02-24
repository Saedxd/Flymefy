part of 'notification_cubit.dart';

class NotificationState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final NotificationResponse notificationData;
  final NotificationItem currentNotification;
  final GetNotificationsRequest paginationRequest; // Ensure this field is defined
  final int countNotification;
  final int page;

  NotificationState({
    this.flowStateApp = FlowStateApp.draft,
    this.failure = const Failure.empty(),
    this.countNotification = AppConstants.defaultEmptyInteger,
    this.notificationData = const NotificationResponse(),
    this.page = AppConstants.defaultEmptyInteger,
    GetNotificationsRequest? paginationRequest, // nullable and passed to constructor
    this.currentNotification = const NotificationItem(),
  }) : paginationRequest =
            paginationRequest ?? GetNotificationsRequest(); // default value

  NotificationState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    NotificationResponse? notificationData,
    int? countNotification,
    NotificationItem? currentNotification,
    int? page,
    GetNotificationsRequest? pagiantionRequest,

    
  }) {
    return NotificationState(
      countNotification: countNotification ?? this.countNotification,
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      notificationData: notificationData ?? this.notificationData,
      page: page ?? this.page,
      paginationRequest: pagiantionRequest ?? this.paginationRequest,
      currentNotification: currentNotification ?? this.currentNotification,
    );
  }

  @override
  List<Object?> get props => [
        flowStateApp,
        failure,
        countNotification,
        notificationData,
        page,
        paginationRequest,
        currentNotification
      ];
}
