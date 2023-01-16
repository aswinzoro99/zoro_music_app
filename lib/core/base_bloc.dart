import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_event.dart';

abstract class BaseBloc<E extends BaseBlocEvent, S> extends Bloc<E, S> {
  BaseBloc(initialState) : super(initialState) {
    on<E>((event, emit) async {
      if (event is Reset) {
        return emit(initialState);
      }

      try {
        await handleEvent(event, emit);
      } on ServiceException catch (e) {
        handleError(emit, e.errorMsg, e.code);
      }
    });
  }

  Future<void> handleEvent(E event, Emitter<S> emit);

  Future<void> handleError(
      Emitter<S> emit,
      String errorMsg,
      String errorCode, {
        bool invalidSession = false,
      });

}

class ServiceException implements Exception {
  final String errorMsg;
  final String code;

  const ServiceException({required this.errorMsg, this.code = ''});
}

