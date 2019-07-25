import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';

class Login extends HookWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  Login({
    Key key,
    @required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _TopBar(
            scaffoldKey: scaffoldKey,
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _TopBar({Key key, this.scaffoldKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => scaffoldKey.currentState.openDrawer()),
        Expanded(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow[600],
                    maxRadius: 15,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).title,
                  style: Theme.of(context).textTheme.title.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[600],
                      fontSize: 30),
                )
              ],
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.person_outline),
          onPressed: () {},
        ),
      ],
    );
    ;
  }
}
