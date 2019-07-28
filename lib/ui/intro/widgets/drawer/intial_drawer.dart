import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';

import 'drawer_item.dart';
import '../../bloc/bloc.dart';

class InitialDrawer extends HookWidget {
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

    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, state) {
        return Column(
          children: <Widget>[
            DrawerItem(
              first: true,
              icon: Icons.person_outline,
              text: "Le***an",
              endIcon: Icons.keyboard_arrow_down,
              onPress: () =>
                  Provider.of<DrawerBloc>(context).dispatch(ShowAccount()),
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: state is! UserAccount
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      key: Key(state.toString()),
                      children: <Widget>[
                        ...zip([initialOptionsText, initialOptionsIcons])
                            .map((iter) => DrawerItem(
                                  icon: iter[1],
                                  text: iter[0],
                                ))
                      ],
                    )
                  : DrawerItem(
                      icon: Icons.settings,
                      text: locale.manageAccount,
                    ),
            ),
          ],
        );
      },
    );
  }
}
