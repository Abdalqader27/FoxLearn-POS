/// id : 1
/// name : "I1PO W6V"
/// description : "8M2W 5KD L9Q31ZPNAPX2U"
/// price : 6000
/// services : null
/// codeCount : 9

class Package {
  int? _id;
  String? _name;
  String? _description;
  int? _price;
  dynamic? _services;
  int? _codeCount;

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  int? get price => _price;
  dynamic? get services => _services;
  int? get codeCount => _codeCount;

  Package({
      int? id, 
      String? name, 
      String? description, 
      int? price, 
      dynamic? services, 
      int? codeCount}){
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _services = services;
    _codeCount = codeCount;
}

  Package.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _description = json["description"];
    _price = json["price"];
    _services = json["services"];
    _codeCount = json["codeCount"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["description"] = _description;
    map["price"] = _price;
    map["services"] = _services;
    map["codeCount"] = _codeCount;
    return map;
  }

}