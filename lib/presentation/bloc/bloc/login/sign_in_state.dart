part of 'sign_in_bloc.dart';

class SignInState extends BaseBlocState {
  final bool showPassword;
  final String msg;
  final SignInStatus status;

  @override
  List<Object?> get props => [
        showPassword,
        msg,
        status,
        errorMsg,
        errorCode,
        invalidSession,
      ];

  const SignInState({
    this.showPassword = true,
    this.msg = '',
    this.status = SignInStatus.initial,
    ErrorType errorType = ErrorType.error,
    String errorMsg = '',
    String errorCode = '',
    bool invalidSession = false,
  }) : super(
          errorType: errorType,
          errorMsg: errorMsg,
          errorCode: errorCode,
          invalidSession: invalidSession,
        );

  SignInState copyWith({
    bool? showPassword,
    String? msg,
    SignInStatus? status,
    ErrorType? errorType,
    String? errorMsg,
    String? errorCode,
    bool? invalidSession,
  }) {
    return SignInState(
      showPassword: showPassword ?? this.showPassword,
      msg: msg ?? this.msg,
      status: status ?? this.status,
      errorType: errorType ?? this.errorType,
      errorMsg: errorMsg ?? this.errorMsg,
      errorCode: errorCode ?? this.errorCode,
      invalidSession: invalidSession ?? this.invalidSession,
    );
  }
}

enum SignInStatus {
  initial,
  userInputError,
  done,
  loading,
}
