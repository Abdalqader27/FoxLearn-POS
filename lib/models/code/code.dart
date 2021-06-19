/// id : 13
/// code : "PKa0dy"
/// packagesIds : [3,2,1]
/// packagesNames : ["EHU6H","5NJKGSA","I1PO W6V"]
/// price : 48000
/// dateCreated : "2021-06-04T16:21:59.5040436Z"
/// dateActivated : "0001-01-01T00:00:00+00:00"

class Code {
  int? _id;
  String? _code;
  List<int>? _packagesIds;
  List<String>? _packagesNames;
  int? _price;
  String? _dateCreated;
  String? _dateActivated;

  int? get id => _id;
  String? get code => _code;
  List<int>? get packagesIds => _packagesIds;
  List<String>? get packagesNames => _packagesNames;
  int? get price => _price;
  String? get dateCreated => _dateCreated;
  String? get dateActivated => _dateActivated;

  Code({
      int? id, 
      String? code, 
      List<int>? packagesIds, 
      List<String>? packagesNames, 
      int? price, 
      String? dateCreated, 
      String? dateActivated}){
    _id = id;
    _code = code;
    _packagesIds = packagesIds;
    _packagesNames = packagesNames;
    _price = price;
    _dateCreated = dateCreated;
    _dateActivated = dateActivated;
}

  Code.fromJson(dynamic json) {
    _id = json["id"];
    _code = json["code"];
    _packagesIds = json["packagesIds"] != null ? json["packagesIds"].cast<int>() : [];
    _packagesNames = json["packagesNames"] != null ? json["packagesNames"].cast<String>() : [];
    _price = json["price"];
    _dateCreated = json["dateCreated"];
    _dateActivated = json["dateActivated"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["code"] = _code;
    map["packagesIds"] = _packagesIds;
    map["packagesNames"] = _packagesNames;
    map["price"] = _price;
    map["dateCreated"] = _dateCreated;
    map["dateActivated"] = _dateActivated;
    return map;
  }

}