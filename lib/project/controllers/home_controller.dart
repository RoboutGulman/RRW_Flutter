import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/tab.dart';

class HomeController extends ControllerMVC {
  static late HomeController _this;
  static HomeController get controller => _this;

  factory HomeController() {
    _this = HomeController._();
    return _this;
  }

  HomeController._();

  final _navigatorKeys = {
    TabItem.RATING: GlobalKey<NavigatorState>(),
    TabItem.ORDERS: GlobalKey<NavigatorState>(),
    TabItem.EXECUTIONS: GlobalKey<NavigatorState>(),
    TabItem.BANK: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, GlobalKey> get navigatorKeys => _navigatorKeys;

  var _currentTab = TabItem.RATING;
  var _previousTab = TabItem.RATING;

  TabItem get currentTab => _currentTab;
  TabItem get previousTab => _previousTab;

  get selectTab => _selectTab;

  void _selectTab(TabItem tabItem) {
    setState(() {
      _previousTab = _currentTab;
      _currentTab = tabItem;
    });
  }
}