import 'package:flutter/cupertino.dart';
import 'package:foxlearn_pos/bloc/requests/requests_bloc.dart';
import 'package:foxlearn_pos/const/strings.dart';
import 'package:foxlearn_pos/models/code/code.dart';
import 'package:foxlearn_pos/models/package/package.dart';
import 'package:foxlearn_pos/models/package/package_type.dart';
import 'package:foxlearn_pos/models/user/user.dart';
import 'package:foxlearn_pos/services/api/api_repository_impl.dart';
import 'package:foxlearn_pos/services/api/api_result/api_result.dart';
import 'package:foxlearn_pos/services/api/network_expcepations/network_exceptions.dart';
import 'package:foxlearn_pos/services/local_data_source.dart';
import 'package:foxlearn_pos/ui/qr_code_screen.dart';

class GenerateCodeProvider extends ChangeNotifier {
  Package? _selectedNormalPackage;
  Package? _selectedOfferPackage;
  String _discountNormal = '';
  String _discountOffer = '';
  late User _user;
  String? _totalNormal;
  String? _totalOffer;
  String? _generatedCode;
  RequestsBloc _requestsBloc;

  late ApiRepositoryImpl _apiRepository;

  GenerateCodeProvider(
      this._selectedNormalPackage, this._selectedOfferPackage, this._requestsBloc) {
    _apiRepository = ApiRepositoryImpl();
    getUser();
  }

  getUser() async {
    _user = await LocalDataSource.getUserFromShared();
  }

  Package? get selectedNormalPackage => _selectedNormalPackage;

  Package? get selectedOfferPackage => _selectedOfferPackage;

  String get discountNormal => _discountNormal;

  String get discountOffer => _discountOffer;

  String? get totalNormal => _totalNormal;

  String? get totalOffer => _totalOffer;

  String? get generatedCode => _generatedCode;

  set selectedNormalPackage(Package? value) {
    _selectedNormalPackage = value;
    notifyListeners();
  }

  set selectedOfferPackage(Package? value) {
    _selectedOfferPackage = value;
    notifyListeners();
  }

  set discountNormal(String value) {
    _discountNormal = value;
    notifyListeners();
  }

  set discountOffer(String value) {
    _discountOffer = value;
    notifyListeners();
  }

  set totalOffer(String? value) {
    _totalNormal = value;
    notifyListeners();
  }

  set totalNormal(String? value) {
    _totalNormal = value;
    notifyListeners();
  }

  set generatedCode(String? value) {
    _generatedCode = value;
    notifyListeners();
  }

  onChangeCount(String value, int packageType) {
    if (packageType == PackageType.OFFER)
      discountOffer = value;
    else
      discountNormal = value;
  }

  Package? getSelectedPackage(int type) {
    if (type == PackageType.OFFER) return _selectedOfferPackage;
    return _selectedNormalPackage;
  }

  String getDiscount(int type) {
    if (type == PackageType.OFFER) return _discountOffer;
    return _discountNormal;
  }

  String getDiscountedValue(int type) {
    if (type == PackageType.OFFER) {
      final price = selectedOfferPackage!.price!;
      final discount = double.parse(discountOffer);
      return (price - (price * (discount / 100))).toInt().toString();
    }
    final price = selectedNormalPackage!.price!;
    final discount = double.parse(discountNormal);
    return (price - (price * (discount / 100))).toInt().toString();
  }

  selectPackage(int type, Package package) {
    if (type == PackageType.OFFER)
      selectedOfferPackage = package;
    else
      selectedNormalPackage = package;
  }

  Future<Code?> generateCode(int type) async {
    _requestsBloc.add(LoadingEvent(AppStrings.GENERATING_CODE));

    Package? selectedPackage = _selectedNormalPackage;

    String discount = _discountNormal;

    if (type == PackageType.OFFER) {
      selectedPackage = _selectedOfferPackage;
      discount = _discountOffer;
    }

    ApiResult<Code> apiResult = await _apiRepository.generateCode(
        _user.id, selectedPackage!.id, discount.isNotEmpty ? double.parse(discount) : 0.0);

    Code? code;

    apiResult.when(success: (Code codeData) {
      _requestsBloc.add(
        SuccessWithResultEvent(
          QRCodeScreen(
            code: codeData.code,
          ),
        ),
      );
      code = codeData;
    }, failure: (NetworkExceptions networkExceptions) {
      _requestsBloc.add(FailureEvent(NetworkExceptions.getErrorMessage(networkExceptions)));
    });

    return code;
  }
}
