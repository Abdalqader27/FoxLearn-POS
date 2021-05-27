import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'requests_event.dart';

part 'requests_state.dart';

/// Good Job this class is already order
class RequestsBloc extends Bloc<RequestsEvent, RequestsState> {
  RequestsBloc() : super(RequestsIdle());

  @override
  Stream<RequestsState> mapEventToState(RequestsEvent event) async* {
    if (event is LoadingEvent)
      yield LoadingState(event.loadingMessage);
    else if (event is SuccessEvent)
      yield SuccessState(event.successMessage);
    else if (event is FailureEvent)
      yield FailureState(event.errorMessage);
    else if (event is SuccessWithResultEvent)
      yield SuccessWithResultState(event.successScreen);
  }
}
