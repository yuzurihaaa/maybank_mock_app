import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';

import 'drawer.dart';

class About extends HookWidget {

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Item(
          first: true,
          text: locale.termsCondition,
          endIcon: Icons.navigate_next,
        ),
        Item(text: locale.securityTips),
        Item(text: locale.privacyNotice),
        Spacer(),
        Text(
          locale.copyright,
          style: Theme.of(context).textTheme.subtitle.copyWith(
                color: Colors.grey[700],
              ),
        )
      ],
    );
  }
}
