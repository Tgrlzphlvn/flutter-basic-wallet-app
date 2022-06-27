import 'package:basic_wallet_sample/feature/view/expense_view.dart';
import 'package:basic_wallet_sample/feature/view/income_view.dart';
import 'package:basic_wallet_sample/product/constants/project_constants.dart';
import 'package:flutter/material.dart';

class WalletBottomNavBarView extends StatefulWidget {
  const WalletBottomNavBarView({Key? key}) : super(key: key);

  @override
  State<WalletBottomNavBarView> createState() => _WalletBottomNavBarViewState();
}

class _WalletBottomNavBarViewState extends State<WalletBottomNavBarView>
    with ProjectConstants, TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _TabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomAppBar(),
      body: TabBarView(
          controller: _tabController, children: [IncomeView(), ExpenseView()]),
    );
  }

  BottomAppBar _bottomAppBar() {
    return BottomAppBar(
      child: TabBar(
        padding: EdgeInsets.zero,
        controller: _tabController,
        onTap: (int index) {},
        tabs: _TabViews.values
            .map(
              (e) => Tab(text: e.name),
            )
            .toList(),
      ),
    );
  }
}

enum _TabViews { income, expense }
