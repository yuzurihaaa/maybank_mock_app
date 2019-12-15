import 'package:flutter/widgets.dart';

String convertDigitToDoubleDigit(num input) {
  if (input < 10) {
    return '0$input';
  }

  return '$input';
}

void postFrameCallback(Function callback) {
  WidgetsBinding.instance.addPostFrameCallback((_) => callback());
}
