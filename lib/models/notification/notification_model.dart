  /// item1 : [{"id":2,"title":"test","body":"test","date":"2021-06-27T21:00:00Z","notificationType":1,"notificationName":"Dashboard","isRead":false}]
  /// item2 : 1

  class NotificationModel {
    List<Item1>? _item1;
    int? _item2;

    List<Item1>? get item1 => _item1;
    int? get item2 => _item2;

    NotificationModel({
        List<Item1>? item1,
        int? item2}){
      _item1 = item1;
      _item2 = item2;
  }

    NotificationModel.fromJson(dynamic json) {
      if (json["item1"] != null) {
        _item1 = [];
        json["item1"].forEach((v) {
          _item1?.add(Item1.fromJson(v));
        });
      }
      _item2 = json["item2"];
    }

    Map<String, dynamic> toJson() {
      var map = <String, dynamic>{};
      if (_item1 != null) {
        map["item1"] = _item1?.map((v) => v.toJson()).toList();
      }
      map["item2"] = _item2;
      return map;
    }

  }

  /// id : 2
  /// title : "test"
  /// body : "test"
  /// date : "2021-06-27T21:00:00Z"
  /// notificationType : 1
  /// notificationName : "Dashboard"
  /// isRead : false

  class Item1 {
    int? _id;
    String? _title;
    String? _body;
    String? _date;
    int? _notificationType;
    String? _notificationName;
    bool? _isRead;

    int? get id => _id;
    String? get title => _title;
    String? get body => _body;
    String? get date => _date;
    int? get notificationType => _notificationType;
    String? get notificationName => _notificationName;
    bool? get isRead => _isRead;

    Item1({
        int? id,
        String? title,
        String? body,
        String? date,
        int? notificationType,
        String? notificationName,
        bool? isRead}){
      _id = id;
      _title = title;
      _body = body;
      _date = date;
      _notificationType = notificationType;
      _notificationName = notificationName;
      _isRead = isRead;
  }

    Item1.fromJson(dynamic json) {
      _id = json["id"];
      _title = json["title"];
      _body = json["body"];
      _date = json["date"];
      _notificationType = json["notificationType"];
      _notificationName = json["notificationName"];
      _isRead = json["isRead"];
    }

    Map<String, dynamic> toJson() {
      var map = <String, dynamic>{};
      map["id"] = _id;
      map["title"] = _title;
      map["body"] = _body;
      map["date"] = _date;
      map["notificationType"] = _notificationType;
      map["notificationName"] = _notificationName;
      map["isRead"] = _isRead;
      return map;
    }

  }