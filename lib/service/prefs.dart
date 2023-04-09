import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static setBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('themeDark', true);
  }

  static getBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('themeDark');
  }
}
