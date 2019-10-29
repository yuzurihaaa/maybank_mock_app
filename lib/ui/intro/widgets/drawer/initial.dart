import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:quiver/iterables.dart';

import 'item.dart';
import 'main_drawer.dart';

class Initial extends HookWidget {
  final ValueNotifier<DrawerState> state;
  final VoidCallback onClickProfile;

  Initial({
    Key key,
    this.state,
    this.onClickProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context);

    final List<String> initialOptionsText = [
      locale.applyOnline,
      locale.needHelp,
      locale.promotions,
      locale.receiveMobileTransfer,
    ];

    final List<IconData> initialOptionsIcons = [
      Icons.add_circle_outline,
      Icons.info_outline,
      Icons.lightbulb_outline,
      Icons.phone_android,
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Item(
          key: Key('account'),
          first: true,
          icon: Icons.person_outline,
          text: "Le***an",
          endIcon: Icons.keyboard_arrow_down,
          onPress: onClickProfile,
        ),
        AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              key: Key(state.toString()),
              children: <Widget>[
                if (state.value != DrawerState.Profile)
                  ...zip([initialOptionsText, initialOptionsIcons])
                      .map((iter) => Item(
                            key: Key(iter[0]),
                            icon: iter[1],
                            text: iter[0],
                          ))
                else
                  Item(
                    key: Key('manage account'),
                    icon: Icons.settings,
                    text: locale.manageAccount,
                  )
              ],
            )),
      ],
    );
  }
}
