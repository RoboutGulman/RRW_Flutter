import 'package:flutter_svg/flutter_svg.dart';

class MyTab {
  final String name;
  final SvgPicture icon;
  final SvgPicture activeIcon;

  MyTab({required this.name, required this.icon, required this.activeIcon});
}

enum TabItem { RATING, ORDERS, EXECUTIONS, BANK }
