import 'package:dio/dio.dart';
import 'package:soand/core/config/app_constants.dart';
import 'package:soand/core/network/interceptor/custom_interceptor.dart';
import 'package:soand/core/services/shared_preference_manager.dart';

class DioSettings {
  void setBaseOptions({String? lang, String? baseUrl}) {
    _dioBaseOptions().baseUrl = baseUrl ?? AppConstants.baseUrl;
    _dioBaseOptions().headers['Authorization'] =
        SharedPreferenceManager.getString(
      AppSharedKeys().accessToken,
    );
    _dioBaseOptions().headers['Accept-Language'] = lang ?? 'en';
    _dioBaseOptions().headers['Accept'] = "application/json";
  }

  BaseOptions _dioBaseOptions({String? baseUrl}) => BaseOptions(
        baseUrl: baseUrl ?? AppConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
        sendTimeout: const Duration(milliseconds: 15000),
        followRedirects: true,
        headers: {
          'Authorization': SharedPreferenceManager.getString(
            AppSharedKeys().accessToken,
          ),
          'Accept': "application/json",
        },
        validateStatus: (status) => status != null && status <= 500,
      );

  Dio dio({String? baseurl}) {
    final Dio dio = Dio(_dioBaseOptions(baseUrl: baseurl));
    dio.interceptors
      ..add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
        requestHeader: true,
      ))
      ..add(CustomInterceptor(dio: dio));
    return dio;
  }
}
