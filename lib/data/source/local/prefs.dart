import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static const THEME_STATUS = 'THEMESTATUS';

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('THEMESTATUS', value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('THEMESTATUS') ?? false;
  }
}
