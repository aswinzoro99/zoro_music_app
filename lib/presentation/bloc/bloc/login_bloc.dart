import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/base_bloc.dart';
import '../../../core/base_event.dart';
import '../../../core/base_state.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState());

  @override
  Future<void> handleError(
      Emitter<LoginState> emit, String errorMsg, String errorCode,
      {bool invalidSession = false}) {
    // TODO: implement handleError
    throw UnimplementedError();
  }

  @override
  Future<void> handleEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is ShowPassword) {
      return _handleShowPassword(event, emit);
    }
  }

  Future<void> _handleShowPassword(
    ShowPassword event,
    Emitter<LoginState> emit,
  ) async {}
}
