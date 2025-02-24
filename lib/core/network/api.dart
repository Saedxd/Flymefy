import 'dart:io';

import 'package:dio/dio.dart';


abstract interface class ClientApi {
  Future<Response> postApi(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> postApiWithImages(
    String path, {
    Map<String, dynamic>? data,
    Map<String, File>? images,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  // Future<Response> addUnit(
  //   String path, {
  //   PropertyRequest? formData,
  //   Map<String, dynamic>? headers,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  // });

  Future<Response> updateUnit(
    String path, {
    FormData? formData,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> updateUnitWithoutImage(
    String path, {
    FormData? formData,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> postApiSingleImage(
    String path, {
    File? image,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  Future<Response> postApiMultiImage(
    String path, {
    List<File>? images,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
  // get
  // delete
  // put
  // patch
  // head

  Future<Response> getApi(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> deleteApi(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> putApi(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> patchApi(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> getApiWithString(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> postApiWithString(
    String path, {
    Map<String, dynamic> data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  Future<Response> postApiSendMessage(
    String path, {
    File? image,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? dataApi,
    Options? options,
  });

  // Future<Response> submitReport(
  //   String path, {
  //   SubmitComplainRequest? formData,
  //   Map<String, dynamic>? headers,
  //   Map<String, dynamic>? queryParameters,
  //   Options? options,
  // });
}

class ClientApiImpl implements ClientApi {
  final Dio _dio;

  ClientApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Response> postApi(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    Map<String, dynamic> dataApi = data ?? {};
    // check if data contains file
    if (dataApi.containsKey('file')) {
      dataApi.remove('file');
    }
    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: dataApi,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> getApi(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'GET',
      headers: headers,
      extra: extra,
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> getApiWithString(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    options = Options(
      method: 'GET',
      headers: headers,
      extra: extra,
    );

    final result = await _dio.get(
      Config.api_url + path,
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
    return result;
  }

  @override
  Future<Response> postApiWithString(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    options = Options(
      method: 'POST',
      headers: headers,
      extra: extra,
    );

    final result = await _dio.post(
      Config.api_url + path,
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
    return result;
  }

  @override
  Future<Response> deleteApi(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'DELETE',
      headers: headers,
      extra: extra,
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> putApi(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'PUT',
      headers: headers,
      extra: extra,
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> patchApi(String path,
      {Map<String, dynamic>? data,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'PATCH',
      headers: headers,
      extra: extra,
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      requestOptions.responseType = ResponseType.json;
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }

  @override
  Future<Response> postApiMultiImage(String path,
      {List<File>? images,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    final data = FormData();

    if (images != null) {
      for (final image in images) {
        data.files.add(MapEntry(
          'Image',
          MultipartFile.fromFileSync(
            image.path,
            filename: image.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }

    final result = await _dio
        .fetch<List<dynamic>>(_setStreamType<Response<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> postApiSingleImage(String path,
      {File? image,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? extra}) async {
    final data = FormData();

    if (image != null) {
      data.files.add(MapEntry(
        'Image',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      ));
    }

    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> postApiWithImages(String path,
      {Map<String, dynamic>? data,
      Map<String, File>? images,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    final dataForm = FormData();

    if (images != null) {
      for (final image in images.entries) {
        dataForm.files.add(MapEntry(
          image.key,
          MultipartFile.fromFileSync(
            image.value.path,
            filename: image.value.path.split(Platform.pathSeparator).last,
          ),
        ));
      }
    }
    // add data to form data
    if (data != null) {
      data.forEach((key, value) {
        dataForm.fields.add(MapEntry(key, value.toString()));
      });
    }

    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: dataForm,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  // @override
  // Future<Response> addUnit(String path,
  //     {PropertyRequest? formData,
  //     Map<String, dynamic>? headers,
  //     Map<String, dynamic>? queryParameters,
  //     Options? options}) async {
  //   final form = await formData!.toFormData();
  //   final result = await _dio
  //       .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
  //     method: 'POST',
  //     headers: headers,
  //     contentType: 'multipart/form-data',
  //   )
  //           .compose(
  //             _dio.options,
  //             path,
  //             queryParameters: queryParameters,
  //             data: form,
  //           )
  //           .copyWith(
  //               baseUrl: _combineBaseUrls(
  //             _dio.options.baseUrl,
  //             Config.api_url,
  //           ))));

  //   return result;
  // }

  @override
  Future<Response> updateUnit(String path,
      {FormData? formData,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: formData,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> updateUnitWithoutImage(String path,
      {FormData? formData,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'POST',
      headers: headers,
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: formData,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  @override
  Future<Response> postApiSendMessage(String path,
      {File? image,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? dataApi,
      Options? options,
      Map<String, dynamic>? extra}) async {
    final data = FormData();

    if (image != null) {
      data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(
          image.path,
          filename: image.path.split(Platform.pathSeparator).last,
        ),
      ));
    }

    if (dataApi != null) {
      dataApi.forEach((key, value) {
        data.fields.add(MapEntry(key, value.toString()));
      });
    }

    final result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
      method: 'POST',
      headers: headers,
      extra: extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              path,
              queryParameters: queryParameters,
              data: data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              Config.api_url,
            ))));

    return result;
  }

  // @override
  // Future<Response> submitReport(String path,
  //     {SubmitComplainRequest? formData,
  //     Map<String, dynamic>? headers,
  //     Map<String, dynamic>? queryParameters,
  //     Options? options}) async {
  //   final form = await formData!.toFormData();
  //   final result = await _dio
  //       .fetch<Map<String, dynamic>?>(_setStreamType<Response<dynamic>>(Options(
  //     method: 'POST',
  //     headers: headers,
  //     contentType: 'multipart/form-data',
  //   )
  //           .compose(
  //             _dio.options,
  //             path,
  //             queryParameters: queryParameters,
  //             data: form,
  //           )
  //           .copyWith(
  //               baseUrl: _combineBaseUrls(
  //             _dio.options.baseUrl,
  //             Config.api_url,
  //           ))));

  //   return result;
  // }



}

enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
}

class Config {
  static Flavor? appFlavor;

  static String get api_url {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'https://rest-fort.org/api';
      case Flavor.DEVELOPMENT:
        return 'https://flutterlaravelteam.com/public/api';
      default:
        return 'https://flutterlaravelteam.com/public/api';
    }
  }
}
