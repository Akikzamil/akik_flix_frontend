import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  SharedPreference._();
  static final instance = SharedPreference._();

  static late SharedPreferences _preference;

  Future<void> init() async => _preference = await SharedPreferences.getInstance();

  Future<void> setToken(String value) async => _preference.setString("token", value);

  String? getToken() => _preference.getString("token");
}
