String convertDigitToDoubleDigit(num input) {
  if (input < 10) {
    return '0$input';
  }

  return '$input';
}
