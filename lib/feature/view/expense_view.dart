import 'package:basic_wallet_sample/feature/model/income_model.dart';
import 'package:basic_wallet_sample/feature/viewmodel/expense_view_model.dart';
import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:basic_wallet_sample/product/widgets/cache_save_button.dart';
import 'package:basic_wallet_sample/product/widgets/custom_text_field.dart';
import 'package:basic_wallet_sample/product/widgets/income_chart.dart';
import 'package:basic_wallet_sample/product/widgets/income_list_tile.dart';
import 'package:basic_wallet_sample/product/widgets/list_tile_alert_dialog.dart';
import 'package:basic_wallet_sample/product/widgets/lottie_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseView extends StatelessWidget with ProjectConstants {
  ExpenseView({Key? key}) : super(key: key);
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _incomeSourceController = TextEditingController();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expenseViewTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _cacheAddedBottomSheet(context);
            },
          ),
        ],
      ),
      body: context.watch<ExpenseViewModel>().expneses.isEmpty
          ? LottieHolder()
          : Column(
              children: [
                Expanded(
                  child: IncomeChart(
                    title: expenseChartTitle,
                    incomeList: context.watch<ExpenseViewModel>().expneses,
                  ),
                ),
                Expanded(
                  child: _listViewBuilder(context),
                ),
              ],
            ),
    );
  }

  ListView _listViewBuilder(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<ExpenseViewModel>().expneses.length,
      itemBuilder: (context, index) {
        return IncomeListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ListTileAlertDialog(
                  onPressed: () {
                    context
                        .read<ExpenseViewModel>()
                        .incomeCacheManager
                        .deleteIncome(index);
                    context.read<ExpenseViewModel>().getCacheDatas();
                    Navigator.of(context).pop();
                  },
                );
              },
            );
          },
          incomes: context.watch<ExpenseViewModel>().expneses,
          incomeIcon: incomeMinusIcon,
          index: index,
        );
      },
    );
  }

  Future<dynamic> _cacheAddedBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(bottomSheetRadius),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          children: [
            Padding(
              padding: dividerPadding,
              child: const Divider(),
            ),
            CustomTextField(
              controller: _incomeController,
              labelText: incomeLabel,
            ),
            CustomTextField(
              controller: _incomeSourceController,
              labelText: incomeSourceLabel,
            ),
            _cacheSaveButton(context),
          ],
        );
      },
    );
  }

  CacheSaveButton _cacheSaveButton(BuildContext context) {
    return CacheSaveButton(
      buttonTitle: cacheSaveButtonText,
      onPressed: () {
        context.read<ExpenseViewModel>().incomeCacheManager.saveIncome(
              IncomeModel(
                incomeSource: _incomeSourceController.text,
                income: int.parse(_incomeController.text),
              ),
            );
        context.read<ExpenseViewModel>().getCacheDatas();
        _incomeController.text = emptyText;
        _incomeSourceController.text = emptyText;
        Navigator.of(context).pop();
      },
    );
  }
}
