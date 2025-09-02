import 'package:dio/dio.dart';
import 'package:soand/core/error/error_handler.dart';
import 'package:soand/features/auth/data/model/login_model.dart';
import 'package:soand/features/auth/data/model/register.dart';

abstract class AuthDataSource {
  Future<String> register(RegisterModel model);
  Future<String> userName(String userName);
  Future<String> login(LoginModel model);
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio dio;
  AuthDataSourceImpl(this.dio);

  @override
  Future<String> register(RegisterModel model) async {
    try {
      final response = await dio.post("users/", data: model.toJson());
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data["data"];
      } else {
        var message = response.data["error"];
        message ??= response.data["error_message"];
        throw ServerException(
          statusCode: response.statusCode ?? 500,
          errorMessage: message,
        );
      }
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    } catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<String> userName(String userName) async {
    try {
      final response = await dio.patch(
        "users/username",
        data: {"new_username": userName},
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data["data"];
      } else {
        var message = response.data["error"];
        message ??= response.data["error_message"];
        throw ServerException(
          statusCode: response.statusCode ?? 500,
          errorMessage: message,
        );
      }
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    } catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }

  @override
  Future<String> login(LoginModel model) async {
    try {
      final response = await dio.post(
        "users/login",
        data: model.toJson(),
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data["data"];
      } else {
        var message = response.data["error"];
        message ??= response.data["error_message"];
        throw ServerException(
          statusCode: response.statusCode ?? 500,
          errorMessage: message,
        );
      }
    } on ServerException {
      rethrow;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    } catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
