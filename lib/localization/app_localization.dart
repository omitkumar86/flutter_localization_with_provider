import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Localization App',
      'greeting': 'Omit Kumar',
      'switchButton': 'Change the language',
    },
    'bn': {
      'title': 'লোকালাইজেশন অ্যাপ',
      'greeting': 'অমিত কুমার',
      'switchButton': 'ভাষা পরিবর্তন করুন',
    },
  };

  String? get title {
    return _localizedValues[locale.languageCode]!['title'];
  }

  String? get greeting {
    return _localizedValues[locale.languageCode]!['greeting'];
  }

  String? get switchButton {
    return _localizedValues[locale.languageCode]!['switchButton'];
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'bn'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) {
    return false;
  }
}
