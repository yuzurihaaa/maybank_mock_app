import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:maybank2u/widgets/circle_image.dart';

class Login extends HookWidget {

  const Login({
    Key key,
    @required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

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
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(10),
            child: const CircleImage(
              image: NetworkImage(
                'https://i.pinimg.com/originals/9f/a9/09/9fa909dfc88576fbe4c73e6bbffbe753.png',
              ),
            ),
          ),
          Text(
            locale.goodMorning.toUpperCase(),
            style: Theme.of(context).textTheme.headline,
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: Colors.white)),
            child: Text(
              locale.secretPhrase,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ),
          const Spacer(),
          const _LoginButton(),
          const Spacer(),
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
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(horizontal: 5),
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
  const _TopBar({Key key, this.scaffoldKey}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          key: const Key('drawer button'),
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
