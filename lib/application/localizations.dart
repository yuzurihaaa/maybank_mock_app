import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name = locale.countryCode != null
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  String get title {
    return Intl.message(
      'Maybank2u',
      name: 'title',
      desc: 'Title for the application',
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: 'login text',
    );
  }

  String get inbox {
    return Intl.message(
      'Inbox',
      name: 'inbox',
      desc: 'inbox text',
    );
  }

  String get qrPay {
    return Intl.message(
      'QrPay',
      name: 'qrpay',
      desc: 'qrpay text',
    );
  }

  String get rayaReturns {
    return Intl.message(
      'Raya Returns',
      name: 'raya_returns',
      desc: 'raya returns',
    );
  }

  String get secure2u {
    return Intl.message(
      'secure2u',
      name: 'secure2u',
      desc: 'secure2u text',
    );
  }

  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: 'good morning text',
    );
  }

  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: 'about text',
    );
  }

  String get applyOnline {
    return Intl.message(
      'Apply Online',
      name: 'applyOnelin',
      desc: 'apply online text',
    );
  }

  String get needHelp {
    return Intl.message(
      'Need Help?',
      name: 'applyOnelin',
      desc: 'apply online text',
    );
  }

  String get promotions {
    return Intl.message(
      'Promotions',
      name: 'promotions',
      desc: 'promotions text',
    );
  }

  String get receiveMobileTransfer {
    return Intl.message(
      'Receive Mobile Transfer',
      name: 'receiveMobileTransfer',
      desc: 'receiveMobileTransfer text',
    );
  }

  String get manageAccount {
    return Intl.message(
      'Manage Account',
      name: 'manageAccount',
      desc: 'manageAccount text',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}