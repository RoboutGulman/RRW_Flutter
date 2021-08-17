import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../models/tab.dart';

const Map<TabItem, MyTab> tabs = {
  TabItem.RATING : MyTab(name: 'Рейтинг', icon: Icon(CustomIcons.seal_fill),),
  TabItem.ORDERS : MyTab(name: 'Приказы', icon: Icon(CustomIcons.arrow_up_doc_fill),),
  TabItem.EXECUTIONS : MyTab(name: 'Исполнение', icon: Icon(CustomIcons.die_face_4_fill),),
  TabItem.BANK : MyTab(name: 'Банк', icon: Icon(CustomIcons.creditcard_fill),),
};

class MyBottomNavigation extends StatelessWidget {

  const MyBottomNavigation({required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      selectedFontSize: 12,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: _initItems(context),
      onTap: (int index) => onSelectTab(
        TabItem.values[index]
      )
    );
  }

  List<BottomNavigationBarItem> _initItems(BuildContext context) {
    final Map<TabItem, MyTab> tabs = {
      TabItem.RATING : MyTab(name: S.of(context).tabName1,
        icon: const Icon(CustomIcons.seal_fill),
      ),
      TabItem.ORDERS : MyTab(name: S.of(context).tabName2,
        icon: const Icon(CustomIcons.arrow_up_doc_fill),
      ),
      TabItem.EXECUTIONS : MyTab(name: S.of(context).tabName3,
        icon: const Icon(CustomIcons.die_face_4_fill),
      ),
      TabItem.BANK : MyTab(name: S.of(context).tabName4,
        icon: const Icon(CustomIcons.creditcard_fill),
      ),
    };

    return <BottomNavigationBarItem>[
      _buildItem(TabItem.RATING, tabs),
      _buildItem(TabItem.ORDERS, tabs),
      _buildItem(TabItem.EXECUTIONS, tabs),
      _buildItem(TabItem.BANK, tabs),
    ];
  }

  BottomNavigationBarItem _buildItem(TabItem item, Map<TabItem, MyTab> tabs) {
    return BottomNavigationBarItem(
      icon: tabs[item]!.icon,
      label: tabs[item]!.name,
    );
  }

}