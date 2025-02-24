import 'package:equatable/equatable.dart';
import 'package:intl_mobile_field/mobile_number.dart';
import 'package:flymefy/core/error/failure.dart';
import 'package:flymefy/core/input_validation/validation_input.dart';
import 'package:flymefy/features/auth/data/requests/request.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/auth/domain/usecase/forget_password_use_case.dart';
import 'package:flymefy/features/notification/data/request/request.dart';

import '../../../../../core/app_export.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
 // final ChangePasswordUseCase _changePasswordUseCase;
  final ValidateForgetPasswordOPTUseCase _validateForgetPasswordOPTUseCase;
  final ForgetPasswordResendOPTUseCase _forgetPasswordResendOPTUseCase;
  // final ValidateOTPChangeNumbersUseCase _validateOTPChangeNumbersUseCase;

  ForgetPasswordCubit({
    required ForgetPasswordUseCase forgetPasswordUseCase,
   // required ChangePasswordUseCase changePasswordUseCase,
    required ValidateForgetPasswordOPTUseCase validateForgetPasswordOPTUseCase,
    required ForgetPasswordResendOPTUseCase forgetPasswordResendOPTUseCase,
    // required ValidateOTPChangeNumbersUseCase validateOTPChangeNumbersUseCase
  })  : _forgetPasswordUseCase = forgetPasswordUseCase,
      //  _changePasswordUseCase = changePasswordUseCase,
        _validateForgetPasswordOPTUseCase = validateForgetPasswordOPTUseCase,
        _forgetPasswordResendOPTUseCase = forgetPasswordResendOPTUseCase,
        // _validateOTPChangeNumbersUseCase = validateOTPChangeNumbersUseCase,
        super(const ForgetPasswordState()) {}

  void changePhone(String phone) {
    try {
      final isValid = MobileNumber(
              countryCode: state.countryCode,
              number: phone,
              countryISOCode: state.countryISOCode)
          .isValidNumber();

      if (isValid) {
        emit(state.copyWith(
          failure: const Failure.empty(),
          flowStateApp: FlowStateApp.normal,
          phone: phone,
          isVaildPhone: isValid,
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
    emit(
      state.copyWith(
        failure: const Failure.empty(),
        flowStateApp: FlowStateApp.normal,
        countryCode: value,
      ),
    );
  }

  void validateAndForgetPassword() {
    String errorMsg = '';
    try {
      MobileNumber(
        countryCode: state.countryCode,
        number: state.phone,
        countryISOCode: state.countryISOCode,
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

    if (errorMsg.isEmpty) {
      forgetPassword();
    } else {
      emit(state.copyWith(
        phoneInputErrorMessage:
            errorMsg.isEmpty ? '' : AppStrings.phoneNumberIsInvalid,
      ));
    }
  }

  void changeCode(String value) {
    emit(state.copyWith(flowStateApp: FlowStateApp.normal, codeOfUser: value));
  }

  void changeHidePassword() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal, hidePassword: !state.hidePassword));
  }

  void changeHideConfirmPassword() {
    emit(state.copyWith(
        flowStateApp: FlowStateApp.normal,
        hideConfirmPassword: !state.hideConfirmPassword));
  }

  void forgetPassword() async {
    if (state.isVaildPhone) {
      emit(state.copyWith(flowStateApp: FlowStateApp.loading));
      final result = await _forgetPasswordUseCase(
        ForgetPasswordRequest(
          state.phone,
          state.countryCode,
        ),
      );

      result.fold(
        (failure) => emit(
            state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
        (forgetPasswordData) => emit(
          state.copyWith(
            flowStateApp: FlowStateApp.success,
            phone: state.phone,
            countryCode: state.countryCode,
          ),
        ),
      );
    }
  }

  void validateOTP(String phone, String countryCode, String codeOfUser) async {
    if (codeOfUser.length == 6) {
      emit(state.copyWith(flowStateApp: FlowStateApp.loading));
      final result = await _validateForgetPasswordOPTUseCase(
        ValidateForgetPasswordOtpRequest(
          otp: codeOfUser,
          phone: phone,
          countryCode: countryCode,
        ),
      );

      result.fold(
        (failure) => emit(state.copyWith(
          flowStateApp: FlowStateApp.codeNotVaild,
          failure: failure,
        )),
        (success) {
          emit(state.copyWith(
            flowStateApp: FlowStateApp.successVerifyCode,
          ));
        },
      );
    }
  }

  void setPassword(String value) {
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      password: value,
    ));
  }

  void setChangeConfirmPassword(String value) {
    emit(state.copyWith(
      failure: const Failure.empty(),
      flowStateApp: FlowStateApp.normal,
      confirmPassword: value,
    ));
  }

  // void validateAndChangePassword(
  //     String phone, String countryCode, String code) {
  //   String errorMsg = '';

  //   var passwordValidationResult = validatePassword(
  //     state.password,
  //   );
  //   var confirmPasswordValidationResult =
  //       validatePassword(state.confirmPassword);

  //   if (state.password != state.confirmPassword) {
  //     passwordValidationResult =
  //         validateConfirmPassword([state.password, state.confirmPassword]);
  //     confirmPasswordValidationResult =
  //         validateConfirmPassword([state.password, state.confirmPassword]);

  //     emit(state.copyWith(
  //       passwordInputErrorMessage:
  //           passwordValidationResult?.getErrorInput() ?? '',
  //       confirmPasswordInputErrorMessage:
  //           confirmPasswordValidationResult?.getErrorInput() ?? '',
  //     ));
  //   } else if (errorMsg.isEmpty &&
  //       passwordValidationResult == null &&
  //       confirmPasswordValidationResult == null) {
  //     changePassword(phone, countryCode, code);
  //   } else {
  //     emit(state.copyWith(
  //       passwordInputErrorMessage:
  //           passwordValidationResult?.getErrorInput() ?? '',
  //       confirmPasswordInputErrorMessage:
  //           confirmPasswordValidationResult?.getErrorInput() ?? '',
  //     ));
  //   }
  // }

  // void changePassword(String phone, String countryCode, String code) async {
  //   if (state.isVaildPhone) {
  //     emit(state.copyWith(flowStateApp: FlowStateApp.loading));
  //     final result = await _changePasswordUseCase(
  //       ChangePasswordRequest(
  //         newPassword: state.password,
  //         confirmPassword: state.confirmPassword,
  //         phone: phone,
  //         countryCode: countryCode,
  //         otpCode: code,
  //       ),
  //     );

  //     result.fold(
  //       (failure) => emit(
  //           state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
  //       (forgetPasswordData) => emit(
  //         state.copyWith(
  //           flowStateApp: FlowStateApp.success,
  //         ),
  //       ),
  //     );
  //   }
  // }

  void resendCode(
    String phone,
    String countryCode,
  ) async {
    emit(state.copyWith(flowStateApp: FlowStateApp.loading));
    final result = await _forgetPasswordResendOPTUseCase(
      ForgetPasswordRequest(
        phone,
        countryCode,
      ),
    );

    result.fold(
      (failure) => emit(
          state.copyWith(flowStateApp: FlowStateApp.error, failure: failure)),
      (forgetPasswordData) => emit(
        state.copyWith(
          flowStateApp: FlowStateApp.success,
        ),
      ),
    );
  }
}
