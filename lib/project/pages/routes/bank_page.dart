import 'package:flutter/material.dart';

class BankPage extends StatelessWidget {
  static const String _title = 'Банк';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.grey.shade100,
        centerTitle: true,
      ),
      body: Container()
    );
  }
}