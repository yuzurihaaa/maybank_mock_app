import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final ImageProvider image;
  final Size size;

  const CircleImage({Key key, this.image, this.size = const Size(125, 125)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber, width: 2),
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: image,
        ),
      ),
    );
  }
}
