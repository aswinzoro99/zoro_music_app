part of 'login_bloc.dart';

class LoginState extends BaseBlocState {
  final bool showPassword;

  @override
  List<Object?> get props => [showPassword];

  const LoginState({this.showPassword = false});
}
