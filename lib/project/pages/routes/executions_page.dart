import 'package:flutter/material.dart';
import 'package:rrw_mvc_refac/generated/l10n.dart';

class ExecutionsPage extends StatefulWidget {
  
  @override
  _ExecutionsPageState createState() => _ExecutionsPageState();
}

class _ExecutionsPageState extends State<ExecutionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tabName3, style: Theme.of(context).primaryTextTheme.headline1,),
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
      ),
      body: Container()
    );
  }
}