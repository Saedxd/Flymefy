/*

*/
import 'package:flymefy/features/auth/domain/entity/user.dart';

class RegisterData {
  final String phone;
  final String email;
  final String countryCode;
  final String firstName;
  final String lastName;
  final String playerId;
  final String documentType;
  final String documentFront;
  final String documentBack;
  final String updatedAt;
  final String createdAt;
  final int id;
  final int otpCode;
  final String token;

  const RegisterData({
    this.phone = '',
    this.email = '',
    this.countryCode = '',
    this.firstName = '',
    this.lastName = '',
    this.playerId = '',
    this.documentType = '',
    this.documentFront = '',
    this.documentBack = '',
    this.updatedAt = '',
    this.createdAt = '',
    this.id = 0,
    this.otpCode = 000000,
    this.token = '',
  });

  UserAppInfo toUserApp() {
    return UserAppInfo(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      countryCode: countryCode,
      otpCode: otpCode.toString(),
      documentType: documentType,
      documentFront: documentFront,
      documentBack: documentBack,
      otpIsVerified: 'Verified',
      verifiedAt: updatedAt,
      profileImage: '',
      playerId: playerId,
      socialMediaStatus: '',
      providerId: '',
      token: token,
      isTenant: true,
    );
  }

  // Factory method to create an instance of RegisterData from JSON
  factory RegisterData.fromJson(Map<String, dynamic> json) {
    return RegisterData(
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      countryCode: json['country_code'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      playerId: json['player_id'] ?? '',
      documentType: json['document_type'] ?? '',
      documentFront: json['document_front'] ?? '',
      documentBack: json['document_back'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      createdAt: json['created_at'] ?? '',
      id: json['id'] != null ? (int.tryParse(json['id'].toString()) ?? 0) : 0,
      otpCode: json['otp_code'] != null
          ? (int.tryParse(json['otp_code'].toString()) ?? 0)
          : 0,
      token: json['token'] ?? '',
    );
  }

  // Method to convert an instance of RegisterData to JSON
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'email': email,
      'country_code': countryCode,
      'first_name': firstName,
      'last_name': lastName,
      'player_id': playerId,
      'document_type': documentType,
      'document_front': documentFront,
      'document_back': documentBack,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
      'otp_code': otpCode,
      'token': token,
    };
  }
}
