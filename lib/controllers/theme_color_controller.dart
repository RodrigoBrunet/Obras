import 'package:flutter/widgets.dart';
import 'package:orcamentos_obras/data/source/local/prefs.dart';

class ThemeColorController with ChangeNotifier {
  Prefs darkThemePreference = Prefs();

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setDarkTheme(value);

    notifyListeners();
  }
}
