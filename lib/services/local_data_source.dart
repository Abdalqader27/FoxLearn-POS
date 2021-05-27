import 'dart:convert';

import 'package:foxlearn_pos/models/user/user.dart';
import 'package:foxlearn_pos/services/shared_preferences/shared_keys.dart';
import 'package:foxlearn_pos/services/shared_preferences/shared_preferences_handler.dart';



class LocalDataSource {
  static Future<User> getUserFromShared() async =>
      User.fromJson(jsonDecode((await (SharedPreferencesHandler.getString(
          key: SharedKeys.USER_DATA_KEY)))!));
}
