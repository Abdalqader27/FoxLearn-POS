part of 'requests_bloc.dart';

@immutable
abstract class RequestsEvent {}

class LoadingEvent extends RequestsEvent {
  final String loadingMessage;

  LoadingEvent(this.loadingMessage);
}

class FailureEvent extends RequestsEvent {
  final String errorMessage;

  FailureEvent(this.errorMessage);
}

class SuccessEvent extends RequestsEvent {
  final String successMessage;
  SuccessEvent(this.successMessage);
}

class SuccessWithResultEvent extends RequestsEvent {
  final Widget successScreen;
  SuccessWithResultEvent(this.successScreen);
}
