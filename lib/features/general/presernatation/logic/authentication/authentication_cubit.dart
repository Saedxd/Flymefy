import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/helper/function.dart';
import 'package:flymefy/core/service/either.dart';
import 'package:flymefy/features/general/domain/usecase/change_authentication_usecase.dart';
import 'package:flymefy/features/general/domain/usecase/get_authentication_usecase.dart';

import '../../../../auth/domain/entity/user.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final GetAuthenticationUseCase _getAuthenticationUseCase;
  final ChangeAuthenticationUseCase _changeAuthenticationUseCase;
  final GetUserUseCase _getUserUseCase;
  final LogoutUseCase _logoutUseCase;
  final StoreCountryIsoCode _storeCountryIsoCode;

  AuthenticationCubit(
      {required GetAuthenticationUseCase getAuthenticationUseCase,
      required ChangeAuthenticationUseCase changeAuthenticationUseCase,
      required StoreCountryIsoCode storeCountryIsoCode,
      required LogoutUseCase logoutUseCase,
      required GetUserUseCase getUserUseCase})
      : _getAuthenticationUseCase = getAuthenticationUseCase,
        _changeAuthenticationUseCase = changeAuthenticationUseCase,
        _storeCountryIsoCode = storeCountryIsoCode,
        _logoutUseCase = logoutUseCase,
        _getUserUseCase = getUserUseCase,
        super(const AuthenticationState());

  void getAuthentication() async {
    emit(state.copyWith(
      flowStateApp: FlowStateApp.loading,
    ));

    delayForCreateNewStatus(second: 2);
    final result = await _getAuthenticationUseCase(noParam);

    result.fold(
      (failure) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      },
      (data) {
        emit(state.copyWith(
            flowStateApp: FlowStateApp.success,
            user: data.userAppInfo,
            appAuthenticationLevel:
                data.authenticationLevel == AppAuthenticationLevel.initial
                    ? AppAuthenticationLevel.unAuthenticated
                    : data.authenticationLevel));
      },
    );
  }

  void changeAuthentication(AppAuthenticationLevel appAuthenticationLevel,
      {UserAppInfo? user}) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _changeAuthenticationUseCase(
        AppAuthenticationLevelUseCaseInput(appAuthenticationLevel));
    result.fold(
      (failure) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      },
      (success) {
        emit(state.copyWith(
            flowStateApp: FlowStateApp.success,
            appAuthenticationLevel: appAuthenticationLevel,
            user: user ?? state.user));
      },
    );
  }

  void changeAccountType() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        user: state.user.copyWith(isTenant: !state.user.isTenant)));
  }

  void logout() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.logoutLoading));
    final result = await _logoutUseCase(noParam);
    await delayForCreateNewStatus();
    result.fold(
        (l) => emit(state.copyWith(
              flowStateApp: FlowStateApp.logoutError,
              failure: l,
            )),
        (r) => emit(state.copyWith(
              flowStateApp: FlowStateApp.logoutSuccess,
              appAuthenticationLevel: AppAuthenticationLevel.unAuthenticated,
              user: const UserAppInfo(),
            )));
  }

  void getUser() async {
    if (state.appAuthenticationLevel == AppAuthenticationLevel.authenticated) {
      emit(state.copyWith(flowStateApp: FlowStateApp.loadingUser));
      final result = await _getUserUseCase(noParam);
      result.fold(
        (failure) {
          emit(state.copyWith(
              flowStateApp: FlowStateApp.errorLoadedUser, failure: failure));
        },
        (data) {
          emit(state.copyWith(
              flowStateApp: FlowStateApp.successLoadedUser,
              user: data.copyWith(isTenant: state.user.isTenant)));
        },
      );
    }
    return;
  }

  void updateUser(UserAppInfo user) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loadingUser));
    await delayForCreateNewStatus();
    emit(state.copyWith(
        flowStateApp: FlowStateApp.successLoadedUser, user: user));
  }

  void setCountryIsoCode(String countryisoCode) async {
    try {
      debugPrint('countryisoCode countryisoCode : $countryisoCode');
      final result = await _storeCountryIsoCode(
          state.user.copyWith(countryIsoCode: countryisoCode));

      result.fold((failure) {
        debugPrint(failure.toString());
      }, (userData) {
        emit(state.copyWith(
            flowStateApp: FlowStateApp.successLoadedUser,
            user: state.user.copyWith(countryIsoCode: countryisoCode)));
        debugPrint('userData.toString()  :${userData.toString()}');
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
