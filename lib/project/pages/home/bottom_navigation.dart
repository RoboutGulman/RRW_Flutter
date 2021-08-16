import 'package:flutter/material.dart';
import '../../models/tab.dart';

import '../../../generated/l10n.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.RATING : const MyTab(name: "Рейтинг", color: Colors.blue, icon: Icon(CustomIcons.seal_fill),),
  TabItem.ORDERS : const MyTab(name: "Приказы", color: Colors.blue, icon: Icon(CustomIcons.arrow_up_doc_fill),),
  TabItem.EXECUTIONS : const MyTab(name: "Исполнение", color: Colors.blue, icon: Icon(CustomIcons.die_face_4_fill),),
  TabItem.BANK : const MyTab(name: "Банк", color: Colors.blue, icon: Icon(CustomIcons.creditcard_fill),),
};

class MyBottomNavigation extends StatelessWidget {

  MyBottomNavigation({required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      selectedItemColor: _colorTabMatching(currentTab),
      selectedFontSize: 12,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: [
        _buildItem(TabItem.RATING),
        _buildItem(TabItem.ORDERS),
        _buildItem(TabItem.EXECUTIONS),
        _buildItem(TabItem.BANK),
      ],
      onTap: (index) => onSelectTab(
          TabItem.values[index]
      )
    );
  }

  BottomNavigationBarItem _buildItem(TabItem item) {
    return BottomNavigationBarItem(
      icon: tabs[item]!.icon,
      label: tabs[item]!.name,
    );
  }

  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? tabs[item]!.color : Colors.grey;
  }

}