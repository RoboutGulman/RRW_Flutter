import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../presentation/tab.dart';

class MyBottomNavigation extends StatelessWidget {

  const MyBottomNavigation({required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      selectedFontSize: 12,
      unselectedItemColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: _initItems(context),
      onTap: (int index) => onSelectTab(
        TabItem.values[index]
      )
    );
  }

  List<BottomNavigationBarItem> _initItems(BuildContext context) {
    final Map<TabItem, MyTab> tabs = <TabItem, MyTab>{
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