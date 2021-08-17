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
        if (tabItem == TabItem.RATING) {
          currentPage = RatingPage();
        } else if (tabItem == TabItem.ORDERS) {
          currentPage = OrdersPage();
        } else if (tabItem == TabItem.EXECUTIONS) {
          currentPage = ExecutionsPage();
        } else {
          currentPage = BankPage();
        }
        return MaterialPageRoute(builder: (BuildContext context) => currentPage);
      },
    );
  }
}