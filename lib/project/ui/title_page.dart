import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> runTitle(context) async {
  await Future.delayed(Duration(seconds: 3));
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.remove("login"); //убрать строку, если необходимо действительное сохранение
  String? value = prefs.getString('login');
  if (value == null) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  } else {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }
}

class TitlePage extends StatefulWidget {
  const TitlePage ({ Key? key }) : super(key: key);

  @override
  _TitlePageState createState () => _TitlePageState();
}


class _TitlePageState extends StateMVC<TitlePage> {

  @override
  void initState() {
    super.initState();
    runTitle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/svg/logo_white.svg')
    );
  }
}

