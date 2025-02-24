import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flymefy/core/di/locator.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/features/auth/data/requests/request.dart';
import 'package:flymefy/features/auth/domain/usecase/forget_password_use_case.dart';
import 'package:flymefy/features/general/presernatation/logic/authentication/authentication_cubit.dart';

import '../../../../../core/resources_manager/strings.dart';

part 'otp_state.dart';

class OTPCubit extends Cubit<OTPState> {
  final ResendOPTUseCase _resendOPTUseCase;
  final ValidateOPTUseCase _validateOPTUseCase;
  final Ticker _ticker = const Ticker();
  late StreamSubscription<int>? _tickerSubscription;
  static const int _duration = 60 * 5;

  OTPCubit({
    required ResendOPTUseCase resendOPTUseCase,
    required ValidateOPTUseCase validateOPTUseCase,
  })  : _validateOPTUseCase = validateOPTUseCase,
        _resendOPTUseCase = resendOPTUseCase,
        super(const OTPState()) {
    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((duration) => changeTimerValue(duration));
  }

  void changeUser(String countery, String phone, String route,
      String successMessage, String subTitleSuccessMessage, String buttonText) {
    emit(state.copyWith(
        countery: countery,
        phone: phone,
        route: route,
        successMessage: successMessage,
        subTitleSuccessMessage: subTitleSuccessMessage,
        buttonText: buttonText));
  }

  void changeCode(String value) {
    emit(state.copyWith(flowStateApp: FlowStateApp.normal, codeOfUser: value));
  }

  void timerStarted() {
    emit(state.copyWith(flowStateApp: FlowStateApp.normal, ticks: _duration));
    if (_tickerSubscription != null) {
      _tickerSubscription?.cancel();
    }

    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((duration) => changeTimerValue(duration));
  }

  void changeTimerValue(int value) {
    if (value > 0) {
      emit(state.copyWith(flowStateApp: FlowStateApp.normal, ticks: value));
    } else {
      emit(state.copyWith(flowStateApp: FlowStateApp.normal, ticks: 0));
      _tickerSubscription?.cancel();
    }
  }

  void timerPaused() {
    if (state.ticks < _duration && state.ticks > 0) {
      if (_tickerSubscription != null) {
        if (!_tickerSubscription!.isPaused) {
          _tickerSubscription?.pause();
        }
      }
    }
  }

  void validateOTP() async {
    if (state.codeOfUser.length == 6) {
      emit(state.copyWith(isLoading: true));
      final result = await _validateOPTUseCase(ValidateOtpRequest(
        otp: state.codeOfUser,
        phone: state.phone,
        countryCode: state.countery,
        token: instance<AuthenticationCubit>().state.user.token,
      ));

      result.fold(
        (failure) => emit(state.copyWith(
            flowStateApp: FlowStateApp.codeNotVaild,
            failure: failure,
            isLoading: false)),
        (success) {
          emit(state.copyWith(
              flowStateApp: FlowStateApp.successVerifyCode, isLoading: false));
        },
      );
    }
  }

  void timerResumed() {
    if (state.ticks < _duration && state.ticks > 0) {
      if (_tickerSubscription != null) {
        if (_tickerSubscription!.isPaused) {
          _tickerSubscription?.resume();
        }
      }
    }
  }

  @override
  Future<void> close() {
    if (_tickerSubscription != null) {
      _tickerSubscription?.cancel();
    }
    return super.close();
  }

  void timerReset() {
    emit(state.copyWith(flowStateApp: FlowStateApp.normal, ticks: _duration));
    _tickerSubscription?.cancel();
  }

  void resendCode() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _resendOPTUseCase(
      ResondOtpRequest(""),
    );

    result.fold(
      (failure) => emit(
          state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
      (success) {
        emit(state.copyWith(
          flowStateApp: FlowStateApp.successSendCode,
        ));

        timerStarted();
      },
    );
  }
}

class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
