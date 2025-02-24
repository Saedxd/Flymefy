import 'dart:io';

import 'package:flymefy/features/auth/domain/entity/register.dart';

/*

  'social_media_status': '1',
  'login_identifier': '53489438934894',
  'password': '12345678',
  'player_id': '123'
  'country_code': '962',
  'password': '12345678',
  'provider_id': 'provider id',
*/
enum SocialMediaStatus {
  phoneAndPassword,
  google,
  apple,
}

final class LoginRequest {
  final String? loginIdentifier;
  final String? password;
  final String firebaseToken;
  final SocialMediaStatus socialMediaStatus;
  final String? countryCode;
  final String? providerId;

  final String? fullName;
  final String? email;
  final String? profileImage;

  LoginRequest(
      {required this.firebaseToken,
      required this.socialMediaStatus,
      this.loginIdentifier,
      this.password,
      this.countryCode,
      this.providerId,
      this.email,
      this.fullName,
      this.profileImage});

  Map<String, dynamic> toJson() {
    if (getSocialMediaStatus(socialMediaStatus) == "1") {
      return {
        'social_media_status': getSocialMediaStatus(socialMediaStatus),
        'login_identifier': loginIdentifier,
        'password': password,
        'player_id': firebaseToken,
        'country_code': countryCode,
      };
    } else {
      return {
        'social_media_status': getSocialMediaStatus(socialMediaStatus),
        'player_id': firebaseToken,
        'provider_id': providerId,
        'email': email,
        'full_name': fullName,
        'face_shot': profileImage
      };
    }
  }

  String getSocialMediaStatus(SocialMediaStatus value) {
    switch (value) {
      case SocialMediaStatus.phoneAndPassword:
        return '1';
      case SocialMediaStatus.google:
        return '2';
      case SocialMediaStatus.apple:
        return '3';
      default:
        return '1';
    }
  }
}

final class ForgetPasswordRequest {
  final String phone;
  final String countryCode;

  ForgetPasswordRequest(this.phone, this.countryCode);

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      "country_code": countryCode,
    };
  }
}

final class ConfirmEmailRequest {
  final String code;
  ConfirmEmailRequest(this.code);

  Map<String, dynamic> toJson() {
    return {
      'hash': code,
    };
  }
}

final class DeviceTokenRequest {
  final String token;
  DeviceTokenRequest(this.token);

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

//ConfirmCodeRequest
final class ConfirmCodeRequest {
  final String code;
  final String phone;
  ConfirmCodeRequest({
    required this.code,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'phone': phone,
    };
  }
}

class RegisterRequest {
  final String firstName;
  final String lastName;
  final String phone;
  final String countryCode;
  final String password;
  final String passwordConfirmation;
  // final File profileImage;

  final String firebaseToken;
  // final bool isPassport;
  // final File documentFront;
  // final File faceShot;
  // final File? documentBack;
  final String? email;

  // Constructor
  RegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.countryCode,
    required this.password,
    required this.passwordConfirmation,
    required this.firebaseToken,
    // required this.profileImage,

    //  required this.isPassport,
    //  required this.documentFront,
    // required this.faceShot,
    //  this.documentBack,
    this.email,
  });

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'country_code': countryCode,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'player_id': firebaseToken,
      //  'document_type': isPassport ? '2' : '1',
      if (email != null) 'email': email,

      //  if (!isPassport) 'document_front': documentFront.path,
      //'face_shot': faceShot.path,
      //  if (!isPassport) 'document_back': documentBack?.path,
    };
  }

  //images
  Map<String, File> toImages() {
    return {
      // 'document_front': documentFront,
      // 'face_shot': faceShot,
      //  'profile_image': profileImage,

      // if (!isPassport) 'document_back': documentBack!,

      // if (isPassport) 'document_front': documentFront,
      //   if (!isPassport) 'document_back': documentBack!,
    };
  }
}

class RegisterBussinessRequest {
  /*
   email: state.form.email.value,
      password: state.form.password.value,
      galleryName: state.form.galleryName.value,
      phone: state.form.phone.value,
      whatsAppNumper: state.form.whatsAppNumper.value,
  */
  final String email;
  final String password;
  final String galleryName;
  final String phone;
  final String? whatsAppNumper;
  final String? facebookLink;
  final String? websiteUrl;
  final String? address;
  final double? lat;
  final double? lng;
  final String? carStatus;

