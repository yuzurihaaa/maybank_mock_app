import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:provider/provider.dart';

import '../../bloc/bloc.dart';
import 'drawer_item.dart';
import 'intial_drawer.dart';

class LoginDrawer extends StatefulWidget {
  final DrawerBloc bloc;

  final VoidCallback closeDrawer;

  LoginDrawer({
    Key key,
    this.bloc,
    this.closeDrawer,
  }) : super(key: key);

  @override
  _LoginDrawerState createState() => _LoginDrawerState();
}

class _LoginDrawerState extends State<LoginDrawer> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context);

    return Provider<DrawerBloc>(
      builder: (BuildContext context) => widget.bloc,
      dispose: (context, bloc) => bloc.dispose(),
      child: BlocBuilder<DrawerBloc, DrawerState>(
        builder: (context, state) {
          String title = locale.goodMorning;
          if (state is InitialDrawerState) {
            title = locale.goodMorning;
          }

          if (state is AboutState) {
            title = locale.about;
          }

          return Drawer(
            child: Container(
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            if (widget.bloc.currentState is InitialDrawerState) {
                              widget.closeDrawer();
                            }

                            widget.bloc.dispatch(ShowPrevious());
                          },
                          icon: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Center(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                    ),
                    if (widget.bloc.currentState is InitialDrawerState ||
                        widget.bloc.currentState is UserAccount)
                      InitialDrawer(),
                    Text("TEST"),
                    Spacer(),
                    if (widget.bloc.currentState is InitialDrawerState)
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: DrawerItem(
                          onPress: () => widget.bloc.dispatch(ShowAbout()),
                          first: true,
                          icon: Icons.business,
                          text: locale.about,
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
