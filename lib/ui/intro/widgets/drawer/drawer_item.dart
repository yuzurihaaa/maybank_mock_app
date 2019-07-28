import 'package:flutter/material.dart';

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