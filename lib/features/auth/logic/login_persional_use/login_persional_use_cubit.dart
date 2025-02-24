import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_mobile_field/mobile_number.dart';
import 'package:flymefy/core/app_export.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/input_validation/validation_input.dart';
import 'package:flymefy/features/auth/data/requests/request.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../../core/input_validation/input_validation.dart';
import '../../../../../../core/service/firebase.dart';
import '../../domain/entity/user.dart';
import '../../domain/usecase/login_use_case.dart';

part 'login_persional_use_state.dart';

class LoginPersionUseCubit extends Cubit<LoginPersionalUseState> {
  final LoginUseCase _loginUseCase;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  LoginPersionUseCubit({
    required LoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(const LoginPersionalUseState());

  void validateAndLogin() {
    String errorMsg = '';
    final isPhoneValid;
    try {
      isPhoneValid = MobileNumber(
        countryCode: state.form.countryCode,
        number: state.form.phone,
        countryISOCode: state.form.countryISOCode,
      ).isValidNumber();
    } catch (e) {
      if (e is NumberTooShortException) {
        errorMsg = AppStrings.thePhoneNumberIsTooShort;
      } else if (e is NumberTooLongException) {
        errorMsg = AppStrings.thePhoneNumberIsTooLong;
      } else {
        errorMsg = AppStrings.phoneNumberIsInvalid;
      }
    }
    final passwordValidationResult =
        validatePassword(state.form.password.value);

    // Check if both phone and password are valid
    if (passwordValidationResult == null && errorMsg == '') {
      login(); // Call login if both fields are valid
    } else {
      // Emit state with error messages
      emit(state.copyWith(
        phoneInputErrorMessage:
            errorMsg.isEmpty ? '' : AppStrings.phoneNumberIsInvalid,
        passwordInputErrorMessage:
            passwordValidationResult.getErrorInput() ?? '',
      ));
    }
  }

  Future<void> login() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));

    final token = await getTokenFirbase();

    final result = await _loginUseCase(LoginRequest(
      socialMediaStatus: SocialMediaStatus.phoneAndPassword,
      loginIdentifier: state.form.phone.trim(),
      password: state.form.password.value.trim(),
      firebaseToken: token,
      countryCode: state.form.countryCode.trim(),
    ));

    await delayForCreateNewStatus();
    result.fold((failure) {
      emit(state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
    }, (userData) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.successLoggedIn, userData: userData));
    });
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
        country: value,
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

  bool isValidPhone(String phone, String error) {
    if (phone.isEmpty || error.isNotEmpty) {
      return true;
    }
    return false;
  }

  void changePassword(String password) {
    final passwordInput = PasswordInput.dirty(password);
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        form: state.form.copyWith(
          password: passwordInput,
        )));
  }

  void changeHidePassword() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal, hidePassword: !state.hidePassword));
  }

  void changeCountry(String countryisoCode) {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        form: state.form.copyWith(countryISOCode: countryisoCode)));
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    // try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    debugPrint(googleUser!.displayName);

    await googleUser.authentication;

    final token = await getTokenFirbase();
    final result = await _loginUseCase(LoginRequest(
      socialMediaStatus: SocialMediaStatus.google,
      providerId: googleUser.id,
      firebaseToken: token,
      email: googleUser.email,
      fullName: googleUser.displayName,
      profileImage: googleUser.photoUrl,
    ));

    await delayForCreateNewStatus();

    result.fold((failure) {
      debugPrint(failure.toString());
      emit(state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
    }, (userData) {
      emit(state.copyWith(
          flowStateApp: FlowStateApp.successLoggedIn, userData: userData));
    });
    // } catch (error) {
    //   print(error);
    //   emit(state.copyWith(
    //       flowStateApp: FlowStateApp.error,
    //       failure: const Failure(message: AppStrings.unknownError)));
    // }
  }

  Future<void> loginWithApple() async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        // webAuthenticationOptions: WebAuthenticationOptions(
        //   clientId: 'com.restfort.app',
        //   redirectUri: Uri.parse(
        //       'https://band-low-grasshopper.glitch.me/callbacks/sign_in_with_apple'),
        // ),
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (appleCredential.userIdentifier == null) {
        emit(state.copyWith(
            flowStateApp: FlowStateApp.error,
            failure: const Failure(message: AppStrings.unknownError)));
        return;
      }
      // Logger.log(appleCredential.toString());

      final token = await getTokenFirbase();
      final result = await _loginUseCase(LoginRequest(
        socialMediaStatus: SocialMediaStatus.apple,
        providerId: appleCredential.userIdentifier,
        fullName: appleCredential.email,
        firebaseToken: token,
      ));

      await delayForCreateNewStatus();

      result.fold((failure) {
        emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure));
      }, (userData) {
        emit(state.copyWith(
            flowStateApp: FlowStateApp.successLoggedIn, userData: userData));
      });
    } catch (error) {
      // emit(state.copyWith(
      //     flowStateApp: FlowStateApp.error,
      //     failure: Failure(message: error.toString())));
    }
  }
}
