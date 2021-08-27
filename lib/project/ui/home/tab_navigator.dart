import 'package:flutter/material.dart';

import '../../domain/home/tab.dart';

import '../bank_page.dart';
import '../executions_page.dart';
import '../orders_page.dart';
import '../rating/rating_page.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({this.navigatorKey, required this.tabItem});

  final GlobalKey<State<StatefulWidget>>? navigatorKey;
  final TabItem tabItem;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings routeSettings) {
        Widget currentPage;
        switch (tabItem) {
          case TabItem.RATING:
            currentPage = RatingPage();
            break;
          case TabItem.ORDERS:
            currentPage = OrdersPage();
            break;
          case TabItem.EXECUTIONS:
            currentPage = ExecutionsPage();
            break;
          case TabItem.BANK:
            currentPage = BankPage();
            break;
        }
        return MaterialPageRoute(builder: (BuildContext context) => currentPage);
      },
    );
  }
}