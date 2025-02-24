part of 'otp_cubit.dart';

class OTPState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final String countery;
  final String phone;
  final int ticks;
  final String codeOfUser;
  final String route;
  final String successMessage;
  final String subTitleSuccessMessage;
  final String buttonText;
  final bool isLoading;

  const OTPState({
    this.failure = const Failure.empty(),
    this.flowStateApp = FlowStateApp.draft,
    this.countery = '966',
    this.phone = '',
    this.ticks = 360,
    this.codeOfUser = '',
    this.route = '',
    this.successMessage = AppStrings.success,
    this.subTitleSuccessMessage = '',
    this.buttonText = AppStrings.tohome,
    this.isLoading = false,
  });

  OTPState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    String? countery,
    String? phone,
    int? ticks,
    String? codeOfUser,
    String? route,
    String? successMessage,
    String? subTitleSuccessMessage,
    String? buttonText,
    bool? isLoading,
  }) {
    return OTPState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      countery: countery ?? this.countery,
      phone: phone ?? this.phone,
      ticks: ticks ?? this.ticks,
      codeOfUser: codeOfUser ?? this.codeOfUser,
      route: route ?? this.route,
      successMessage: successMessage ?? this.successMessage,
      subTitleSuccessMessage:
          subTitleSuccessMessage ?? this.subTitleSuccessMessage,
      buttonText: buttonText ?? this.buttonText,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        countery,
        phone,
        ticks,
        codeOfUser,
        route,
        successMessage,
        subTitleSuccessMessage,
        buttonText,
        isLoading,
      ];
}
