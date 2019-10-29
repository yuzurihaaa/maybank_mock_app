import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';

import 'drawer.dart';

enum DrawerState { Initial, About, Profile }

class MainDrawer extends HookWidget {
  final VoidCallback closeDrawer;

  MainDrawer({
    Key key,
    this.closeDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context);

    final ValueNotifier<DrawerState> state =
        useState<DrawerState>(DrawerState.Initial);

    final animateIcon = useAnimationController(
      duration: Duration(milliseconds: 400),
    );

    _changeView(DrawerState target) {
      animateIcon.forward();
      state.value = target;
    }

    _reverseView(DrawerState target) {
      animateIcon.reverse();
      state.value = target;
    }

    String title = locale.goodMorning;
    if (state.value == DrawerState.Initial) {
      title = locale.goodMorning;
    }

    if (state.value == DrawerState.About) {
      title = locale.about;
    }

    return Drawer(
      child: Stack(
        children: <Widget>[
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.5), BlendMode.srcATop),
            child: Image.network(
              'https://images4.alphacoders.com/117/thumb-350-11718.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          ShaderMask(
            shaderCallback: (rect) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, -.3),
              colors: [Colors.transparent, Colors.black, Colors.black],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height)),
            blendMode: BlendMode.dstIn,
            child: Container(
              color: Colors.black,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          key: Key('close button'),
                          onPressed: () {
                            if (state.value == DrawerState.Initial) {
                              closeDrawer();
                              animateIcon.forward();
                            } else {
                              _reverseView(DrawerState.Initial);
                            }
                          },
                          icon: AnimatedIcon(
                            icon: AnimatedIcons.menu_arrow,
                            progress: animateIcon,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 400),
                        child: (state.value == DrawerState.Initial ||
                                state.value == DrawerState.Profile)
                            ? Initial(
                                key: Key('initial drawer'),
                                state: state,
                                onClickProfile: () =>
                                    state.value == DrawerState.Profile
                                        ? _reverseView(DrawerState.Initial)
                                        : _changeView(DrawerState.Profile),
                              )
                            : About(),
                      ),
                    ),
                    if (state.value == DrawerState.Initial)
                      FlatButton(
                        key: Key('about button'),
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Item(
                          onPress: () => _changeView(DrawerState.About),
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
        ],
      ),
    );
  }
}
