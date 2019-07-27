import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

  final ImageProvider image;

  const CircleImage({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 125,
        height: 125,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 2),
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: image)));
  }
}
