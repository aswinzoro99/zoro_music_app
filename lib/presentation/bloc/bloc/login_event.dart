part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends BaseBlocEvent {}

class ShowPassword extends LoginEvent {}
