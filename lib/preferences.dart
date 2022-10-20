import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static late SharedPreferences _preferences;
  static const _keylists = 'lists';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setList(List<String> lists) async =>
      await _preferences.setStringList(_keylists, lists);

  static List<String>? getList() => _preferences.getStringList(_keylists);

  static removeX() async {
    await _preferences.clear();
  }
}
