// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Рейтинг`
  String get tabName1 {
    return Intl.message(
      'Рейтинг',
      name: 'tabName1',
      desc: '',
      args: [],
    );
  }

  /// `Приказы`
  String get tabName2 {
    return Intl.message(
      'Приказы',
      name: 'tabName2',
      desc: '',
      args: [],
    );
  }

  /// `Исполнение`
  String get tabName3 {
    return Intl.message(
      'Исполнение',
      name: 'tabName3',
      desc: '',
      args: [],
    );
  }

  /// `Банк`
  String get tabName4 {
    return Intl.message(
      'Банк',
      name: 'tabName4',
      desc: '',
      args: [],
    );
  }

  /// `Авторизация`
  String get login_page {
    return Intl.message(
      'Авторизация',
      name: 'login_page',
      desc: '',
      args: [],
    );
  }

  /// `Логин`
  String get text_field {
    return Intl.message(
      'Логин',
      name: 'text_field',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка!`
  String get error1 {
    return Intl.message(
      'Ошибка!',
      name: 'error1',
      desc: '',
      args: [],
    );
  }

  /// `Логин не может быть пустым.`
  String get error2 {
    return Intl.message(
      'Логин не может быть пустым.',
      name: 'error2',
      desc: '',
      args: [],
    );
  }

  /// `Логин сохранён`
  String get success {
    return Intl.message(
      'Логин сохранён',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get button {
    return Intl.message(
      'OK',
      name: 'button',
      desc: '',
      args: [],
    );
  }

  /// `пассажиры`
  String get rrRatingStat1 {
    return Intl.message(
      'пассажиры',
      name: 'rrRatingStat1',
      desc: '',
      args: [],
    );
  }

  /// `кредиты`
  String get rrRatingStat2 {
    return Intl.message(
      'кредиты',
      name: 'rrRatingStat2',
      desc: '',
      args: [],
    );
  }

  /// `грузы`
  String get rrRatingStat3 {
    return Intl.message(
      'грузы',
      name: 'rrRatingStat3',
      desc: '',
      args: [],
    );
  }

  /// `города`
  String get prRatingStat1 {
    return Intl.message(
      'города',
      name: 'prRatingStat1',
      desc: '',
      args: [],
    );
  }

  /// `PR`
  String get prRatingStat2 {
    return Intl.message(
      'PR',
      name: 'prRatingStat2',
      desc: '',
      args: [],
    );
  }

  /// `пассажиры`
  String get prRatingStat3 {
    return Intl.message(
      'пассажиры',
      name: 'prRatingStat3',
      desc: '',
      args: [],
    );
  }

  /// `ж/д`
  String get tkRatingStat1 {
    return Intl.message(
      'ж/д',
      name: 'tkRatingStat1',
      desc: '',
      args: [],
    );
  }

  /// `таможня`
  String get tkRatingStat2 {
    return Intl.message(
      'таможня',
      name: 'tkRatingStat2',
      desc: '',
      args: [],
    );
  }

  /// `перевозки`
  String get tkRatingStat3 {
    return Intl.message(
      'перевозки',
      name: 'tkRatingStat3',
      desc: '',
      args: [],
    );
  }

  /// `Техасская`
  String get rrTeamNames1 {
    return Intl.message(
      'Техасская',
      name: 'rrTeamNames1',
      desc: '',
      args: [],
    );
  }

  /// `Нью-Йоркская`
  String get rrTeamNames2 {
    return Intl.message(
      'Нью-Йоркская',
      name: 'rrTeamNames2',
      desc: '',
      args: [],
    );
  }

  /// `Северная`
  String get rrTeamNames3 {
    return Intl.message(
      'Северная',
      name: 'rrTeamNames3',
      desc: '',
      args: [],
    );
  }

  /// `Юго-западная`
  String get rrTeamNames4 {
    return Intl.message(
      'Юго-западная',
      name: 'rrTeamNames4',
      desc: '',
      args: [],
    );
  }

  /// `Тихоокеанская`
  String get rrTeamNames5 {
    return Intl.message(
      'Тихоокеанская',
      name: 'rrTeamNames5',
      desc: '',
      args: [],
    );
  }

  /// `Юго-восточная`
  String get rrTeamNames6 {
    return Intl.message(
      'Юго-восточная',
      name: 'rrTeamNames6',
      desc: '',
      args: [],
    );
  }

  /// `Республика`
  String get prTeamNames1 {
    return Intl.message(
      'Республика',
      name: 'prTeamNames1',
      desc: '',
      args: [],
    );
  }

  /// `Федерация`
  String get prTeamNames2 {
    return Intl.message(
      'Федерация',
      name: 'prTeamNames2',
      desc: '',
      args: [],
    );
  }

  /// `Конфедерация`
  String get prTeamNames3 {
    return Intl.message(
      'Конфедерация',
      name: 'prTeamNames3',
      desc: '',
      args: [],
    );
  }

  /// `ТК Вашингтона`
  String get tkTeamNames1 {
    return Intl.message(
      'ТК Вашингтона',
      name: 'tkTeamNames1',
      desc: '',
      args: [],
    );
  }

  /// `ТК Прескотта`
  String get tkTeamNames2 {
    return Intl.message(
      'ТК Прескотта',
      name: 'tkTeamNames2',
      desc: '',
      args: [],
    );
  }

  /// `ТК Литл-Рока`
  String get tkTeamNames3 {
    return Intl.message(
      'ТК Литл-Рока',
      name: 'tkTeamNames3',
      desc: '',
      args: [],
    );
  }

  /// `ТК Бисмарка`
  String get tkTeamNames4 {
    return Intl.message(
      'ТК Бисмарка',
      name: 'tkTeamNames4',
      desc: '',
      args: [],
    );
  }

  /// `ЖЕЛЕЗНЫЕ ДОРОГИ`
  String get fractionName1 {
    return Intl.message(
      'ЖЕЛЕЗНЫЕ ДОРОГИ',
      name: 'fractionName1',
      desc: '',
      args: [],
    );
  }

  /// `ПОЛИТИКИ`
  String get fractionName2 {
    return Intl.message(
      'ПОЛИТИКИ',
      name: 'fractionName2',
      desc: '',
      args: [],
    );
  }

  /// `ТОРГОВЫЕ КОМПАНИИ`
  String get fractionName3 {
    return Intl.message(
      'ТОРГОВЫЕ КОМПАНИИ',
      name: 'fractionName3',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru', countryCode: 'RU'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
