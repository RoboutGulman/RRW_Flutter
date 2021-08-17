import 'package:flutter/material.dart';
import 'package:rrw_mvc_refac/generated/l10n.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  static const String _title = 'Приказы';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tabName2, style: Theme.of(context).primaryTextTheme.headline1,),
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
      ),
      body: Container()
    );
  }
}