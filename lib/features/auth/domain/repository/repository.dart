import 'package:soand/core/either/either.dart';
import 'package:soand/core/error/failure_handler.dart';
import 'package:soand/features/auth/data/model/login_model.dart';
import 'package:soand/features/auth/data/model/register.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> register(RegisterModel model);
  Future<Either<Failure, String>> login(LoginModel model);
  Future<Either<Failure, String>> userName(String userName);
}