import 'package:flutter/material.dart';
import '/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State {
  final _formKey = GlobalKey<FormState>();

  var _login;
  var _roomID;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).login_page,
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  labelText: S.of(context).text_field_login,
                ),
                validator: (value) {
                  if (value!.isEmpty) return S.of(context).wrong_login;
                  try {
                    _login = value;
                  } catch(e) {
                    _login = null;
                    return e.toString();
                  }
                },
              ),
              new SizedBox(height: 20.0),
              new TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  labelText: S.of(context).text_field_room_id,
                ),
                validator: (value) {
                  if (value!.isEmpty) return S.of(context).wrong_room_id;
                  try {
                    _roomID = value;
                  } catch(e) {
                    _roomID = null;
                    return e.toString();
                  }
                },
              ),
              new SizedBox(height: 20.0),
              new ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  if (_formKey.currentState!.validate()) {
                    prefs.setString("login", _login);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(S.of(context).snakbar(_login)),
                        backgroundColor: Colors.green,
                      ),
                    );
                    prefs.remove("login"); //убрать
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  }
                },
                child: Text(S.of(context).button),
              )
            ],
          ),
        ),
      ),
    );
  }
}

