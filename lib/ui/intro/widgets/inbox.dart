import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';
import 'package:maybank2u/widgets/circle_image.dart';

class Inbox extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(_locale.inbox.toUpperCase()),
          bottom: _TabBar(),
        ),
        body: Container(
          color: Colors.white,
          child: TabBarView(
            children: <Widget>[
              _InboxList(),
              _InboxList(),
              _InboxList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: [
          Tab(
            text: _locale.all.toUpperCase(),
          ),
          Tab(
            text: _locale.transaction.toUpperCase(),
          ),
          Tab(
            text: _locale.myMessages.toUpperCase(),
          ),
        ],
      ),
    );
  }

  @override

  /// Refer `Size.fromHeight(_kTabHeight + indicatorWeight);`
  Size get preferredSize => const Size.fromHeight(46.0 + 2);
}

class _InboxList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        InboxItem(
          recipient: 'Transfer to PERSATUAN PENDUDUK S',
          amount: 'RM 40.00',
          time: '30 Oct 07:37 am',
        ),
      ],
    );
  }
}

@visibleForTesting
class InboxItem extends StatelessWidget {

  const InboxItem({
    Key key,
    this.time ='-',
    this.recipient ='-',
    this.amount = '-',
  }) : super(key: key);

  final String time;
  final String recipient;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const CircleImage(
            image: NetworkImage('https://img.freepik.com/free-vector/dollar_53876-25498.jpg?size=338&ext=jpg'),
            size: Size(50, 50),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ).copyWith(
                    top: 16,
                    bottom: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(time),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.flag,
                            color: Colors.black,
                          ),
                          const Text('Report')
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(recipient),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('Maybank ***3155'),
                      Text(
                        amount,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
