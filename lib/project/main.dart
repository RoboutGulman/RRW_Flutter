import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';
import 'ui/home/home_page.dart';
import 'ui/theme.dart';


import 'ui/title_page.dart';
import 'ui/login_page.dart';
//import 'project/pages/fraction/fraction_page.dart';
//import 'project/pages/Fraction/rrteam_page.dart';
//import 'project/pages/Fraction/tkteam_page.dart';


void main() => runApp(const AppEntrance());

class AppEntrance extends StatelessWidget {
  const AppEntrance({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (ThemeData theme, ThemeData darkTheme) => MaterialApp(
        theme: theme,
        //home: HomePage(),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/home': (context) => HomePage(),
          '/login': (context) => LoginPage(),
          //'/Fraction':(context)=>FractionPage(),
          //'/Fraction/rrTeam':(context)=>RRTeamPage(),
          //'/Fraction/prTeam':(context)=>PRTeamPage(),
         //'/Fraction/tkTeam':(context)=>TKTeamPage(),
        },
      ),
    );
  }
}
