part of 'regiter_persional_use_cubit.dart';

class RegiterPersionalUseState extends Equatable {
  final FlowStateApp flowStateApp;
  final Failure failure;
  final RegisterForm form;
  final RegisterData registerData;
  final String phoneInputErrorMessage;
  final Country userCountry;

  const RegiterPersionalUseState({
    this.flowStateApp = FlowStateApp.draft,
    this.form = const RegisterForm(),
    this.failure = const Failure.empty(),
    this.registerData = const RegisterData(),
    this.userCountry = const Country(
      name: "Saudi Arabia",
      nameTranslations: {
        "ar": "السعودية",
        "en": "Saudi Arabia",
      },
      flag: "🇸🇦",
      code: "SA",
      dialCode: "966",
      minLength: 9,
      maxLength: 9,
      startWith: ["5"],
    ),
    this.phoneInputErrorMessage = "",
  });

  RegiterPersionalUseState copyWith({
    FlowStateApp? flowStateApp,
    Failure? failure,
    RegisterForm? form,
    RegisterData? registerData,
    Country? userCountry,
    String? phoneInputErrorMessage,
  }) {
    return RegiterPersionalUseState(
      flowStateApp: flowStateApp ?? this.flowStateApp,
      failure: failure ?? this.failure,
      form: form ?? this.form,
      registerData: registerData ?? this.registerData,
      userCountry: userCountry ?? this.userCountry,
      phoneInputErrorMessage:
          phoneInputErrorMessage ?? this.phoneInputErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        flowStateApp,
        failure,
        form,
        registerData,
        userCountry,
        phoneInputErrorMessage
      ];
}

class RegisterForm extends Equatable with FormzMixin {
  final EmailInput email;
  final PasswordInput password;
  final ConfirmPassword confirmPassword;

  final StreetInput firstName;
  final StreetInput lastName;
  final String phone;
  final String countryCode;
  final String countryISOCode;
  final FormzSubmissionStatus status;
  final bool isVaildPhone;
  final bool isAgree;
  final bool hidePassword;
  final bool hideConfirmPassword;
  final bool isPassport;
  final ImageInput frontIdImage;
  final ImageInput backIdImage;
  final ImageInput passportImage;
  //final ImageInput faceShot;

  const RegisterForm({
    this.status = FormzSubmissionStatus.initial,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.firstName = const StreetInput.pure(),
    this.lastName = const StreetInput.pure(),
    this.phone = '',
    this.countryCode = '+966',
    this.isVaildPhone = true,
    this.isAgree = false,
    this.hideConfirmPassword = true,
    this.hidePassword = true,
    this.isPassport = true,
    this.backIdImage = const ImageInput.pure(),
    this.frontIdImage = const ImageInput.pure(),
    this.passportImage = const ImageInput.pure(),
    // this.faceShot = const ImageInput.pure(),
    this.countryISOCode = 'SA',
  });

  RegisterForm copyWith(
      {FormzSubmissionStatus? status,
      EmailInput? email,
      PasswordInput? password,
      ConfirmPassword? confirmPassword,
      StreetInput? firstName,
      StreetInput? lastName,
      String? phone,
      String? countryCode,
      bool? isVaildPhone,
      bool? isAgree,
      bool? hidePassword,
      bool? hideConfirmPassword,
      bool? isPassport,
      ImageInput? backIdImage,
      ImageInput? frontIdImage,
      ImageInput? passportImage,
      //ImageInput? faceShot,
      String? countryISOCode}) {
    return RegisterForm(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        isVaildPhone: isVaildPhone ?? this.isVaildPhone,
        isAgree: isAgree ?? this.isAgree,
        hidePassword: hidePassword ?? this.hidePassword,
        hideConfirmPassword: hideConfirmPassword ?? this.hideConfirmPassword,
        isPassport: isPassport ?? this.isPassport,
        backIdImage: backIdImage ?? this.backIdImage,
        frontIdImage: frontIdImage ?? this.frontIdImage,
        passportImage: passportImage ?? this.passportImage,
        // faceShot: faceShot ?? this.faceShot,
        countryISOCode: countryISOCode ?? this.countryISOCode);
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
        confirmPassword,
        firstName,
        lastName,
        phone,
        countryCode,
        isVaildPhone,
        isAgree,
        hidePassword,
        hideConfirmPassword,
        isPassport,
        frontIdImage,
        backIdImage,
        passportImage,
        //faceShot,
        countryISOCode
      ];

  @override
  List<FormzInput> get inputs => [
        email,
        password,
        confirmPassword,
        firstName,
        lastName,
        frontIdImage,
        backIdImage,
        passportImage,
        //  faceShot,
      ];
}
