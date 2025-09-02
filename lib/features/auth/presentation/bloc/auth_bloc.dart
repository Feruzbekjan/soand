import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soand/core/config/app_constants.dart';
import 'package:soand/core/services/log.dart';
import 'package:soand/core/services/service_locator.dart';
import 'package:soand/features/auth/data/model/login_model.dart';
import 'package:soand/features/auth/data/model/register.dart';
import 'package:soand/features/auth/data/repository/repository.dart';
import 'package:soand/features/auth/domain/usecase/register_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final registerUseCase = RegisterUseCase(
    authRepository: serviceLocator<AuthRepositoryImpl>(),
  );

  AuthBloc() : super(const AuthState()) {
    on<RegisterEvent>(_registerEvent);
    on<IslocadingEvent>(_islocadingEvent);
    on<CreateUserNameEvent>(_createUserNameEvent);
    on<LoginEvent>(_loginEvent);
  }

  Future<void> _loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    final either = await registerUseCase.call(
      LoginParam(
        model: LoginModel(username: event.name, password: event.password),
      ),
    );
    either.either(
      (failure) {
        event.onFailure(failure.errorMessage);
      },
      (value) async {
        event.onSuccess();
        final shared = serviceLocator<SharedPreferences>();
        await shared.setString(AppSharedKeys().accessToken, value);
      },
    );
  }

  Future<void> _createUserNameEvent(
    CreateUserNameEvent event,
    Emitter<AuthState> emit,
  ) async {
    final either = await registerUseCase.call(
      UserNameParam(userName: event.username),
    );
    either.either(
      (failure) {
        event.onFailure(failure.errorMessage);
      },
      (value) async {
        event.onSuccess();
      },
    );
  }

  Future<void> _islocadingEvent(
    IslocadingEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  Future<void> _registerEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    final either = await registerUseCase.call(
      RegisterUsecaseParam(model: event.model),
    );
    either.either(
      (failure) {
        LogService.e(failure.errorMessage);
        event.onFailure(failure.errorMessage);
      },
      (value) async {
        LogService.e("Success $value");
        event.onSuccess();
        final shared = serviceLocator<SharedPreferences>();
        await shared.setString(AppSharedKeys().accessToken, value);
      },
    );
  }
}
