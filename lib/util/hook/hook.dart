import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';

ValueNotifier<Duration> useTicker([Duration initialData]) {
  final result = useState<Duration>(initialData);

  useEffect(() {
    if (result.value.inSeconds <= 0) {
      return null;
    }
    final timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      result.value = getDuration(
        result.value.inMilliseconds,
        timer.tick * 1000,
      );
    });

    return timer.cancel;
  });

  return result;
}

@visibleForTesting
Duration getDuration(num source, num subtraction) {
  return Duration(
    milliseconds: source - subtraction,
  );
}

AppLocalizations useLocale() {
  final context = useContext();

  return AppLocalizations.of(context);
}
