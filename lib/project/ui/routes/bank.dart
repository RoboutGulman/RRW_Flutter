import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class BankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).tabName4, style: Theme.of(context).primaryTextTheme.headline1,),
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
      ),
      body: Container()
    );
  }
}