import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';

import '../bloc/bloc.dart';

class LoginDrawer extends HookWidget {
  final DrawerBloc bloc;

  final VoidCallback closeDrawer;

  LoginDrawer({
    Key key,
    this.bloc,
    this.closeDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context);

    return Provider<DrawerBloc>(
      builder: (BuildContext context) => bloc,
      dispose: (context, bloc) => bloc.dispose(),
      child: Consumer<DrawerBloc>(
        builder: (context, bloc, _) => Drawer(
          child: Container(
            color: Colors.black,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          if (bloc.currentState is InitialDrawerState) {
                            closeDrawer();
                          }

                          bloc.dispatch(ShowPrevious());
                        },
                        icon: Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical:50),
                    child: Center(
                      child: Text(
                        locale.goodMorning,
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                  ),
                  if (bloc.currentState is InitialDrawerState) _InitialDrawer(),
                  Text("TEST"),
                  Spacer(),
                  if (bloc.currentState is InitialDrawerState)
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      child: DrawerItem(
                        first: true,
                        icon: Icons.business,
                        text: locale.about,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InitialDrawer extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context);

    final account = useState<bool>(false);

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
      children: <Widget>[
        DrawerItem(
          first: true,
          icon: Icons.person_outline,
          text: "Le***an",
          endIcon: Icons.keyboard_arrow_down,
          onPress: () => account.value = !account.value,
        ),
        AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          child: Column(
            key: Key(account.value.toString()),
            children: <Widget>[
              if (account.value)
                Container()
              else
                ...zip([initialOptionsText, initialOptionsIcons])
                    .map((iter) => DrawerItem(
                  icon: iter[1],
                  text: iter[0],
                ))
            ],
          ),
        ),
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool first;
  final IconData endIcon;
  final VoidCallback onPress;

  const DrawerItem({
    Key key,
    this.icon,
    this.text,
    this.first = false,
    this.endIcon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: Colors.grey[700]);
    return FlatButton(
      onPressed: onPress,
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            border: BorderDirectional(
          top: borderSide.copyWith(width: first ? 1 : 0),
          bottom: borderSide,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.grey[700],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
              ),
              if (endIcon != null) ...[
                Spacer(),
                Icon(
                  endIcon,
                  color: Colors.grey[700],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
