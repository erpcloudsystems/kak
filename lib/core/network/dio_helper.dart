import 'dart:developer';

import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';

import 'exceptions.dart';
import 'api_constance.dart';
import '../global/global_varibles.dart';
import '../resources/values_manager.dart';

abstract class BaseDioHelper {
  Future<dynamic> post({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    Duration? timeOut,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
    bool useCookies = false,
  });

  Future<dynamic> get({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    Duration? timeOut,
    String? base,
    String? token,
    dynamic data,
    dynamic query,
    // We use this condition because Cookies won't be needed in signing and outer
    // calls like maps.
    bool useCookies = true,
  });
}

class DioHelper implements BaseDioHelper {
  final globalVariable = GlobalVariables();
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstance.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: IntManager.i_30),
    ),
  );

  final cookieJar = CookieJar(ignoreExpires: true);

  DioHelper() {
    dio.interceptors.add(CookieManager(cookieJar));
  }

  @override
  Future get({
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    String? base,
    data,
    Duration? timeOut,
    String? token,
    query,
    bool useCookies = true,
  }) async {
    if (base != null) {
      dio.options.baseUrl = base;
    }

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultiPart) 'Content-Type': 'multipart/form-data',
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      if (token != null) 'token': token,
      if (useCookies) 'Cookie': 'sid=${globalVariable.getSid}'
    };

    log('URL => ${dio.options.baseUrl + endPoint}');
    log('Header => ${dio.options.headers.toString()}');
    log('Body => $data');
    log('Query => $query');

    return await request(
        call: () async => await dio.get(
              endPoint,
              cancelToken: cancelToken,
              queryParameters: query,
            ));
  }

  @override
  Future post({
    ProgressCallback? progressCallback,
    required String endPoint,
    CancelToken? cancelToken,
    bool isMultiPart = false,
    bool useCookies = true,
    Duration? timeOut,
    String? base,
    String? token,
    data,
    query,
  }) async {
    if (base != null) {
      dio.options.baseUrl = base;
    }

    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultiPart) 'Content-Type': 'multipart/form-data',
      if (!isMultiPart) 'Content-Type': 'application/json',
      if (!isMultiPart) 'Accept': 'application/json',
      if (token != null) 'token': token,
      if (useCookies) 'Cookie': 'sid=${globalVariable.getSid}'
    };

    log('URL => ${dio.options.baseUrl + endPoint}');
    log('Header => ${dio.options.headers.toString()}');
    log('Body => $data');
    log('Query => $query');

    return await request(
        call: () async => await dio.post(
              endPoint,
              data: data,
              queryParameters: query,
              onSendProgress: progressCallback,
              cancelToken: cancelToken,
            ));
  }
}

extension on BaseDioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    try {
      final r = await call.call();
      log('Response_Code => ${r.statusCode}');
      log('Response_Data => ${r.data}');

      return r;
    } on DioException catch (e) {
      log('Status_Code => ${e.response!.statusCode}');
      log('Error_Message => ${e.message}');
      log('Error_Error => ${e.error.toString()}');
      log('Error_Type => ${e.type.toString()}');

      throw PrimaryServerException(
        code: e.response?.statusCode ?? 100,
        error: e.error.toString(),
        message: e.response!.data['exception'] ??
            e.response!.data['message'].toString() ??
            e.message,
      );
    } catch (e) {
      PrimaryServerException exception = e as PrimaryServerException;

      throw PrimaryServerException(
        error: exception.error,
        code: exception.code,
        message: exception.message,
      );
    }
  }
}
