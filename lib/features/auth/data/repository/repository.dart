// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:soand/core/either/either.dart';
import 'package:soand/core/error/error_handler.dart';
import 'package:soand/core/error/failure_handler.dart';
import 'package:soand/features/auth/data/data_source/data_source.dart';
import 'package:soand/features/auth/data/model/login_model.dart';
import 'package:soand/features/auth/data/model/register.dart';
import 'package:soand/features/auth/domain/repository/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, String>> register(RegisterModel model) async {
    try {
      final result = await authDataSource.register(model);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    } on DioException catch (e) {
      return Left(DioFailure(errorMessage: e.message ?? "Dio Error"));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> userName(String userName) async {
    try {
      final result = await authDataSource.userName(userName);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    } on DioException catch (e) {
      return Left(DioFailure(errorMessage: e.message ?? "Dio Error"));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> login(LoginModel model) async {
    try {
      final result = await authDataSource.login(model);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(errorMessage: e.errorMessage, statusCode: e.statusCode),
      );
    } on DioException catch (e) {
      return Left(DioFailure(errorMessage: e.message ?? "Dio Error"));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    }
  }
}
