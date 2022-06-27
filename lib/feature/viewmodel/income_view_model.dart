import 'package:basic_wallet_sample/feature/manager/hive_manager.dart';
import 'package:basic_wallet_sample/feature/model/income_model.dart';
import 'package:flutter/material.dart';

class IncomeViewModel extends ChangeNotifier {
  late IncomeCacheManager<IncomeModel> incomeCacheManager;
  List<IncomeModel> incomes = [];

  IncomeViewModel(this.incomeCacheManager) {
    getCacheDatas();
  }

  Future<void> getCacheDatas() async {
    await incomeCacheManager.init();
    incomes = incomeCacheManager.getValues() ?? [];
    notifyListeners();
  }
}
