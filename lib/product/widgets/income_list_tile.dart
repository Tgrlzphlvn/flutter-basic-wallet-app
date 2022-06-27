import 'package:basic_wallet_sample/feature/model/income_model.dart';
import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:flutter/material.dart';

class IncomeListTile extends StatelessWidget with ProjectConstants {
  IncomeListTile(
      {Key? key,
      required this.incomes,
      required this.index,
      required this.incomeIcon,
      required this.onTap})
      : super(key: key);

  final List<IncomeModel>? incomes;
  final String? incomeIcon;
  final int index;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: listTilePadding,
        child: Column(
          children: [
            const Divider(),
            ListTile(
              leading: Text(incomes?[index].incomeSource ?? ''),
              trailing: Text('$incomeIcon ${incomes?[index].income ?? emptyText} $turkishLira'),
            ),
          ],
        ),
      ),
    );
  }
}
