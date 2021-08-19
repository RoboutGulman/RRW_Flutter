import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.white,
  brightness: Brightness.dark,
  accentColor: Colors.amber,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
  //rating page
  dividerTheme: DividerThemeData(
    indent: 16.0,
    endIndent: 16.0,
    thickness: 0.5,
    color: Color.fromRGBO(198, 198, 200, 1),
  ),
  backgroundColor: Colors.grey.shade100,
  //rating page, контейнер названий фракций
  unselectedWidgetColor: Color.fromRGBO(60, 60, 67, 0.18),
  primaryTextTheme: const TextTheme(
      //заголовки страниц(appBar)
      headline1: TextStyle( 
        color: Colors.black,
        fontSize: 20, 
        fontWeight: FontWeight.w400,
      ),
      //названия фракций
      headline2: TextStyle(
        color: Color.fromRGBO(142, 142, 147, 1),
        fontSize: 13,
        fontWeight: FontWeight.w400, 
        letterSpacing: -0.08,
      ),
      //изменение рейтинга
      headline3: TextStyle(
        color: Color.fromRGBO(33, 150, 83, 1),
        fontSize: 11,
        fontWeight: FontWeight.w400, 
      ),
      //текущий рейтинг
      headline4: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      //названия параметров команд(пассажиры и т.д.)
      subtitle1: TextStyle(
        color: Color.fromRGBO(60, 60, 67, 0.6),
        fontSize: 11,
      ),
      //названия команд
      subtitle2: TextStyle(
        color: Colors.black, 
        fontSize: 20, 
        fontWeight: FontWeight.w400,
      ),
   ),
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.black,
  brightness: Brightness.light,
  accentColor: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
  //rating page
  dividerTheme: DividerThemeData(
    indent: 16.0,
    endIndent: 16.0,
    thickness: 0.5,
    color: Color.fromRGBO(198, 198, 200, 1),
  ),
  backgroundColor: Colors.grey.shade100,
  //rating page, контейнер названий фракций
  unselectedWidgetColor: Color.fromRGBO(60, 60, 67, 0.18),
  primaryTextTheme: const TextTheme(
      //заголовки страниц(appBar)
      headline1: TextStyle( 
        color: Colors.black,
        fontSize: 20, 
        fontWeight: FontWeight.w400,
      ),
      //названия фракций
      headline2: TextStyle(
        color: Color.fromRGBO(142, 142, 147, 1),
        fontSize: 13,
        fontWeight: FontWeight.w400, 
        letterSpacing: -0.08,
      ),
      //изменение рейтинга
      headline3: TextStyle(
        color: Color.fromRGBO(33, 150, 83, 1),
        fontSize: 11,
        fontWeight: FontWeight.w400, 
      ),
      //текущий рейтинг
      headline4: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      //названия параметров команд(пассажиры и т.д.)
      subtitle1: TextStyle(
        color: Color.fromRGBO(60, 60, 67, 0.6),
        fontSize: 11,
      ),
      //названия команд
      subtitle2: TextStyle(
        color: Colors.black, 
        fontSize: 20, 
        fontWeight: FontWeight.w400,
      ),
   ),
);
