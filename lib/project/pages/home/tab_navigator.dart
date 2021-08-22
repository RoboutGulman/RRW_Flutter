import 'package:flutter/material.dart';

import '../../models/tab.dart';

import '../routes/bank_page.dart';
import '../routes/executions_page.dart';
import '../routes/orders_page.dart';
import '../routes/rating_page.dart';

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