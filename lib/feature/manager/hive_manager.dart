import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:basic_wallet_sample/feature/model/income_model.dart';

enum IncomeKey { income, expense, balance }

abstract class IncomeCacheManager<T> {
  final IncomeKey key;
  Box<IncomeModel>? _box;

  IncomeCacheManager(this.key);

  Future<void> init() async {
    registerAdapters();
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(key.name);
    }
  }

  void registerAdapters();

  Future<void> saveIncome(T model);

  Future<void> deleteIncome(int index);

  List<T>? getValues();
}

class IncomeCache extends IncomeCacheManager<IncomeModel> {
  IncomeCache(super.key) {
    init();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(ProjectConstants.incomeHiveFieldTypeId)) {
      Hive.registerAdapter(IncomeModelAdapter());
    }
  }

  @override
  List<IncomeModel>? getValues() {
    return _box?.values.toList();
  }

  @override
  Future<void> deleteIncome(int index) async {
    await _box?.deleteAt(index);
  }

  @override
  Future<void> saveIncome(IncomeModel model) async {
    await _box?.add(model);
  }
}

class ExpenseCache extends IncomeCacheManager<IncomeModel> {
  ExpenseCache(super.key) {
    init();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(ProjectConstants.incomeHiveFieldTypeId)) {
      Hive.registerAdapter(IncomeModelAdapter());
    }
  }

  @override
  List<IncomeModel>? getValues() {
    return _box?.values.toList();
  }

  @override
  Future<void> deleteIncome(int index) async {
    await _box?.deleteAt(index);
  }

  @override
  Future<void> saveIncome(IncomeModel model) async {
    await _box?.add(model);
  }
}

