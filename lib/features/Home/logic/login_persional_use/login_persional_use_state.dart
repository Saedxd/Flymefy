// part of 'login_persional_use_cubit.dart';

// class LoginPersionalUseState extends Equatable {
//   final FlowStateApp flowStateApp;
//   final Failure failure;
//   final UserAppInfo userData;
//   final LoginForm form;
//   final String phoneInputErrorMessage;
//   final bool hidePassword;
//   final String passwordInputErrorMessage;

//   const LoginPersionalUseState({
//     this.flowStateApp = FlowStateApp.draft,
//     this.form = const LoginForm(),
//     this.failure = const Failure.empty(),
//     this.userData = const UserAppInfo(),
//     this.hidePassword = AppConstants.defaultEmptyBoolTrue,
//     this.phoneInputErrorMessage = AppConstants.defaultEmptyString,
//     this.passwordInputErrorMessage = AppConstants.defaultEmptyString,
//   });

//   LoginPersionalUseState copyWith(
//       {FlowStateApp? flowStateApp,
//       Failure? failure,
//       UserAppInfo? userData,
//       LoginForm? form,
//       bool? hidePassword,
//       String? phoneInputErrorMessage,
//       String? passwordInputErrorMessage}) {
//     return LoginPersionalUseState(
//         flowStateApp: flowStateApp ?? this.flowStateApp,
//         failure: failure ?? this.failure,
//         userData: userData ?? this.userData,
//         form: form ?? this.form,
//         hidePassword: hidePassword ?? this.hidePassword,
//         phoneInputErrorMessage:
//             phoneInputErrorMessage ?? this.phoneInputErrorMessage,
//         passwordInputErrorMessage:
//             passwordInputErrorMessage ?? this.passwordInputErrorMessage);
//   }

//   @override
//   List<Object> get props => [
//         flowStateApp,
//         failure,
//         form,
//         userData,
//         hidePassword,
//         phoneInputErrorMessage,
//         passwordInputErrorMessage
//       ];
// }

// class LoginForm extends Equatable with FormzMixin {
//   final String phone;
//   final String countryCode;
//   final String countryISOCode;
//   final PasswordInput password;
//   final FormzSubmissionStatus status;
//   final bool isVaildPhone;

//   const LoginForm({
//     this.status = FormzSubmissionStatus.initial,
//     this.phone = '',
//     this.isVaildPhone = true,
//     this.countryCode = '966',
//     this.countryISOCode = 'SA',
//     this.password = const PasswordInput.pure(),
//   });

//   LoginForm copyWith(
//       {FormzSubmissionStatus? status,
//       String? phone,
//       String? country,
//       PasswordInput? password,
//       bool? isVaildPhone,
//       String? countryISOCode}) {
//     return LoginForm(
//       status: status ?? this.status,
//       phone: phone ?? this.phone,
//       countryCode: country ?? this.countryCode,
//       password: password ?? this.password,
//       isVaildPhone: isVaildPhone ?? this.isVaildPhone,
//       countryISOCode: countryISOCode ?? this.countryISOCode,
//     );
//   }

//   @override
//   List<Object> get props =>
//       [status, phone, countryCode, password, isVaildPhone, countryISOCode];

//   @override
//   List<FormzInput> get inputs => [password];
// }
