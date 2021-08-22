import 'package:flutter/material.dart';
import '/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controller;

    @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).login_page, style: Theme.of(context).primaryTextTheme.headline1,),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: Center(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: S.of(context).text_field,
          ),  
          onSubmitted: (String value) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString("login", value);
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(value == '' ? S.of(context).error1 : S.of(context).success),
                  content: Text(value == '' ? S.of(context).error2 : '' ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        if (value == '') { 
                         Navigator.pop(context); 
                        } else {
                          prefs.remove("login"); 
                          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                        }  
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              });
          }
        ),
      ),
    );
  }
}