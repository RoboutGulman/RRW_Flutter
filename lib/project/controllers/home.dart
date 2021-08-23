import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../presentation/tab.dart';

class HomeController extends ControllerMVC {
  static late HomeController _this;

  final Map<TabItem, GlobalKey<NavigatorState>>
  _navigatorKeys = <TabItem, GlobalKey<NavigatorState>>{
    TabItem.RATING: GlobalKey<NavigatorState>(),
    TabItem.ORDERS: GlobalKey<NavigatorState>(),
    TabItem.EXECUTIONS: GlobalKey<NavigatorState>(),
    TabItem.BANK: GlobalKey<NavigatorState>(),
  };

  TabItem _currentTab = TabItem.RATING;
  TabItem _previousTab = TabItem.RATING;

    factory HomeController() {
    _this = HomeController._();
    return _this;
  }

  HomeController._();

  static HomeController get controller => _this;
  Map<TabItem, GlobalKey> get navigatorKeys => _navigatorKeys;
  TabItem get currentTab => _currentTab;
  TabItem get previousTab => _previousTab;

  Function(TabItem tabItem) get selectTab => _selectTab;

  dynamic _selectTab(TabItem tabItem) {
    setState(() {
      _previousTab = _currentTab;
      _currentTab = tabItem;
    });
  }
}