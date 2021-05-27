part of 'requests_bloc.dart';

@immutable
abstract class RequestsState {}

class RequestsIdle extends RequestsState {}

class LoadingState extends RequestsState {
  final String loadingMassage;

  LoadingState(this.loadingMassage);
}

class SuccessState extends RequestsState {
  final String successMassage;

  SuccessState(this.successMassage);
}

class SuccessWithResultState extends RequestsState {
  final Widget successScreen;

  SuccessWithResultState(this.successScreen);
}

class FailureState extends RequestsState {
  final String failureMassage;
  FailureState(this.failureMassage);
}
