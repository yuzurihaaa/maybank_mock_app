import 'package:flutter_test/flutter_test.dart';
import 'package:maybank2u/util/hook/hook.dart';
import 'package:maybank2u/util/util.dart';

void main() {
  test('Test convertDigitToDoubleDigit with double digit', () {
    const input = 10;

    expect(convertDigitToDoubleDigit(input), '10');
  });

  test('Test convertDigitToDoubleDigit with single digit', () {
    const input = 1;

    expect(convertDigitToDoubleDigit(input), '01');
  });

  test('getDuration test', () {
    expect(getDuration(10, 1), Duration(milliseconds: 9));
  });
}
