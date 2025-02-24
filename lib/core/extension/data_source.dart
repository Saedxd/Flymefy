import 'package:flymefy/core/enum/enums.dart';
import 'package:flymefy/core/error/failure.dart';

import '../resources_manager/api_codes.dart';
import '../resources_manager/api_messages.dart';
import '../resources_manager/constant.dart';
import '../resources_manager/strings.dart';

extension InputFiledError on DataSourceValidationInput? {
  String getErrorInput() {
    switch (this) {
      case DataSourceValidationInput.empty:
        return AppStrings.emptyInput;
      case DataSourceValidationInput.usernameStyle:
        return AppStrings.phoneStyleInput;
      case DataSourceValidationInput.shortPassword:
        return AppStrings.shortPasswordInput;
      case DataSourceValidationInput.notIdenticalPassword:
        return AppStrings.notIdenticalPasswordInput;
      case DataSourceValidationInput.weakPassword:
        return AppStrings.weakPasswordInput;
      case DataSourceValidationInput.veryLong:
        return AppStrings.veryLongInput;
      case DataSourceValidationInput.length:
        return AppStrings.lengthInput;
      case DataSourceValidationInput.maxInputCount:
        return AppStrings.maxInputCountInput;
      case DataSourceValidationInput.notPhoneStyle:
        return AppStrings.notPhoneStyleInput;
      case DataSourceValidationInput.notEmail:
        return AppStrings.notEmailInput;
      case DataSourceValidationInput.notInteger:
        return AppStrings.notIntegerInput;
      case DataSourceValidationInput.notDouble:
        return AppStrings.notDoubleInput;
      case DataSourceValidationInput.notBool:
        return AppStrings.notBoolInput;
      case DataSourceValidationInput.notString:
        return AppStrings.notStringInput;
      case DataSourceValidationInput.containSpecialChar:
        return AppStrings.containSpecialCharInput;
      case DataSourceValidationInput.unknown:
        return AppStrings.unknownInput;
      case DataSourceValidationInput.inValidFormat:
        return AppStrings.invalidInput;
      case DataSourceValidationInput.nameistoolong:
        return AppStrings.nameIsTooLong;
      case DataSourceValidationInput.descriptionVeryLong:
        return AppStrings.descriptionIsTooLong;
      case DataSourceValidationInput.descriptionVeryShort:
        return AppStrings.descriptionIsTooShort;
      case DataSourceValidationInput.promoCodeVeryShort:
        return AppStrings.promoCodeIsTooShort;
      case DataSourceValidationInput.promoCodeVeryLong:
        return AppStrings.promoCodeIsTooLong;
      case DataSourceValidationInput.lengthStreet:
        return AppStrings.streetIsTooShort;
      case DataSourceValidationInput.lengthStreetVeryLong:
        return AppStrings.streetIsTooLong;

      default:
        return AppStrings.validInput;
    }
  }
}

