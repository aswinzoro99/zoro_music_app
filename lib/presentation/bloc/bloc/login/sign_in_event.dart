part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent extends BaseBlocEvent {}

class ShowPassword extends SignInEvent {}

class OnSignInEvent extends SignInEvent {}
