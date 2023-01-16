import 'package:equatable/equatable.dart';

import 'error_type.dart';

abstract class BaseBlocState extends Equatable {
  final ErrorType errorType;
  final String errorMsg;
  final String errorCode;
  final bool invalidSession;

  @override
  List<Object?> get props => [errorType, errorMsg, errorCode, invalidSession];

  const BaseBlocState({
    this.errorType = ErrorType.error,
    this.errorMsg = '',
    this.errorCode = '',
    this.invalidSession = false,
  });
}