import 'package:dio/dio.dart';
import 'package:flymefy/features/auth/domain/entity/forget_password.dart';
import 'package:flymefy/features/auth/domain/entity/register.dart';

import '../../features/auth/domain/entity/user.dart';

extension AuthMapper on Response {
  UserAppInfo toUserApp() {
    return UserAppInfo.fromMap(data['data']);
  }

  RegisterData toRegisterData() {
    return RegisterData.fromJson(data['data']);
  }

  ForgetPasswordData toForgetPassword() {
    return ForgetPasswordData.fromJson(data);
  }

  ResendOTpCodeData toOTPResendData() {
    if (data['data'] == null) {
      return ResendOTpCodeData();
    }
    return ResendOTpCodeData(code: data['data']);
  }
}
