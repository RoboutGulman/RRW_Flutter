import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTab {
  final String name;
  final Icon icon;

  const MyTab({required this.name, required this.icon});
}

enum TabItem { RATING, ORDERS, EXECUTIONS, BANK }

class CustomIcons {
  CustomIcons._();

  static const String _kFontFam = 'CustomIcons';

  static const IconData creditcard_fill =
    IconData(0xe800, fontFamily: _kFontFam);
  static const IconData die_face_4_fill =
    IconData(0xe801, fontFamily: _kFontFam);
  static const IconData arrow_up_doc_fill =
    IconData(0xe802, fontFamily: _kFontFam);
  static const IconData seal_fill =
    IconData(0xe803, fontFamily: _kFontFam);
    
}