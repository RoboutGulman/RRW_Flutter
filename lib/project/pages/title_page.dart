import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> runTitle(context) async {
  await Future.delayed(Duration(seconds: 3));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? value = preferences.getString('login');
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


class _TitlePageState extends State<TitlePage> {

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
