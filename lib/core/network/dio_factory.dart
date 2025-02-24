import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flymefy/core/di/locator.dart';
import 'package:flymefy/core/extension/data_type.dart';
import 'package:flymefy/core/network/api.dart';
import 'package:flymefy/core/resources_manager/cashed_run_time.dart';
import 'package:flymefy/core/resources_manager/constant.dart';
import 'package:flymefy/core/service/app_preferance.dart';
import 'package:flymefy/features/general/presernatation/logic/authentication/authentication_cubit.dart';

import '../../features/auth/domain/entity/user.dart';
import '../enum/enums.dart';

abstract interface class IDioFactory {
  Future<Dio> getDio();
}

class DioFactoryImpl implements IDioFactory {
  final _dio = Dio();

  final AppPreferences _appPreferences;
  DioFactoryImpl({required AppPreferences appPreferences})
      : _appPreferences = appPreferences;

  @override
  Future<Dio> getDio() async {
    _dio.options = BaseOptions(
        baseUrl: Config.api_url,
        headers: {},
        followRedirects: true,
        maxRedirects: 2);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _handleRequest,
        onError: _handleError,
      ),
    );

    if (!kReleaseMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
    return _dio;
  }

  Future _handleError(
      DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      await _appPreferences.logout();
      UserDataSingleton.instance.setUserData(const UserAppInfo());
      instance<AuthenticationCubit>()
          .changeAuthentication(AppAuthenticationLevel.unAuthenticated);
    }

    return handler.next(error);
  }

  Future _handleRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final lang = await _appPreferences.getLang();

    options.headers['lang'] = lang;
    options.headers['Content-Type'] = "application/json";
    options.headers['accept'] = "*/*";
    if (!AppConstants.apiWithoutToken.contains(options.path)) {
      final data = await _appPreferences.getToken();

      UserDataSingleton.instance.setUserData(data);
      if (data.token.isNotEmpty) {
        options.headers['Authorization'] = data.token.toBearerTokenStyle;
      }
    }
    return handler.next(options);
  }
}
