import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:email_validator/email_validator.dart';

import '../../../../core/base_bloc.dart';
import '../../../../core/base_event.dart';
import '../../../../core/base_state.dart';
import '../../../../core/error_type.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends BaseBloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState());

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Future<void> handleError(
      Emitter<SignInState> emit, String errorMsg, String errorCode,
      {bool invalidSession = false}) {
    // TODO: implement handleError
    throw UnimplementedError();
  }

  @override
  Future<void> handleEvent(SignInEvent event, Emitter<SignInState> emit) async {
    if (event is ShowPassword) {
      return _handleShowPassword(event, emit);
    } else if (event is OnSignInEvent) {
      return _handleSignInEvent(event, emit);
    }
  }

  Future<void> _handleShowPassword(
    ShowPassword event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future<void> _handleSignInEvent(
    OnSignInEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.initial));

    if (usernameController.text.isEmpty) {
      emit(
        state.copyWith(
          errorMsg: 'Please enter a valid email',
          status: SignInStatus.userInputError,
        ),
      );

      return;
    }
    if (EmailValidator.validate(usernameController.text)) {
      emit(
        state.copyWith(
          errorMsg: 'Please enter a valid email',
          status: SignInStatus.userInputError,
        ),
      );

      return;
    }
    if (passwordController.text.isEmpty) {
      emit(
        state.copyWith(
          errorMsg: 'Please enter a valid password',
          status: SignInStatus.userInputError,
        ),
      );

      return;
    }
  }
}
