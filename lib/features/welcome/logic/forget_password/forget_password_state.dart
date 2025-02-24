part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final ForgetPasswordData forgetPasswordData;
  final String phone;
  final String password;
  final String confirmPassword;
  final String countryCode;
  final String countryISOCode;
  final String passwordInputErrorMessage;
  final String confirmPasswordInputErrorMessage;
  final bool isVaildPhone;
  final String codeOfUser;
  final int ticks;
  final bool hidePassword;
  final bool hideConfirmPassword;

  final String phoneInputErrorMessage;

  const ForgetPasswordState({
    this.failure = const Failure.empty(),
    this.flowStateApp = FlowStateApp.draft,
    this.forgetPasswordData = const ForgetPasswordData(code: '', phone: ''),
    this.phone = '',
    this.countryCode = '966',
    this.countryISOCode = 'SA',
    this.codeOfUser = '',
    this.password = '',
    this.confirmPassword = '',
    this.ticks = 360,
    this.isVaildPhone = true,
    this.phoneInputErrorMessage = '',
    this.passwordInputErrorMessage = '',
    this.confirmPasswordInputErrorMessage = '',
    this.hidePassword = true,
    this.hideConfirmPassword = true,
  });

  ForgetPasswordState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    ForgetPasswordData? forgetPasswordData,
    String? phone,
    String? countryCode,
    String? countryISOCode,
    bool? isVaildPhone,
    String? codeOfUser,
    String? password,
    String? confirmPassword,
    String? phoneInputErrorMessage,
    String? passwordInputErrorMessage,
    String? confirmPasswordInputErrorMessage,
    int? ticks,
    bool? hidePassword,
    bool? hideConfirmPassword,
  }) {
    return ForgetPasswordState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      forgetPasswordData: forgetPasswordData ?? this.forgetPasswordData,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      countryISOCode: countryISOCode ?? this.countryISOCode,
      isVaildPhone: isVaildPhone ?? this.isVaildPhone,
      codeOfUser: codeOfUser ?? this.codeOfUser,
      ticks: ticks ?? this.ticks,
      phoneInputErrorMessage:
          phoneInputErrorMessage ?? this.phoneInputErrorMessage,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      passwordInputErrorMessage:
          passwordInputErrorMessage ?? this.passwordInputErrorMessage,
      confirmPasswordInputErrorMessage: confirmPasswordInputErrorMessage ??
          this.confirmPasswordInputErrorMessage,
      hidePassword: hidePassword ?? this.hidePassword,
      hideConfirmPassword: hideConfirmPassword ?? this.hideConfirmPassword,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        forgetPasswordData,
        phone,
        countryCode,
        countryISOCode,
        isVaildPhone,
        codeOfUser,
        password,
        confirmPassword,
        passwordInputErrorMessage,
        phoneInputErrorMessage,
        confirmPasswordInputErrorMessage,
        ticks,
        hidePassword,
        hideConfirmPassword
      ];
}
