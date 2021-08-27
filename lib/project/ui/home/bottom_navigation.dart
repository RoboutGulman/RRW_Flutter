import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';
import '../../domain/home/tab.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation(
      {required this.currentTab, required this.onSelectTab});

  final TabItem currentTab;

  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      selectedFontSize: 12,
      unselectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentTab.index,
      items: _initItems(context),
      onTap: (int index) => onSelectTab(TabItem.values[index]),
    );
  }

  List<BottomNavigationBarItem> _initItems(BuildContext context) {
    final Map<TabItem, MyTab> tabs = <TabItem, MyTab>{
      TabItem.RATING: MyTab(
        name: S.of(context).tabName1,
        icon: SvgPicture.asset('assets/svg/tab_nav/seal.svg'),
        activeIcon: SvgPicture.asset('assets/svg/tab_nav/seal_chosen.svg'),
      ),
      TabItem.ORDERS: MyTab(
        name: S.of(context).tabName2,
        icon: SvgPicture.asset('assets/svg/tab_nav/doc_arrow_up.svg'),
        activeIcon:
            SvgPicture.asset('assets/svg/tab_nav/doc_arrow_up_chosen.svg'),
      ),
      TabItem.EXECUTIONS: MyTab(
        name: S.of(context).tabName3,
        icon: SvgPicture.asset('assets/svg/tab_nav/die_face_4.svg'),
        activeIcon:
            SvgPicture.asset('assets/svg/tab_nav/die_face_4_chosen.svg'),
      ),
      TabItem.BANK: MyTab(
        name: S.of(context).tabName4,
        icon: SvgPicture.asset('assets/svg/tab_nav/credit_card.svg'),
        activeIcon:
            SvgPicture.asset('assets/svg/tab_nav/credit_card_chosen.svg'),
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
      label: tabs[item]!.name,
      icon: tabs[item]!.icon,
      activeIcon: tabs[item]!.activeIcon,
    );
  }
}
