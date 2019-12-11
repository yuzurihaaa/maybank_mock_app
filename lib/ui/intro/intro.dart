import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:maybank2u/icons/images.dart';
import 'package:maybank2u/icons/my_flutter_app_icons.dart';
import 'package:maybank2u/ui/intro/widgets/login.dart';
import 'package:maybank2u/ui/intro/widgets/secure2u.dart';
import 'package:maybank2u/util/hook/page_controller_hook.dart';

import 'widgets/drawer/main_drawer.dart';
import 'widgets/inbox.dart';

class Intro extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _currentIndex = useState<int>(0);
    final _scaffoldKey =
        useState<GlobalKey<ScaffoldState>>(GlobalKey<ScaffoldState>());

    final _pageController = usePageController();

    final TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    final List<Widget> _widgetOptions = <Widget>[
      Login(
        key: const Key('login'),
        scaffoldKey: _scaffoldKey.value,
      ),
      Inbox(),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 3: School',
        style: optionStyle,
      ),
      Secure2u(onPressCancel: () {
        _pageController.animateTo(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
        _currentIndex.value = 0;
      }),
    ];

    return Scaffold(
        backgroundColor: _currentIndex.value >= _widgetOptions.length - 1
            ? Colors.yellowAccent
            : Colors.black,
        key: _scaffoldKey.value,
        drawer: _currentIndex.value == 0
            ? MainDrawer(
                closeDrawer: () => Navigator.pop(context),
              )
            : null,
        body: SafeArea(
          key: const Key('introBody'),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: backgroundOneUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                errorWidget: (context, url, error) {
                  print(error);
                  return Container(
                    color: Colors.red,
                  );
                },
              ),
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _widgetOptions,
              )
            ],
          ),
        ),
        bottomNavigationBar: _BottomNavigation(
          currentIndex: _currentIndex.value,
          onTap: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(seconds: 1),
              curve: Curves.ease,
            );
            _currentIndex.value = index;
          },
        ));
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation({
    Key key,
    this.currentIndex,
    this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Colors.black, primaryColor: Colors.red),
      child: BottomNavigationBar(
        key: const Key('bottomNavigationBar'),
        currentIndex: currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text(locale.login),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.mail_outline),
            title: Text(locale.inbox),
          ),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.qrcode),
            title: Text(locale.qrPay),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            title: Text(locale.rayaReturns),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.security),
            title: Text(locale.secure2u),
          ),
        ],
      ),
    );
  }
}