extension DataSourceExtension on DataSourceNetworkError {
  Failure getFailure() {
    switch (this) {
      case DataSourceNetworkError.notFound:
        return const Failure(
            code: ResponseCode.notFound, message: ResponseMessage.notFound);
      case DataSourceNetworkError.noContent:
        return const Failure(
            code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSourceNetworkError.badContent:
        return const Failure(
            code: ResponseCode.badContent, message: ResponseMessage.badContent);
      case DataSourceNetworkError.forbidden:
        return const Failure(
            code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSourceNetworkError.unAuthorized:
        return const Failure(
            code: ResponseCode.unAuthorised,
            message: ResponseMessage.unAuthorised);
      case DataSourceNetworkError.internalServerError:
        return const Failure(
            code: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSourceNetworkError.connectTimeOut:
        return const Failure(
            code: ResponseCode.connectTimeOut,
            message: ResponseMessage.connectTimeOut);
      case DataSourceNetworkError.cancel:
        return const Failure(
            code: ResponseCode.cancel, message: ResponseMessage.cancel);
      case DataSourceNetworkError.receiveTimeOut:
        return const Failure(
            code: ResponseCode.recieveTimeOut,
            message: ResponseMessage.receiveTimeOut);
      case DataSourceNetworkError.sendTimeOut:
        return const Failure(
            code: ResponseCode.sendTimeOut,
            message: ResponseMessage.sendTimeOut);
      case DataSourceNetworkError.cashError:
        return const Failure(
            code: ResponseCode.cashError, message: ResponseMessage.cashError);
      case DataSourceNetworkError.noInternetConnection:
        return const Failure(
            code: ResponseCode.noInternetConnection,
            message: ResponseMessage.noInternetConnection);

      default:
        return AppConstants.unknownfailure;
    }
  }
}

extension DataSourcePermissionErrorExtension on DataSourcePermission {
  Failure getFailure() {
    switch (this) {
      case DataSourcePermission.checkPermissionError:
        return const Failure(
            code: ResponseCode.permissionCheckError,
            message: ResponseMessage.permissionCheckError);
      case DataSourcePermission.permissionDenied:
        return const Failure(
            code: ResponseCode.permissionDined,
            message: ResponseMessage.permissionDined);
      case DataSourcePermission.permissionPermanentlyDenied:
        return const Failure(
            code: ResponseCode.permissionPermanentlyDenied,
            message: ResponseMessage.permissionPermanentlyDenied);
      case DataSourcePermission.permissionRestricted:
        return const Failure(
            code: ResponseCode.permissionRestricted,
            message: ResponseMessage.permissionRestricted);
      case DataSourcePermission.noImageSelected:
        return const Failure(
            code: ResponseCode.noImageSelected,
            message: ResponseMessage.noImageSelected);
      case DataSourcePermission.unknownPermissionError:
        return const Failure(
            code: ResponseCode.unknownPermissionError,
            message: ResponseMessage.unknownPermissionError);
      case DataSourcePermission.locationServiceDisabled:
        return const Failure(
            code: ResponseCode.locationServiceDisabled,
            message: ResponseMessage.locationServiceDisabled);
      default:
        return AppConstants.unknownfailure;
    }
  }
}

extension DataSourceLaunchUrlExtension on DataSourceLaunchUrl {
  Failure getFailure() {
    switch (this) {
      case DataSourceLaunchUrl.cantNotOpen:
        return const Failure(
            code: ResponseCode.cantNotOpen,
            message: ResponseMessage.cantNotOpen);
      case DataSourceLaunchUrl.systemError:
        return const Failure(
            code: ResponseCode.systemError,
            message: ResponseMessage.systemError);
      case DataSourceLaunchUrl.inValidUrl:
        return const Failure(
            code: ResponseCode.inValidUrl, message: ResponseMessage.inValidUrl);
      default:
        return AppConstants.unknownfailure;
    }
  }
}

extension DataSourceLocalNotificationExtension on DataSourceLocalNotification {
  Failure getFailure() {
    switch (this) {
      case DataSourceLocalNotification.onShowError:
        return const Failure(
            code: ResponseCode.onShowError,
            message: ResponseMessage.onShowError);
      case DataSourceLocalNotification.onCancelAllError:
        return const Failure(
            code: ResponseCode.onCancelAllError,
            message: ResponseMessage.onCancelAllError);
      case DataSourceLocalNotification.onCancelOneError:
        return const Failure(
            code: ResponseCode.onCancelOneError,
            message: ResponseMessage.onCancelOneError);
      case DataSourceLocalNotification.onInitError:
        return const Failure(
            code: ResponseCode.onInitError,
            message: ResponseMessage.onInitError);
      case DataSourceLocalNotification.onDidReceiveNotificationError:
        return const Failure(
            code: ResponseCode.onDidReceiveNotificationError,
            message: ResponseMessage.onDidReceiveNotificationError);
      case DataSourceLocalNotification.onGetDetailsNotificationError:
        return const Failure(
            code: ResponseCode.onGetDetailsNotificationError,
            message: ResponseMessage.onGetDetailsNotificationError);
      case DataSourceLocalNotification.onGetSettingIosOrAndroidError:
        return const Failure(
            code: ResponseCode.onGetSettingIosOrAndroidError,
            message: ResponseMessage.onGetSettingIosOrAndroidError);
      default:
        return AppConstants.unknownfailure;
    }
  }
}

extension ReservationStatusExtension on String {
  ReservationStatus get statusEnum {
    switch (this) {
      case "1":
        return ReservationStatus.waitingForApproval;
      case "2":
        return ReservationStatus.rejected;
      case "3":
        return ReservationStatus.waitingForPayment;
      case "4":
        return ReservationStatus.paymentExpired;
      case "5":
        return ReservationStatus.waitingToStart;
      case "6":
        return ReservationStatus.started;
      case "7":
        return ReservationStatus.done;
      case "8":
        return ReservationStatus.rentedCanceled;
      case "9":
        return ReservationStatus.tenantCanceled;
      case "10":
        return ReservationStatus.proccingPayment;
      default:
        return ReservationStatus.proccingPayment;
    }
  }
}
