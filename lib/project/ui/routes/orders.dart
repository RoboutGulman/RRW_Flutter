import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tabName2, style: Theme.of(context).primaryTextTheme.headline1,),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: Container()
    );
  }
}