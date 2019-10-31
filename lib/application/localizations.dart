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

  String get copyright {
    return Intl.message(
      '©  MAYBANK2U - Mock',
      name: 'copyright',
      desc: 'copyright text',
    );
  }

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
      name: 'qrPay',
      desc: 'qrPay text',
    );
  }

  String get rayaReturns {
    return Intl.message(
      'Raya Returns',
      name: 'rayaReturns',
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
      name: 'applyOnline',
      desc: 'apply online text',
    );
  }

  String get needHelp {
    return Intl.message(
      'Need Help?',
      name: 'needHelp',
      desc: 'need Help text',
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

  String get termsCondition {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsCondition',
      desc: 'termsCondition text',
    );
  }

  String get securityTips {
    return Intl.message(
      'Cecurity Tips',
      name: 'securityTips',
      desc: 'securityTips text',
    );
  }

  String get privacyNotice {
    return Intl.message(
      'Privacy Notice',
      name: 'privacyNotice',
      desc: 'privacyNotice text',
    );
  }

  String get secretPhrase {
    return Intl.message(
      'Secret Phrase',
      name: 'secretPhrase',
      desc: 'secretPhrase text',
    );
  }

  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: 'all text',
    );
  }

  String get transaction {
    return Intl.message(
      'Transaction',
      name: 'transaction',
      desc: 'transaction text',
    );
  }

  String get myMessages {
    return Intl.message(
      'My Messages',
      name: 'myMessages',
      desc: 'myMessages text',
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
