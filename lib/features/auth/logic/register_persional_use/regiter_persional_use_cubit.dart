import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_mobile_field/mobile_number.dart';
import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/input_validation/input_validation.dart';
import 'package:flymefy/core/service/countery_ext.dart';
import 'package:flymefy/features/auth/data/requests/request.dart';
import 'package:flymefy/features/auth/domain/entity/register.dart';
import 'package:flymefy/features/auth/domain/usecase/register_use_case.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../core/helper/function.dart';
import '../../../../../core/logger/logger.dart';
import '../../../../../core/resources_manager/strings.dart';
import '../../../../../core/service/firebase.dart';
import '../../../../../core/service/picker_photos.dart';
import '../../domain/usecase/login_use_case.dart';

part 'regiter_persional_use_state.dart';

class RegiterPersionalUseCubit extends Cubit<RegiterPersionalUseState> {
  final RegiterUseCase _regiterPersionalUseCase;
  final LoginUseCase _loginUseCase;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final ImagePickering _imagePicker;

  RegiterPersionalUseCubit(
      {required RegiterUseCase regiterPersionalUseCase,
      required LoginUseCase loginUseCase,
      required ImagePickering imagePicker})
      : _regiterPersionalUseCase = regiterPersionalUseCase,
        _loginUseCase = loginUseCase,
        _imagePicker = imagePicker,
        super(const RegiterPersionalUseState());

