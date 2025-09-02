// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final RegisterModel model;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;
  const RegisterEvent({
    required this.model,
    required this.onSuccess,
    required this.onFailure,
  });
}

class IslocadingEvent extends AuthEvent {
  final bool isLoading;
  const IslocadingEvent({this.isLoading = false});
}

class CreateUserNameEvent extends AuthEvent {
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;
  final String username;
  const CreateUserNameEvent({
    required this.onSuccess,
    required this.onFailure,
    this.username = '',
  });
}

class LoginEvent extends AuthEvent {
  final String name;
  final String password;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;
  const LoginEvent({
    this.name = '',
    this.password = '',
    required this.onSuccess,
    required this.onFailure,
  });
}
