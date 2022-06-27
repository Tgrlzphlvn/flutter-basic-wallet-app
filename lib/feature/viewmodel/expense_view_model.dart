import 'package:basic_wallet_sample/feature/manager/hive_manager.dart';
import 'package:basic_wallet_sample/feature/model/income_model.dart';
import 'package:flutter/cupertino.dart';

class ExpenseViewModel extends ChangeNotifier {
  late IncomeCacheManager<IncomeModel> incomeCacheManager;
  List<IncomeModel> expneses = [];

  ExpenseViewModel(this.incomeCacheManager) {
    getCacheDatas();
  }

  Future<void> getCacheDatas() async {
    await incomeCacheManager.init();
    expneses = incomeCacheManager.getValues() ?? [];
    notifyListeners();
  }
}
