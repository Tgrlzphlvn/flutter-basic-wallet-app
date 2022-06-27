import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class ProjectConstants {
  // Hive constant
  static const int incomeHiveFieldTypeId = 1;

  // Strings
  final String emptyText = '';
  final String mainTitle = 'Wallet';
  final String incomeViewTitle = 'Gelir Tablosu';
  final String expenseViewTitle = 'Gider Tablosu';
  final String walletBottomNavBarTitle = 'Cüzdan';
  final String incomeChartTitle = 'Gelirler';
  final String expenseChartTitle = 'Giderler';
  final String incomeLabel = 'Miktar';
  final String incomeSourceLabel = 'Kaynak';
  final String cacheSaveButtonText = 'Kaydet';

  // Aler Dialog Strings
  final String alertContent = 'Bu veriyi silmek istiyor musunuz?';
  final String yesButtonText = 'Evet';
  final String noButtonText = 'Hayır';

  // Lottie
  final String lottiePath = 'assets/ape.json';

  // String Icons
  final String incomePlusIcon = '+';
  final String incomeMinusIcon = '-';
  final String turkishLira = 'TL';

  // Paddings
  final EdgeInsets textFieldPadding =
      const EdgeInsets.only(top: 20, right: 20, left: 20);
  final EdgeInsets cacheSaveButtonPadding =
      const EdgeInsets.only(top: 20, right: 20, left: 20);
  final EdgeInsets cacheSaveButtonTextPadding = const EdgeInsets.all(12);
  final EdgeInsets dividerPadding =
      const EdgeInsets.only(top: 12, left: 20, right: 20);
  final EdgeInsets listTilePadding =
      const EdgeInsets.only(top: 10, right: 20, left: 20);

  // Radius
  final double textFieldRadius = 20;
  final double bottomSheetRadius = 30;

  // MediaQuery Value
  final double chartHeightValue = 0.4;
}
