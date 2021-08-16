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

  /// `Calculadora de Morte por Cafeína`
  String get formPageAppBarTitle {
    return Intl.message(
      'Calculadora de Morte por Cafeína',
      name: 'formPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Café Coado (Xícara)`
  String get firstSuggestedDrinkName {
    return Intl.message(
      'Café Coado (Xícara)',
      name: 'firstSuggestedDrinkName',
      desc: '',
      args: [],
    );
  }

  /// `Espresso (Shot)`
  String get secondSuggestedDrinkName {
    return Intl.message(
      'Espresso (Shot)',
      name: 'secondSuggestedDrinkName',
      desc: '',
      args: [],
    );
  }

  /// `Latte (Caneca)`
  String get thirdSuggestedDrinkName {
    return Intl.message(
      'Latte (Caneca)',
      name: 'thirdSuggestedDrinkName',
      desc: '',
      args: [],
    );
  }

  /// `Peso Corporal`
  String get formPageWeightInputLabel {
    return Intl.message(
      'Peso Corporal',
      name: 'formPageWeightInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `libras`
  String get formPageWeightInputSuffix {
    return Intl.message(
      'libras',
      name: 'formPageWeightInputSuffix',
      desc: '',
      args: [],
    );
  }

  /// `Escolha uma bebida`
  String get formPageRadioListLabel {
    return Intl.message(
      'Escolha uma bebida',
      name: 'formPageRadioListLabel',
      desc: '',
      args: [],
    );
  }

  /// `CALCULAR`
  String get formPageActionButtonTitle {
    return Intl.message(
      'CALCULAR',
      name: 'formPageActionButtonTitle',
      desc: '',
      args: [],
    );
  }

  /// `Outra`
  String get formPageCustomDrinkRadioTitle {
    return Intl.message(
      'Outra',
      name: 'formPageCustomDrinkRadioTitle',
      desc: '',
      args: [],
    );
  }

  /// `Tamanho`
  String get formPageCustomDrinkServingSizeInputLabel {
    return Intl.message(
      'Tamanho',
      name: 'formPageCustomDrinkServingSizeInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `fl. oz`
  String get formPageCustomDrinkServingSizeInputSuffix {
    return Intl.message(
      'fl. oz',
      name: 'formPageCustomDrinkServingSizeInputSuffix',
      desc: '',
      args: [],
    );
  }

  /// `Cafeína`
  String get formPageCustomDrinkCaffeineAmountInputLabel {
    return Intl.message(
      'Cafeína',
      name: 'formPageCustomDrinkCaffeineAmountInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `mg`
  String get formPageCustomDrinkCaffeineAmountInputSuffix {
    return Intl.message(
      'mg',
      name: 'formPageCustomDrinkCaffeineAmountInputSuffix',
      desc: '',
      args: [],
    );
  }

  /// `Dosagens`
  String get resultsPageAppBarTitle {
    return Intl.message(
      'Dosagens',
      name: 'resultsPageAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Dose Letal`
  String get resultsPageLethalDosageTitle {
    return Intl.message(
      'Dose Letal',
      name: 'resultsPageLethalDosageTitle',
      desc: '',
      args: [],
    );
  }

  /// `{quantity, plural, one{Uma porção.} other{{formattedNumber} porções no seu sistema de uma vez.}}`
  String resultsPageLethalDosageMessage(num quantity, Object formattedNumber) {
    return Intl.plural(
      quantity,
      one: 'Uma porção.',
      other: '$formattedNumber porções no seu sistema de uma vez.',
      name: 'resultsPageLethalDosageMessage',
      desc: '',
      args: [quantity, formattedNumber],
    );
  }

  /// `Limite Seguro Diário`
  String get resultsPageSafeDosageTitle {
    return Intl.message(
      'Limite Seguro Diário',
      name: 'resultsPageSafeDosageTitle',
      desc: '',
      args: [],
    );
  }

  /// `{quantity, plural, one{Uma porção por dia.} other{{formattedNumber} porções por dia.}}`
  String resultsPageSafeDosageMessage(num quantity, Object formattedNumber) {
    return Intl.plural(
      quantity,
      one: 'Uma porção por dia.',
      other: '$formattedNumber porções por dia.',
      name: 'resultsPageSafeDosageMessage',
      desc: '',
      args: [quantity, formattedNumber],
    );
  }

  /// `*Baseado em uma porção de {servingSize} fl. oz.`
  String resultsPageFirstDisclaimer(Object servingSize) {
    return Intl.message(
      '*Baseado em uma porção de $servingSize fl. oz.',
      name: 'resultsPageFirstDisclaimer',
      desc: '',
      args: [servingSize],
    );
  }

  /// `*Se aplica a pessoas com 18 anos ou mais. Essa calculadora não substitui conselhos médicos profissionais.`
  String get resultsPageSecondDisclaimer {
    return Intl.message(
      '*Se aplica a pessoas com 18 anos ou mais. Essa calculadora não substitui conselhos médicos profissionais.',
      name: 'resultsPageSecondDisclaimer',
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
