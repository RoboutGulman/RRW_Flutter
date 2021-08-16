import 'package:flutter/material.dart';

class ExecutionsPage extends StatefulWidget {
  
  @override
  _ExecutionsPageState createState() => _ExecutionsPageState();
}

class _ExecutionsPageState extends State<ExecutionsPage> {
  static const String _title = 'Иcполнение';

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