// ignore_for_file: prefer_final_locals
// ignore_for_file: always_specify_types
// ignore_for_file: always_put_control_body_on_new_line
// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(dynamic _) => <String, Function> {
    "about" : MessageLookupByLibrary.simpleMessage("About"),
    "applyOnline" : MessageLookupByLibrary.simpleMessage("Apply Online"),
    "copyright" : MessageLookupByLibrary.simpleMessage("©  MAYBANK2U - Mock"),
    "goodMorning" : MessageLookupByLibrary.simpleMessage("Good Morning"),
    "inbox" : MessageLookupByLibrary.simpleMessage("Inbox"),
    "login" : MessageLookupByLibrary.simpleMessage("Login"),
    "manageAccount" : MessageLookupByLibrary.simpleMessage("Manage Account"),
    "needHelp" : MessageLookupByLibrary.simpleMessage("Need Help?"),
    "privacyNotice" : MessageLookupByLibrary.simpleMessage("Privacy Notice"),
    "promotions" : MessageLookupByLibrary.simpleMessage("Promotions"),
    "qrPay" : MessageLookupByLibrary.simpleMessage("QrPay"),
    "rayaReturns" : MessageLookupByLibrary.simpleMessage("Raya Returns"),
    "receiveMobileTransfer" : MessageLookupByLibrary.simpleMessage("Receive Mobile Transfer"),
    "secretPhrase" : MessageLookupByLibrary.simpleMessage("Secret Phrase"),
    "secure2u" : MessageLookupByLibrary.simpleMessage("secure2u"),
    "securityTips" : MessageLookupByLibrary.simpleMessage("Cecurity Tips"),
    "termsCondition" : MessageLookupByLibrary.simpleMessage("Terms & Conditions"),
    "title" : MessageLookupByLibrary.simpleMessage("Maybank2u")
  };
}
