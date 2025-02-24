import 'dart:io';

class PaginationRequest {
  final int page;
  final int pageSize;

  PaginationRequest(this.page, {this.pageSize = 20});

  // CopyWith method
  PaginationRequest copyWith({
    int? page,
    int? pageSize,
  }) {
    return PaginationRequest(
      page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'page_limit': pageSize,
    };
  }

  Map<String, dynamic> toQueryParamter() {
    return {
      r'page': page,
      r'page_limit': pageSize,
    };
  }
}

class RequestWithId {
  final String key;
  final String value;

  RequestWithId({
    required this.key,
    required this.value,
  });

  //to map
  Map<String, dynamic> toMap() {
    return {
      key: value,
    };
  }

  Map<String, dynamic> toQueryParamter() {
    return {
      key: value,
    };
  }

  // to query paramter
}

class GetNotificationsRequest {
  final int? page;
  final int? pageLimit;
  final String? type;

  GetNotificationsRequest({this.type, this.page, this.pageLimit});

  //to map
  Map<String, dynamic> toMap() {
    return {'role': type, 'page': page, 'page_limit': pageLimit};
  }

  // to query paramter
  Map<String, dynamic> toQueryParamter() {
    return {r'role': type, r'page': page, r'page_limit': pageLimit};
  }

  //copty with
  GetNotificationsRequest copyWith({
    String? type,
    int? page,
    int? pageLimit,
  }) {
    return GetNotificationsRequest(
      type: type ?? this.type,
      page: page ?? this.page,
      pageLimit: pageLimit ?? this.pageLimit,
    );
  }
}

class UpdateProfileReques {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? documentType;
  final File? profileImage;
  final File? frontDocument;
  final File? backDocument;

  UpdateProfileReques({
    this.firstName,
    this.lastName,
    this.email,
    this.documentType,
    this.profileImage,
    this.frontDocument,
    this.backDocument,
  });

  //to map
  Map<String, dynamic> toMap() {
    return {
      // if value != null 'first_name': firstName,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      // if (documentType != null ) 'document_type': documentType,
    };
  }

  Map<String, File> toImages() {
    return {
      if (profileImage != null) 'profile_image': profileImage!,
      // if (frontDocument != null) 'document_front': frontDocument!,
      // if (backDocument != null) 'document_back': backDocument!,
    };
  }
}

class VerifyPhoneRequest {
  final String newPhone;
  final String otp;

  VerifyPhoneRequest({
    required this.newPhone,
    required this.otp,
  });

  //to map
  Map<String, dynamic> toMap() {
    return {
      'new_MobileNo': newPhone,
      'otp': otp,
    };
  }

  Map<String, dynamic> toQueryParamter() {
    return {
      r'new_MobileNo': newPhone,
      r'otp': otp,
    };
  }

  // to query paramter
}

//Is_Used
class CarStatusRequest {
  final bool status;

  CarStatusRequest({
    required this.status,
  });

  //to map
  Map<String, dynamic> toMap() {
    return {
      'Is_Used': status,
    };
  }

  Map<String, dynamic> toQueryParamter() {
    return {
      r'Is_Used': status,
    };
  }
}
// to query paramter

class ChangePhoneRequest {
  final String phone;
  final String countryCode;
  final String phoneTwo;
  final String countryCodeTwo;

  ChangePhoneRequest({
    required this.phone,
    required this.countryCode,
    required this.phoneTwo,
    required this.countryCodeTwo,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'country_code': countryCode,
      'phone_two': phoneTwo,
      'country_code_two': countryCodeTwo
    };
  }
}

//ChangePasswordRequest
class ChangePasswordRequest {
  final String? oldPassword;
  final String newPassword;
  final String confirmPassword;
  final String? phone;
  final String? countryCode;
  final String? otpCode;

  const ChangePasswordRequest({
    required this.newPassword,
    required this.confirmPassword,
    this.phone,
    this.countryCode,
    this.otpCode,
    this.oldPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      if (oldPassword != null) 'old_password': oldPassword,
      'password': newPassword,
      'password_confirmation': confirmPassword,
      if (phone != null) "phone": phone,
      if (countryCode != null) "country_code": countryCode,
      if (otpCode != null) "otp_code": otpCode
    };
  }
}
