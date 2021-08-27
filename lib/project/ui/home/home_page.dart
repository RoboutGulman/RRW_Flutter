import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../presentation/home_controller.dart';
import '../../domain/home/tab.dart';

import 'bottom_navigation.dart';
import 'tab_navigator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  late HomeController _con;

  _HomePageState() : super(HomeController()) {
    _con = HomeController.controller;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_con.currentTab != _con.previousTab) {
          _con.selectTab(_con.previousTab);
          return false;
        }
        return false;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.RATING),
          _buildOffstageNavigator(TabItem.ORDERS),
          _buildOffstageNavigator(TabItem.EXECUTIONS),
          _buildOffstageNavigator(TabItem.BANK),
        ]),
        bottomNavigationBar: MyBottomNavigation(
          currentTab: _con.currentTab,
          onSelectTab: _con.selectTab
        )
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _con.currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _con.navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
