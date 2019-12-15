import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maybank2u/application/localizations.dart';

ValueNotifier<Duration> useTicker([Duration initialData]) {
  final result = useState<Duration>(initialData);

  useEffect(() {
    if (result.value.inSeconds < 0) {
      return null;
    }

    final timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
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

/// A custom hook that wraps the useState hook to add logging. Hooks can be
/// composed -- meaning you can use hooks within hooks!
ValueNotifier<T> useLoggedState<T>([T initialData]) {
  // First, call the useState hook. It will create a ValueNotifier for you that
  // rebuilds the Widget whenever the value changes.
  final result = useState<T>(initialData);

  // Next, call the useValueChanged hook to print the state whenever it changes
  useValueChanged(result.value, (T _, T __) {
    print(result.value);
  });

  return result;
}
