import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:maybank2u/widgets/circle_image.dart';

class Login extends HookWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  Login({
    Key key,
    @required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _TopBar(
            scaffoldKey: scaffoldKey,
          ),
          Spacer(),
          CircleImage(
              image: NetworkImage(
                  "https://i.pinimg.com/originals/9f/a9/09/9fa909dfc88576fbe4c73e6bbffbe753.png")),
          Text(
            locale.goodMorning.toUpperCase(),
            style: Theme.of(context).textTheme.headline,
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.white)),
            child: Text(
              'Secret Phrase',
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
          Spacer(),
          _LoginButton(),
          Spacer(),
        ],
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.white,
        width: 2,
      ))),
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 5),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(locale.login, style: Theme.of(context).textTheme.headline),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.fingerprint,
                size: 35,
                color: Colors.white,
              ),
            )
          ],
        ),
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
  }
}
