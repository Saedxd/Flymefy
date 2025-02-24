part of 'authentication_cubit.dart';

class AuthenticationState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final UserAppInfo user;

  final AppAuthenticationLevel appAuthenticationLevel;

  const AuthenticationState({
    this.flowStateApp = FlowStateApp.draft,
    this.failure = const Failure.empty(),
    this.user = const UserAppInfo(),
    this.appAuthenticationLevel = AppAuthenticationLevel.initial,
  });
  AuthenticationState copyWith({
    Failure? failure,
    FlowStateApp? flowStateApp,
    AppAuthenticationLevel? appAuthenticationLevel,
    UserAppInfo? user,
  }) =>
      AuthenticationState(
        failure: failure ?? this.failure,
        user: user ?? this.user,
        flowStateApp: flowStateApp ?? this.flowStateApp,
        appAuthenticationLevel:
            appAuthenticationLevel ?? this.appAuthenticationLevel,
      );
  @override
  List<Object?> get props => [
        flowStateApp,
        failure,
        user,
        appAuthenticationLevel,
      ];
}
