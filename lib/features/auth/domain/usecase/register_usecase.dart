// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:soand/core/either/either.dart';
import 'package:soand/core/error/failure_handler.dart';
import 'package:soand/core/usecase/usecase.dart';
import 'package:soand/features/auth/data/model/login_model.dart';
import 'package:soand/features/auth/data/model/register.dart';
import 'package:soand/features/auth/domain/repository/repository.dart';

class RegisterUseCase implements UseCase<String, NoParams> {
  final AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(NoParams param) async {
    if (param is RegisterUsecaseParam) {
      return await authRepository.register(param.model);
    } else if (param is UserNameParam) {
      return authRepository.userName(param.userName);
    } else if (param is LoginParam) {
      return authRepository.login(param.model);
    }
    throw UnimplementedError();
  }
}

class RegisterUsecaseParam extends NoParams {
  final RegisterModel model;
  RegisterUsecaseParam({required this.model});
}

class UserNameParam extends NoParams {
  final String userName;
  UserNameParam({this.userName = ''});
}

class LoginParam extends NoParams {
  final LoginModel model;
  LoginParam({required this.model});
}
