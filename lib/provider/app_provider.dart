import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/cupertino.dart';
import 'package:foxlearn_pos/bloc/auth/auth_bloc.dart';
import 'package:foxlearn_pos/bloc/requests/requests_bloc.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/models/code/code.dart';
import 'package:foxlearn_pos/models/invoice/invoice.dart';
import 'package:foxlearn_pos/models/notification/notification.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/models/user/user.dart';
import 'package:foxlearn_pos/services/api/api_repository_impl.dart';
import 'package:foxlearn_pos/services/api/api_result/api_result.dart';
import 'package:foxlearn_pos/services/api/network_expcepations/network_exceptions.dart';
import 'package:foxlearn_pos/services/local_data_source.dart';
import 'package:foxlearn_pos/services/shared_preferences/shared_keys.dart';
import 'package:foxlearn_pos/services/shared_preferences/shared_preferences_handler.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AppProvider extends ChangeNotifier {
  late ApiRepositoryImpl _apiRepository;
  String? _errorMessage;
  User? _user;
  List<Code> _codesList = [];
  List<Package> _normalPackages = [];
  List<Package> _offersPackages = [];
  List<Package> _fastPackages = [];
  List<NotificationModel> _todayNotifications = [];
  List<NotificationModel> _oldNotification = [];
  List<Invoice> _invoices = [];
  bool _loading = false;
  AuthBloc _authBloc;
  bool showHello = true;

  ///this bloc for handle loading when send api request
  RequestsBloc _requestsBloc;

  AppProvider(this._authBloc, this._requestsBloc) {
    _apiRepository = ApiRepositoryImpl();
    getAppData();
  }

  bool get loading => _loading;

  String? get errorMessage => _errorMessage;

  User? get user => _user;

  List<Package> get normalPackages => _normalPackages;

  List<Package> get offersPackages => _offersPackages;

  List<Code> get codesList => _codesList;

  List<NotificationModel> get oldNotification => _oldNotification;

  List<NotificationModel> get todayNotifications => _todayNotifications;

  List<Invoice> get invoices => _invoices;

  List<Package> get fastPackages => _fastPackages;

  set user(User? value) {
    _user = value;
    notifyListeners();
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  set errorMessage(String? value) {
    _errorMessage = value;
    notifyListeners();
  }

  set normalPackages(List<Package> value) {
    _normalPackages = value;
    notifyListeners();
  }

  set offersPackages(List<Package> value) {
    _offersPackages = value;
    notifyListeners();
  }

  set codesList(List<Code> value) {
    _codesList = value;
    notifyListeners();
  }

  set oldNotification(List<NotificationModel> value) {
    _oldNotification = value;
    notifyListeners();
  }

  set todayNotifications(List<NotificationModel> value) {
    _todayNotifications = value;
    notifyListeners();
  }

  set invoices(List<Invoice> value) {
    _invoices = value;
    notifyListeners();
  }

  set fastPackages(List<Package> value) {
    _fastPackages = value;
    notifyListeners();
  }

  _setFastGeneratePackage() {
    if (_codesList.isNotEmpty) {
      final List<Package> allPackages = [];
      allPackages.addAll(_offersPackages);
      allPackages.addAll(_normalPackages);
      List<Package> packages = [];
      int i = 0;
      while (packages.length != 10 && i != codesList.length) {
          final packageId = _codesList[i].packagesIds!.first;
          final package = allPackages
              .singleWhereOrNull((element) => element.id == packageId);
          if (package != null) {
            packages.add(package);
          }
        }
        _fastPackages = List.from(packages);
        i++;

      
    }
  }

  changeShowHello(bool value) {
    showHello = value;
    notifyListeners();
  }

  getAppData() async {
    errorMessage = null;
    loading = true;
    bool? canLogin;
    final user = await LocalDataSource.getUserFromShared();

    final ApiResult<bool?> checkSecurityStampResult =
        await checkSecurityStamp(user);

    checkSecurityStampResult.when(
      success: (bool? canLoginResult) {
        ///If SecurityStamp changed user can't login to app
        canLogin = canLoginResult;
      },
      failure: (NetworkExceptions networkExceptions) {
        ///Error message for network [NetworkExceptions] when try to checkSecurityStampResult
        errorMessage = NetworkExceptions.getErrorMessage(networkExceptions);
      },
    );

    if (errorMessage != null) {
      loading = false;
      return;
    } else if (!canLogin!) {
      ///Force logout from app if SecurityStamp changed
      _forceLogout();
      return;
    }
    final List<ApiResult> result = await Future.wait(
      [
        getUserInfo(user.id), //0
        getCodes(user.id), //1
        getPackages(), //2
        getNotifications(user.id), //3
        getInvoices(user.id), //4
      ],
    );

    /// If any response have an error return from getData and stop loading
    /// [errorMessage] will show the error message in [FailureScreen]
    for (ApiResult apiResult in result) {
      apiResult.maybeWhen(
        orElse: () {},
        failure: (NetworkExceptions networkExceptions) {
          errorMessage = NetworkExceptions.getErrorMessage(networkExceptions);
        },
      );
      if (_errorMessage != null) {
        loading = false;
        return;
      }
    }

    handleUserApiResult(result[0] as ApiResult<User>);
    handleCodesApiResult(result[1] as ApiResult<List<Code>>);
    handlePackageApiResult(result[2] as ApiResult<List<Package>>);
    handleNotificationsApiResult(
        result[3] as ApiResult<List<List<NotificationModel>>>);
    handleInvoicesApiResult(result[4] as ApiResult<List<Invoice>>);
    _setFastGeneratePackage();

    loading = false;
  }

  Future<ApiResult<User>> getUserInfo(int? userId) async {
    ApiResult<User> apiResult = await _apiRepository.getUser(userId);
    return apiResult;
  }

  Future<ApiResult<List<Code>>> getCodes(int? posId) async {
    ApiResult<List<Code>> apiResult = await _apiRepository.getPosCodes(posId);
    return apiResult;
  }

  ///Type [0] for normal packages and type [1] is for offers packages
  Future<ApiResult<List<Package>>> getPackages() async {
    ApiResult<List<Package>> apiResult = await _apiRepository.getPackages();
    return apiResult;
  }

  Future<ApiResult<bool?>> checkSecurityStamp(User user) async {
    return ApiResult.success(data: true);

    final token =
        await (SharedPreferencesHandler.getString(key: SharedKeys.TOKEN));
    final username = user.userName;
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    final securityStamp = decodedToken['securityStamp'];
    final ApiResult<bool?> apiResult =
        await _apiRepository.checkSecurityStamp(username, securityStamp);
    return apiResult;
  }

  Future<ApiResult<List<List<NotificationModel>>>> getNotifications(
      int? userId) async {
    ApiResult<List<List<NotificationModel>>> apiResult =
        await _apiRepository.getNotifications();
    return apiResult;
  }

  Future<ApiResult<List<Invoice>>> getInvoices(int? userId) async {
    ApiResult<List<Invoice>> apiResult =
        await _apiRepository.getPosInvoices(userId);
    return apiResult;
  }

  handleUserApiResult(ApiResult<User> apiResult) {
    apiResult.maybeWhen(
      orElse: () {},
      success: (User user) {
        this.user = user;
      },
    );
  }

  handleCodesApiResult(ApiResult<List<Code>> apiResult) {
    apiResult.maybeWhen(
      orElse: () {},
      success: (List<Code> codes) {
        codesList = codes;
      },
    );
  }

  ///Type [0] for normal packages and type [1] is for offers packages
  handlePackageApiResult(ApiResult<List<Package>> apiResult) {
    apiResult.maybeWhen(
      orElse: () {},
      success: (List<Package> packagesData) {
        normalPackages = packagesData;
      },
    );
  }

  handleNotificationsApiResult(
      ApiResult<List<List<NotificationModel>>> apiResult) {
    apiResult.maybeWhen(
      orElse: () {},
      success: (List<List<NotificationModel>> notifications) {
        todayNotifications = notifications[0];
        oldNotification = notifications[1];
      },
    );
  }

  handleInvoicesApiResult(ApiResult<List<Invoice>> apiResult) {
    apiResult.maybeWhen(
      orElse: () {},
      success: (List<Invoice> invoicesData) {
        invoices = invoicesData;
      },
    );
  }

  removeCode(Code code) async {
    _requestsBloc.add(LoadingEvent(AppStrings.DELETING_CODE_IN_PROGRESS));
    ApiResult<bool?> apiResult = await _apiRepository.removeCode(code.id);
    apiResult.when(success: (bool? success) {
      _requestsBloc.add((SuccessEvent(AppStrings.DELETING_CODE_SUCCESS)));
      removeCodeFromList(code);
    }, failure: (NetworkExceptions networkExceptions) {
      _requestsBloc.add(
          FailureEvent(NetworkExceptions.getErrorMessage(networkExceptions)));
    });
  }

  _forceLogout() {
    ///logout using [_authBloc]
    _authBloc.add(LogoutEvent());

    /// this event will show error message"
    _authBloc.add(SecurityStampErrorEvent());
  }

  void insertCode(Code code) {
    _codesList.insert(0, code);
    notifyListeners();
  }

  void removeCodeFromList(Code code) {
    _codesList.remove(code);
    codesList = _codesList;
  }
}
