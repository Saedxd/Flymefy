import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/logger/logger.dart';

import '../../../core/entity/notification.dart';
import '../../../core/error/failure.dart';
import '../data/request/request.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final ReadingNotificationUseCase _readingNotificationUseCase;
  NotificationCubit(
      {required GetNotificationsUseCase getNotificationsUseCase,
      required ReadingNotificationUseCase readingNotificationUseCase})
      : _getNotificationsUseCase = getNotificationsUseCase,
        _readingNotificationUseCase = readingNotificationUseCase,
        super(NotificationState());

  void increaseNotification() => emit(state.copyWith(
        countNotification: state.countNotification + 1,
        flowStateApp: FlowStateApp.normal,
      ));

  void clearCountNotification() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.success, countNotification: 0));
  }

  Future<void> getNotifications(
      {bool isRefresh = false, required BuildContext context}) async {
    // Check if it's the first page or a refresh
    String role = context.read<AuthenticationCubit>().state.user.isTenant
        ? "tenant"
        : "rented";
    if (state.notificationData.pagination.isFirstPage || isRefresh) {
      emit(state.copyWith(
        flowStateApp: FlowStateApp.loading,
        failure: const Failure.empty(),
      ));

      // Request notifications for the first page
      final result =
          await _getNotificationsUseCase(state.paginationRequest.copyWith(
        page: 1,
        pageLimit: 10,
        type: role,
      ));

      await delayForCreateNewStatus();

      result.fold(
        (failure) => emit(state.copyWith(
          flowStateApp: FlowStateApp.error,
          failure: failure,
        )),
        (data) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.normal,
            notificationData: data,
            pagiantionRequest: state.paginationRequest.copyWith(
              page: 1,
              pageLimit: data.pagination.perPage,
              type: role,
            ),
          ));
        },
      );
    }
    // Check if there's a next page to load
    else if (state.notificationData.pagination.hasNext) {
      emit(state.copyWith(
        flowStateApp: FlowStateApp.loadingMore,
        failure: const Failure.empty(),
      ));

      // Request notifications for the next page
      final result =
          await _getNotificationsUseCase(state.paginationRequest.copyWith(
        page: state.notificationData.pagination.from + 1,
        pageLimit: 10,
        type: role,
      ));

      await delayForCreateNewStatus();

      result.fold(
        (failure) => emit(state.copyWith(
          flowStateApp: FlowStateApp.errorLoadingMore,
          failure: failure,
        )),
        (data) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.normal,
            pagiantionRequest: state.paginationRequest.copyWith(
              page: state.paginationRequest.page! + 1,
            ),
            notificationData: state.notificationData.copyWith(
              pagination: data.pagination,
              data: [...state.notificationData.data, ...data.data],
            ),
          ));
        },
      );
    } else {
      return;
    }
  }

  void showNotification(RemoteMessage message) {
    Logger.log("onMessage: $message");
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    increaseNotification();

    final notification = NotificationItem(
      id: Random().nextInt(1000),
      notificationTitle:
          message.data['type'] ?? message.notification!.title ?? '',
      notificationText:
          message.data['subtitle'] ?? message.notification!.body ?? '',
      date: DateTime.now().toString(),
    );
    emit(state.copyWith(
        flowStateApp: FlowStateApp.newNotification,
        currentNotification: notification));
  }
}
