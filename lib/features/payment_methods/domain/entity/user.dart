import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UserAppInfo extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String phoneTwo;
  final String countryCode;
  final String countryCodeTwo;
  final String otpCode;
  final String documentType;
  final String documentFront;
  final String documentBack;
  final String otpIsVerified;
  final String verifiedAt;
  final String profileImage;
  final String playerId;
  final String socialMediaStatus;
  final String providerId;
  final String token;
  final bool isTenant;
  final String walletBalance;
  final String countryIsoCode;
  final String countryIsoCodeTwo;
  //        "wallet_balance": "0.00",

  const UserAppInfo({
    this.id = 0,
    this.firstName = 'Phoenix',
    this.lastName = 'Baker',
    this.email = 'info@example.com',
    this.phone = '987 654 321',
    this.phoneTwo = '',
    this.countryCode = '+682',
    this.countryCodeTwo = '',
    this.otpCode = '',
    this.documentType = 'Civil Status Identity',
    this.documentFront = '',
    this.documentBack = '',
    this.otpIsVerified = 'Verified',
    this.verifiedAt = '',
    this.profileImage = '',
    this.playerId = '',
    this.socialMediaStatus = '',
    this.providerId = '',
    this.token = '',
    this.isTenant = true,
    this.walletBalance = '0.00',
    this.countryIsoCode = '',
    this.countryIsoCodeTwo = '',
  });

  UserAppInfo copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? phoneTwo,
    String? countryCode,
    String? countryCodeTwo,
    String? otpCode,
    String? documentType,
    String? documentFront,
    String? documentBack,
    String? otpIsVerified,
    String? verifiedAt,
    String? profileImage,
    String? playerId,
    String? socialMediaStatus,
    String? providerId,
    String? token,
    bool? isTenant,
    String? walletBalance,
    String? countryIsoCode,
    String? countryIsoCodeTwo,
  }) {
    return UserAppInfo(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      phoneTwo: phoneTwo ?? this.phoneTwo,
      countryCode: countryCode ?? this.countryCode,
      countryCodeTwo: countryCodeTwo ?? this.countryCodeTwo,
      otpCode: otpCode ?? this.otpCode,
      documentType: documentType ?? this.documentType,
      documentFront: documentFront ?? this.documentFront,
      documentBack: documentBack ?? this.documentBack,
      otpIsVerified: otpIsVerified ?? this.otpIsVerified,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      profileImage: profileImage ?? this.profileImage,
      playerId: playerId ?? this.playerId,
      socialMediaStatus: socialMediaStatus ?? this.socialMediaStatus,
      providerId: providerId ?? this.providerId,
      token: token ?? this.token,
      isTenant: isTenant ?? this.isTenant,
      walletBalance: walletBalance ?? this.walletBalance,
      countryIsoCode: countryIsoCode ?? this.countryIsoCode,
      countryIsoCodeTwo: countryIsoCodeTwo ?? this.countryIsoCodeTwo,
    );
  }

  factory UserAppInfo.fromMap(Map<String, dynamic> map) {
    return UserAppInfo(
      id: map['id'] ?? 0,
      firstName: map['first_name'] ?? 'Phoenix',
      lastName: map['last_name'] ?? 'Baker',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      phoneTwo: map['phone_two'] ?? '',
      countryCode: map['country_code'] ?? '',
      countryCodeTwo: map['country_code_two'] ?? '',
      otpCode: map['otp_code'] ?? '',
      documentType: map['document_type'] ?? '',
      documentFront: map['document_front'] ?? '',
      documentBack: map['document_back'] ?? '',
      otpIsVerified: map['otp_is_verified'] ?? '',
      verifiedAt: map['verified_at'] ?? '',
      profileImage: map['profile_image'] ?? '',
      playerId: map['player_id'] ?? '',
      socialMediaStatus:
          map['social_media_status'].toString() ?? '', //todo: change
      providerId: map['provider_id'] ?? '',
      token: map['token'] ?? '',
      isTenant: true,
      walletBalance: map['wallet_balance'] ?? '0.00',
      countryIsoCode: map['country_iso_code'] ?? '',
      countryIsoCodeTwo: map['country_iso_code_two'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'phone_two': phoneTwo,
      'country_code': countryCode,
      'country_code_two': countryCodeTwo,
      'otp_code': otpCode,
      'document_type': documentType,
      'document_front': documentFront,
      'document_back': documentBack,
      'otp_is_verified': otpIsVerified,
      'verified_at': verifiedAt,
      'profile_image': profileImage,
      'player_id': playerId,
      'social_media_status': socialMediaStatus,
      'provider_id': providerId,
      'token': token,
      'is_tenant': isTenant,
      'wallet_balance': walletBalance,
      'country_iso_code': countryIsoCode,
      'country_iso_code_two': countryIsoCodeTwo,
    };
  }

  bool get isVerifedAccount => otpIsVerified == 'Verified';

  String get getPhoneNumber => '$countryCode $phone';

  String get getFullName => '$firstName $lastName';

  String get getDocumentType => documentType;

  bool get isPassportDocument => documentType == 'Passport';

  bool get isCivilStatusIdentityDocument =>
      documentType == 'Civil Status Identity';

  String get firstChar =>
      firstName.isNotEmpty ? firstName[0].toUpperCase() : "P";
  String get lastChar => lastName.isNotEmpty ? lastName[0].toUpperCase() : "B";

  String get getNikeName => '$firstChar$lastChar';

  bool get isNotSocialMediaAccount => socialMediaStatus == "1";
  bool get isSocialMediaAccountGoogle => socialMediaStatus == "2";
  bool get isSocialMediaAccountApple => socialMediaStatus == "3";

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        phone,
        phoneTwo,
        countryCode,
        countryCodeTwo,
        otpCode,
        documentType,
        documentFront,
        documentBack,
        otpIsVerified,
        verifiedAt,
        profileImage,
        playerId,
        socialMediaStatus,
        providerId,
        token,
        isTenant,
        walletBalance,
        countryIsoCodeTwo
      ];
}

extension UserInfoX on Response {
  UserAppInfo toUserInfoToDomain() {
    return UserAppInfo.fromMap(data);
  }
}

class ResendOTpCodeData {
  final String code;

  ResendOTpCodeData({
    this.code = '',
  });

  ResendOTpCodeData copyWith({
    String? code,
  }) {
    return ResendOTpCodeData(
      code: code ?? this.code,
    );
  }

  factory ResendOTpCodeData.fromMap(Map<String, dynamic> map) {
    return ResendOTpCodeData(
      code: map['code'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
    };
  }
}
