import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:maybank2u/icons/images.dart';
import 'package:maybank2u/icons/my_flutter_app_icons.dart';
import 'package:maybank2u/ui/intro/widgets/login.dart';
import 'package:maybank2u/util/hook/page_controller_hook.dart';

class Intro extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _currentIndex = useState<int>(0);
    final _scaffoldKey =
        useState<GlobalKey<ScaffoldState>>(GlobalKey<ScaffoldState>());

    final _pageController = Hook.use(PageControllerHook());

    final TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    final List<Widget> _widgetOptions = <Widget>[
      Login(
        key: Key('login'),
        scaffoldKey: _scaffoldKey.value,
      ),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 3: School',
        style: optionStyle,
      ),
      Text(
        'Index 4: School',
        style: optionStyle,
      ),
    ];

    final locale = AppLocalizations.of(context);

    return Scaffold(
        key: _scaffoldKey.value,
        backgroundColor: Colors.black,
        drawer: _currentIndex.value == 0
            ? Drawer(
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Text("TEST"),
                      Text("TEST"),
                      Text("TEST"),
                    ],
                  ),
                ),
              )
            : null,
        body: SafeArea(
          key: Key('introBody'),
          child: Stack(
            children: <Widget>[
              Image.network(
                backgroundOneUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _widgetOptions,
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          key: Key('bottomNavigationBar'),
          currentIndex: _currentIndex.value,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            _pageController.animateToPage(index,
                duration: Duration(seconds: 1), curve: Curves.ease);

            _currentIndex.value = index;
          },
          backgroundColor: Colors.red,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
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
              title: Text(locale.raya_returns),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              title: Text(locale.secure2u),
            ),
          ],
        ));
  }
}
