import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeKey { theme }

class ThemeCache extends ChangeNotifier {
  SharedPreferences? preferences;
  bool isDark = false;

  ThemeCache() {
    initShared();
    getDefaultValues();
  }

  Future<void> initShared() async {
    preferences = await SharedPreferences.getInstance();
  }

  void onChangeValue(bool value) {
    if (value != null) {
      isDark = value;
      notifyListeners();
    }
  }

  Future<void> getDefaultValues() async {
    final bool? _isDark = preferences?.getBool(ThemeKey.theme.name);
    onChangeValue(_isDark ?? false);
  }
}
