part of 'otp__register_cubit.dart';

class OTPRegisterState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;

  final int ticks;
  final String codeOfUser;
  final RegisterData registerData;
  final bool isLoading;

  const OTPRegisterState({
    this.failure = const Failure.empty(),
    this.flowStateApp = FlowStateApp.draft,
    this.ticks = 360,
    this.codeOfUser = '',
    this.registerData = const RegisterData(),
    this.isLoading = false,
  });

  OTPRegisterState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    int? ticks,
    String? codeOfUser,
    RegisterData? registerData,
    bool? isLoading,
  }) {
    return OTPRegisterState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      ticks: ticks ?? this.ticks,
      codeOfUser: codeOfUser ?? this.codeOfUser,
      registerData: registerData ?? this.registerData,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        ticks,
        codeOfUser,
        registerData,
        isLoading,
      ];
}
