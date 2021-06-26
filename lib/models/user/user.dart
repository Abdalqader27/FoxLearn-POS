/// id : 2
/// type : 2
/// rate : 0
/// name : "PosGL7A8C"
/// userName : "PosYmD9h"
/// email : "SWMY0C9ER@gmail.com"
/// phone : null
/// posAddress : "I68TWIF0GVMIZ"
/// role : "Pos"
/// token : null
/// refreshToken : null
/// dateBlocked : null
/// dob : "0001-01-01T00:00:00+00:00"
/// subscriptionsCount : 0
/// moneyLimit : 9946000
/// subjectIds : null
/// discountAvailable : true
/// count : 7
/// netProfit : 10440
/// receivedCodes : 7
/// lag : "37.123412857055655"
/// lat : "36.22438096443224"

class User {
  dynamic? _id;
  dynamic? _type;
  dynamic? _rate;
  dynamic? _name;
  dynamic? _userName;
  dynamic? _email;
  dynamic? _phone;
  dynamic? _posAddress;
  dynamic? _role;
  dynamic? _token;
  dynamic? _refreshToken;
  dynamic? _dateBlocked;
  dynamic? _dob;
  dynamic? _subscriptionsCount;
  dynamic? _moneyLimit;
  dynamic? _subjectIds;
  dynamic? _discountAvailable;
  dynamic? _count;
  dynamic? _netProfit;
  dynamic? _receivedCodes;
  dynamic? _lag;
  dynamic? _lat;

  dynamic? get id => _id;
  dynamic? get type => _type;
  dynamic? get rate => _rate;
  dynamic? get name => _name;
  dynamic? get userName => _userName;
  dynamic? get email => _email;
  dynamic? get phone => _phone;
  dynamic? get posAddress => _posAddress;
  dynamic? get role => _role;
  dynamic? get token => _token;
  dynamic? get refreshToken => _refreshToken;
  dynamic? get dateBlocked => _dateBlocked;
  dynamic? get dob => _dob;
  dynamic? get subscriptionsCount => _subscriptionsCount;
  dynamic? get moneyLimit => _moneyLimit;
  dynamic? get subjectIds => _subjectIds;
  dynamic? get discountAvailable => _discountAvailable;
  dynamic? get count => _count;
  dynamic? get netProfit => _netProfit;
  dynamic? get receivedCodes => _receivedCodes;
  dynamic? get lag => _lag;
  dynamic? get lat => _lat;

  User({
    dynamic? id,
    dynamic? type,
    dynamic? rate,
    dynamic? name,
    dynamic? userName,
    dynamic? email,
      dynamic? phone,
    dynamic? posAddress,
    dynamic? role,
      dynamic? token, 
      dynamic? refreshToken, 
      dynamic? dateBlocked,
    dynamic? dob,
    dynamic? subscriptionsCount,
    dynamic? moneyLimit,
      dynamic? subjectIds,
    dynamic? discountAvailable,
    dynamic? count,
    dynamic? netProfit,
    dynamic? receivedCodes,
    dynamic? lag,
    dynamic? lat}){
    _id = id;
    _type = type;
    _rate = rate;
    _name = name;
    _userName = userName;
    _email = email;
    _phone = phone;
    _posAddress = posAddress;
    _role = role;
    _token = token;
    _refreshToken = refreshToken;
    _dateBlocked = dateBlocked;
    _dob = dob;
    _subscriptionsCount = subscriptionsCount;
    _moneyLimit = moneyLimit;
    _subjectIds = subjectIds;
    _discountAvailable = discountAvailable;
    _count = count;
    _netProfit = netProfit;
    _receivedCodes = receivedCodes;
    _lag = lag;
    _lat = lat;
}

  User.fromJson(dynamic json) {
    _id = json["id"];
    _type = json["type"];
    _rate = json["rate"];
    _name = json["name"];
    _userName = json["userName"];
    _email = json["email"];
    _phone = json["phone"];
    _posAddress = json["posAddress"];
    _role = json["role"];
    _token = json["token"];
    _refreshToken = json["refreshToken"];
    _dateBlocked = json["dateBlocked"];
    _dob = json["dob"];
    _subscriptionsCount = json["subscriptionsCount"];
    _moneyLimit = json["moneyLimit"];
    _subjectIds = json["subjectIds"];
    _discountAvailable = json["discountAvailable"];
    _count = json["count"];
    _netProfit = json["netProfit"];
    _receivedCodes = json["receivedCodes"];
    _lag = json["lag"];
    _lat = json["lat"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["type"] = _type;
    map["rate"] = _rate;
    map["name"] = _name;
    map["userName"] = _userName;
    map["email"] = _email;
    map["phone"] = _phone;
    map["posAddress"] = _posAddress;
    map["role"] = _role;
    map["token"] = _token;
    map["refreshToken"] = _refreshToken;
    map["dateBlocked"] = _dateBlocked;
    map["dob"] = _dob;
    map["subscriptionsCount"] = _subscriptionsCount;
    map["moneyLimit"] = _moneyLimit;
    map["subjectIds"] = _subjectIds;
    map["discountAvailable"] = _discountAvailable;
    map["count"] = _count;
    map["netProfit"] = _netProfit;
    map["receivedCodes"] = _receivedCodes;
    map["lag"] = _lag;
    map["lat"] = _lat;
    return map;
  }

}