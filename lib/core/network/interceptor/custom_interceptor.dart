// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../../config/app_constants.dart';
import '../../services/shared_preference_manager.dart';

class CustomInterceptor implements Interceptor {
  final Dio dio;
  int maxRetries = 0;

  CustomInterceptor({
    required this.dio,
  });

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (shouldRetry(err) && maxRetries < 3) {
      maxRetries += 1;
      try {
        final response = await dio.request(
          err.requestOptions.path,
          queryParameters: err.requestOptions.queryParameters,
          options: Options(
            method: err.requestOptions.method,
            headers: err.requestOptions.headers,
            extra: err.requestOptions.extra,
            contentType: err.requestOptions.contentType,
          ),
        );
        handler.resolve(
            response); // Retry muvaffaqiyatli bo‘lsa, response qaytariladi
      } catch (e) {
        handler.next(
            err); // Agar retry ham muvaffaqiyatsiz bo‘lsa, oldingi error qaytariladi
      }
    } else {
      maxRetries = 0;
      handler.reject(err); // Errorni to‘g‘ridan-to‘g‘ri qaytarish
    }

    // if (err.type == DioExceptionType.badResponse &&
    //     (err.response?.statusCode == 403 || err.response?.statusCode == 401)) {
    //   SharedPreferenceManager.deleteString(AppSharedKeys().accessToken);
    //   await _refreshToken(err.requestOptions.baseUrl);
    //   if (SharedPreferenceManager.getString(AppSharedKeys().accessToken)
    //       .replaceAll('Bearer', '')
    //       .trim()
    //       .isNotEmpty) {
    //     err.requestOptions.headers['Authorization'] =
    //         SharedPreferenceManager.getString(AppSharedKeys().accessToken);
    //   }

    //   final response = await _resolveResponse(err.requestOptions);
    //   handler.resolve(response);
    //   return;
    // }
  }

  bool shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (SharedPreferenceManager.getString(AppSharedKeys().accessToken,
            defValue: '')
        .isNotEmpty) {
      options.headers['Authorization'] =
          'Bearer ${SharedPreferenceManager.getString(AppSharedKeys().accessToken)}';
    } else {
      options.headers.remove('Authorization');
    }
    options.headers['Accept-Language'] = SharedPreferenceManager.getString(
        AppConstants.language,
        defValue: 'uz');
    options.headers['accept'] = 'application/json';
    handler.next(options);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
    maxRetries = 0;
    // if (response.statusCode == 403 || response.statusCode == 401) {
    //   if (SharedPreferenceManager.getString(AppSharedKeys().refreshToken)
    //       .isEmpty) {
    //     handler.next(response);
    //     return;
    //   }
    //   await _refreshToken(response.requestOptions.baseUrl);
    //   if (SharedPreferenceManager.getString(AppSharedKeys().accessToken)
    //       .replaceAll('Bearer', '')
    //       .trim()
    //       .isNotEmpty) {
    //     response.requestOptions.headers['Authorization'] =
    //         SharedPreferenceManager.getString(AppSharedKeys().accessToken);
    //   }
    //   final resolved = await _resolveResponse(response.requestOptions);
    //   handler.resolve(resolved);
    //   return;
    // }
  }

  // ignore: unused_element
  Future<void> _refreshToken(String baseUrl) async {
    if (SharedPreferenceManager.getString(AppSharedKeys().refreshToken)
        .isNotEmpty) {
      final response = await dio.post('$baseUrl/users/TokenRefresh/', data: {
        "refresh":
            SharedPreferenceManager.getString(AppSharedKeys().refreshToken)
      });
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        SharedPreferenceManager.putString(
            AppSharedKeys().accessToken, 'Bearer ${response.data['access']}');
      } else {
        SharedPreferenceManager.deleteString(AppSharedKeys().accessToken);
      }
    }
  }

  // ignore: unused_element
  Future<Response<dynamic>> _resolveResponse(RequestOptions options) async {
    final path = options.path.replaceAll(AppConstants.baseUrl, '');
    if (options.data is FormData) {
      FormData formData = FormData();
      final fields = options.data.fields as List<MapEntry<String, String>>;
      formData.fields.addAll(fields);

      for (MapEntry mapFile in options.data.files) {
        formData.files.add(MapEntry(
            mapFile.key,
            MultipartFile.fromFileSync(
                fields
                    .firstWhere(
                      (element) => element.key == 'photo_path',
                      orElse: () => const MapEntry('', ''),
                    )
                    .value,
                filename: mapFile.value.filename)));
      }
      options.data = formData;
    }
    return await dio.request(AppConstants.baseUrl + path,
        data: options.data,
        queryParameters: options.queryParameters,
        options: Options(
          headers: options.headers,
          method: options.method,
        ));
  }
}
