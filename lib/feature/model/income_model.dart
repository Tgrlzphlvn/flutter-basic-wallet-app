import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:hive_flutter/adapters.dart';
part 'income_model.g.dart';

@HiveType(typeId: ProjectConstants.incomeHiveFieldTypeId)
class IncomeModel {
  @HiveField(0)
  String incomeSource;
  @HiveField(1)
  int income;

  IncomeModel({
    required this.incomeSource,
    required this.income,
  });
}
