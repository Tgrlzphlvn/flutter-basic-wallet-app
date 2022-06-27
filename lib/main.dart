import 'package:basic_wallet_sample/core/theme/light_theme.dart';
import 'package:basic_wallet_sample/feature/manager/hive_manager.dart';
import 'package:basic_wallet_sample/feature/manager/theme_cache.dart';
import 'package:basic_wallet_sample/feature/view/bottomNavBar/wallet_bottom_nav_bar_view.dart';
import 'package:basic_wallet_sample/feature/viewmodel/expense_view_model.dart';
import 'package:basic_wallet_sample/feature/viewmodel/income_view_model.dart';
import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => ThemeCache()),
        ),
        ChangeNotifierProvider(
          create: (context) => IncomeViewModel(
            IncomeCache(IncomeKey.income),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ExpenseViewModel(
            ExpenseCache(IncomeKey.expense),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with ProjectConstants {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: mainTitle,
      theme:
          context.watch<ThemeCache>().isDark ? LightTheme().theme : ThemeData.dark(),
      home: const WalletBottomNavBarView(),
    );
  }
}
