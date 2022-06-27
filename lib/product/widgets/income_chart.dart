import 'package:basic_wallet_sample/feature/model/income_model.dart';
import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class IncomeChart extends StatelessWidget with ProjectConstants {
  IncomeChart({Key? key, required this.incomeList, required this.title}) : super(key: key);

  final List<IncomeModel> incomeList;
  final String title;

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height * chartHeightValue,
          child: SfCircularChart(
            title: ChartTitle(text: title),
            legend:
                Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              DoughnutSeries<IncomeModel, String>(
                dataSource: incomeList,
                enableTooltip: true,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                xValueMapper: (IncomeModel model, _) => model.incomeSource,
                yValueMapper: (IncomeModel model, _) => model.income,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
