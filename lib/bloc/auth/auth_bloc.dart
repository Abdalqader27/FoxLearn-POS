import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/models/user/user.dart';
import 'package:foxlearn_pos/services/api/api_repository_impl.dart';
import 'package:foxlearn_pos/services/api/api_result/api_result.dart';
import 'package:foxlearn_pos/services/api/network_expcepations/network_exceptions.dart';
import 'package:foxlearn_pos/services/shared_preferences/shared_keys.dart';
import 'package:foxlearn_pos/services/shared_preferences/shared_preferences_handler.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  ApiRepositoryImpl apiRepository;

  AuthBloc()
      : apiRepository = ApiRepositoryImpl(),
        super(CheckingAuth());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginEvent) {
      yield* _tryLogin(event);
    } else if (event is SecurityStampErrorEvent) {
      yield SecurityStampError(errorMessage: AppStrings.SECURITY_STAMP_ERROR);
    } else if (event is CheckAuthEvent) {
      yield* _checkAuth();
    } else if (event is LogoutEvent) {
      SharedPreferencesHandler.clearShared();
      yield LoggedOutState();
    }
  }

  Stream<AuthState> _checkAuth() async* {
    final token =
        await SharedPreferencesHandler.getString(key: SharedKeys.TOKEN);
    if (token != null) {
      final user = await SharedPreferencesHandler.getString(
          key: SharedKeys.USER_DATA_KEY);
      if (user == null) yield LoggedOutState();
      yield LoginSuccess(user: User.fromJson(json.decode(user.toString())));
    } else
      yield LoggedOutState();
  }

  Stream<AuthState> _tryLogin(LoginEvent event) async* {
    yield LoadingState(message: 'جاري الاتصال بالخادم..');
    ApiResult<User> apiResult =
        await apiRepository.login(event.userName, event.password);

    yield* apiResult.when(
      success: (User user) async* {
        yield LoginSuccess(user: user);

        ///set login token
        SharedPreferencesHandler.set(value: user.token, key: SharedKeys.TOKEN);

        ///save user
        SharedPreferencesHandler.set(
            key: SharedKeys.USER_DATA_KEY, value: jsonEncode(user.toJson()));
      },
      failure: (NetworkExceptions error) async* {
        yield LoginError(networkExceptions: error);
      },
    );
  }
}