  void changeEmail(String value) {
    emit(state.copyWith(flowStateApp: FlowStateApp.normal));
    final email = EmailInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        email: email,
      ),
    )); //
  }

  void changePassportImage(bool isCamera) async {
    final result = isCamera
        ? await _imagePicker.pickImageCamera()
        : await _imagePicker.pickImageGallery();
    result.fold((failure) {
      if (failure.code != 2022) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      }
    }, (images) {
      final image = ImageInput.dirty(images);
      emit(state.copyWith(form: state.form.copyWith(passportImage: image)));
    });
  }

  void changeIdFrontPhoto(bool isCamera) async {
    final result = isCamera
        ? await _imagePicker.pickImageCamera()
        : await _imagePicker.pickImageGallery();
    result.fold((failure) {
      if (failure.code != 2022) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      }
    }, (images) {
      final image = ImageInput.dirty(images);
      emit(state.copyWith(form: state.form.copyWith(frontIdImage: image)));
    });
  }

  void changeIdBackPhoto(bool isCamera) async {
    final result = isCamera
        ? await _imagePicker.pickImageCamera()
        : await _imagePicker.pickImageGallery();
    result.fold((failure) {
      if (failure.code != 2022) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      }
    }, (images) {
      final image = ImageInput.dirty(images);
      emit(state.copyWith(form: state.form.copyWith(backIdImage: image)));
    });
  }

  // void changeFaceShot(bool isCamera) async {
  //   final result = isCamera
  //       ? await _imagePicker.pickImageCamera()
  //       : await _imagePicker.pickImageGallery();

  //   log(result.toString());
  //   result.fold((failure) {
  //     if (failure.code != 2022) {
  //       emit(
  //           state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
  //     }
  //   }, (images) {
  //     final image = ImageInput.dirty(images);
  //     emit(state.copyWith(
  //       form: state.form.copyWith(faceShot: image),
  //       flowStateApp: FlowStateApp.normal,
  //     ));
  //   });
  // }

  void changeAgreePrivacyOrDisAgree() {
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        isAgree: !state.form.isAgree,
      ),
    ));
  }

  void changeFristName(String value) {
    final name = StreetInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        firstName: name,
      ),
    ));
  }

  void changeLastName(String value) {
    final name = StreetInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        lastName: name,
      ),
    ));
  }



  // void changePhone(List<String> value) {
  //   if (value[3].toString() != state.userCountry.code)
  //     changeCountry(value[3].toString());

  //   emit(state.copyWith(
  //     failure: const Failure.empty(),
  //     flowStateApp: FlowStateApp.normal,
  //     form: state.form.copyWith(
  //       phone: value.length >= 2 ? value[0] : '',
  //       country: value.length >= 2 ? value[1] : '',
  //       isVaildPhone: isValidPhone(value[0], value[2]),
  //     ),
  //   ));
  // }

  bool isValidPhone(String phone, String error) {
    if (phone.isEmpty || error.isNotEmpty) {
      return true;
    }
    return false;
  }

  void changePassword(String value) {
    final password = PasswordInput.dirty(value);
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        password: password,
      ),
    ));
  }

  void changeConfirmPassword(String value) {
    final confirmPassword =
        ConfirmPassword.dirty([value, state.form.password.value]);
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        confirmPassword: confirmPassword,
      ),
    ));
  }

  void changeHidePassword() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        form: state.form.copyWith(hidePassword: !state.form.hidePassword)));
  }

  void changeIsPassport() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        form: state.form.copyWith(isPassport: !state.form.isPassport)));
  }

  void changeHideConfirmPassword() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        form: state.form.copyWith(
          hideConfirmPassword: !state.form.hideConfirmPassword,
        )));
  }

  Future<void> register() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final firebaseToken = await getTokenFirbase();
    final request = RegisterRequest(
      countryCode: state.form.countryCode.toString().trim(),
      phone: state.form.phone.toString().trim(),
      firstName: state.form.firstName.value.toString().trim(),
      lastName: state.form.lastName.value.toString().trim(),
      password: state.form.password.value.toString().trim(),
      passwordConfirmation: state.form.password.value.toString().trim(),
      email: state.form.email.value.toString().trim(),
      firebaseToken: firebaseToken,
      // profileImage: state.form.faceShot.value!,
      // faceShot: state.form.faceShot.value!,
    );

    final result = await _regiterPersionalUseCase(request);
    result.fold((failure) {
      emit(state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
    }, (registerData) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.successRegister,
          registerData: registerData));
    });
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        emit(state.copyWith(
          flowStateApp: FlowStateApp.normal,
        ));
        return;
      }
      await googleUser.authentication;
      final token = await getTokenFirbase();
      final result = await _loginUseCase(LoginRequest(
        socialMediaStatus: SocialMediaStatus.google,
        providerId: googleUser.id,
        firebaseToken: token,
      ));

      await delayForCreateNewStatus();

      result.fold((failure) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      }, (userData) {
        emit(state.copyWith(
          flowStateApp: FlowStateApp.successLoggedIn,
        ));
      });
    } catch (error) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.error,
          failure: const Failure(message: AppStrings.unknownError)));
    }
  }

  Future<void> loginWithApple() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.restfort.app',
          redirectUri: Uri.parse(
              'https://band-low-grasshopper.glitch.me/callbacks/sign_in_with_apple'),
        ),
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      Logger.log(appleCredential.toString());

      final token = await getTokenFirbase();
      final result = await _loginUseCase(LoginRequest(
        socialMediaStatus: SocialMediaStatus.apple,
        providerId: appleCredential.userIdentifier,
        firebaseToken: token,
      ));

      await delayForCreateNewStatus();

      result.fold((failure) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      }, (userData) {
        emit(state.copyWith(
          flowStateApp: FlowStateApp.successLoggedIn,
        ));
      });
    } catch (error) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.error,
          failure: Failure(message: error.toString())));
    }
  }

  void changePhone(String phone) {
    try {
      // Update phone in the state
      // Validate phone number
      final isValid = MobileNumber(
              countryCode: state.form.countryCode,
              number: phone,
              countryISOCode: state.form.countryISOCode)
          .isValidNumber();

      if (isValid) {
        emit(state.copyWith(
          failure: const Failure.empty(),
          flowStateApp: FlowStateApp.normal,
          form: state.form.copyWith(
            phone: phone,
            // country: value.length >= 2 ? value[1] : '',
            //   isVaildPhone: isValidPhone(value[0], value[2]),
          ),
        ));
        emit(
            state.copyWith(phoneInputErrorMessage: '')); // Clear error if valid
      }
    } catch (e) {
      String errorMsg = '';
      if (e is NumberTooShortException) {
        errorMsg = AppStrings.thePhoneNumberIsTooShort;
      } else if (e is NumberTooLongException) {
        errorMsg = AppStrings.thePhoneNumberIsTooLong;
      } else {
        errorMsg = AppStrings.phoneNumberIsInvalid;
      }
      emit(state.copyWith(phoneInputErrorMessage: errorMsg));
    }
  }

  void changeCountryCode(String value) {
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        countryCode: value,
        // country: value.length >= 2 ? value[1] : '',
        //   isVaildPhone: isValidPhone(value[0], value[2]),
      ),
    ));
  }

  void changeCountryISOCode(String value) {
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      form: state.form.copyWith(
        countryISOCode: value,
        // country: value.length >= 2 ? value[1] : '',
        //   isVaildPhone: isValidPhone(value[0], value[2]),
      ),
    ));
  }

  void resetToDefault() {
    emit(state.copyWith(flowStateApp: FlowStateApp.draft));
//
  }
}