  RegisterBussinessRequest(
    this.email,
    this.password,
    this.galleryName,
    this.phone,
    this.whatsAppNumper,
    this.facebookLink,
    this.websiteUrl,
    this.address,
    this.lat,
    this.lng,
    this.carStatus,
  );

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'galleryName': galleryName,
      'phone': phone,
      'whatsAppNumper': whatsAppNumper,
      'facebookLink': facebookLink,
      'websiteUrl': websiteUrl,
      'address': address,
      'lat': lat,
      'lng': lng,
      'carStatus': carStatus != null ? getCarStatus(carStatus!) : carStatus,
    };
  }

  /*
  حالات سيارات ف agency
  "الجديدة",
  "المستعملة",
  "الموزعون المعتمدون",
  "المستوردة",
  
  */
  String getCarStatus(String value) {
    switch (value) {
      case "newGalleriesCar":
        return "الجديدة";
      case "usedGalleriesCar":
        return "المستعملة";
      case "authorizedDistributorsGalleriesCar":
        return "الموزعون المعتمدون";
      case "importedGalleriesCar":
        return "المستوردة";
      default:
        return "الجديدة";
    }
  }
}

final class ResetPasswordCreatePasswordRequest {
  final String email;
  final String password;
  final String confirmPassword;
  ResetPasswordCreatePasswordRequest(
      this.email, this.password, this.confirmPassword);

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}

class ResondOtpRequest {
  final String token;

  ResondOtpRequest(this.token);

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

/*
  'otp_code': '397375',
  'phone': '0780316716',
  'country_code': '962'
*/

class ValidateForgetPasswordOtpRequest {
  final String otp;
  final String phone;
  final String countryCode;

  ValidateForgetPasswordOtpRequest({
    required this.otp,
    required this.phone,
    required this.countryCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'otp_code': otp,
      'phone': phone,
      'country_code': countryCode,
    };
  }
}

class ValidateOtpRequest {
  final String otp;
  final String phone;
  final String countryCode;
  final String token;

  ValidateOtpRequest({
    required this.otp,
    required this.phone,
    required this.countryCode,
    required this.token,
  });

  Map<String, dynamic> toJson() {
    return {
      'otp_code': otp,
      'phone': phone,
      'country_code': countryCode,
    };
  }
}

class ValidateOtpRegisterRequest {
  final String otp;
  final RegisterData registerData;

  ValidateOtpRegisterRequest({
    required this.otp,
    required this.registerData,
  });

  Map<String, dynamic> toJson() {
    return {
      'otp_code': otp,
      'phone': registerData.phone,
      'country_code': registerData.countryCode,
    };
  }
}

// 'phone': '582926813',
//  'country_code': '966'

final class ComplaintRequest {
  final String title;
  final String body;
  ComplaintRequest({
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'complaint_Title': title,
      'complaint_Body': body,
    };
  }

  // to query parameter
  Map<String, dynamic> toQueryParamter() {
    return {
      r'complaint_Title': title,
      r'complaint_Body': body,
    };
  }
}

/*
PageNumber
PageSize
Search
*/

class ComplaintListRequest {
  final int pageNumber;
  final int pageSize;
  final String search;

  ComplaintListRequest({
    required this.pageNumber,
    required this.pageSize,
    required this.search,
  });

  Map<String, dynamic> toQueryParamter() {
    return {
      r'PageNumber': pageNumber,
      r'PageSize': pageSize,
      r'Search': search,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'PageNumber': pageNumber,
      'PageSize': pageSize,
      'Search': search,
    };
  }
}

class ComplaintRepliesListRequest {
  final int pageNumber;
  final int pageSize;
  // ignore: non_constant_identifier_names
  final String ID;

  ComplaintRepliesListRequest({
    required this.pageNumber,
    required this.pageSize,
    // ignore: non_constant_identifier_names
    required this.ID,
  });

  Map<String, dynamic> toQueryParamter() {
    return {
      r'PageNumber': pageNumber,
      r'PageSize': pageSize,
      r'ID': ID,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'PageNumber': pageNumber,
      'PageSize': pageSize,
      'ID': ID,
    };
  }
}

class ValidateOtpChangeNumbersRequest {
  final String otp;
  final String phone;
  final String countryCode;

  ValidateOtpChangeNumbersRequest({
    required this.otp,
    required this.phone,
    required this.countryCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'otp_code': otp,
      'phone': phone,
      'country_code': countryCode,
    };
  }
}
