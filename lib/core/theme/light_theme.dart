import 'package:basic_wallet_sample/core/colors/colors.dart';
import 'package:flutter/material.dart';

class LightTheme with WalletColors {
  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor: aliceBlue,
      dividerColor: onyx,
      appBarTheme: AppBarTheme(backgroundColor: cadetBlue),
      bottomAppBarTheme: BottomAppBarTheme(
        color: cadetBlue,
      ),
    );
  }
}
