import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

PageController usePageController({
  int initialPage = 0,
  bool keepPage = true,
  double viewportFraction = 1.0,
}) =>
    Hook.use(_PageControllerHook(
      initialPage: initialPage,
      keepPage: keepPage,
      viewportFraction: viewportFraction,
    ));

class _PageControllerHook extends Hook<PageController> {
  final int initialPage;
  final bool keepPage;
  final double viewportFraction;

  const _PageControllerHook({
    this.initialPage = 0,
    this.keepPage = true,
    this.viewportFraction = 1.0,
  });

  @override
  HookState<PageController, Hook<PageController>> createState() =>
      _PageControllerHookState();
}

class _PageControllerHookState
    extends HookState<PageController, _PageControllerHook> {
  PageController _pageController;

  @override
  PageController build(BuildContext context) {
    return _pageController ??= PageController(
      initialPage: hook.initialPage,
      keepPage: hook.keepPage,
      viewportFraction: hook.viewportFraction,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
  }
}
