import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PageControllerHook extends Hook<PageController> {
  final int initialPage;
  final bool keepPage;
  final double viewportFraction;

  const PageControllerHook({
    this.initialPage = 0,
    this.keepPage = true,
    this.viewportFraction = 1.0,
  });

  @override
  HookState<PageController, Hook<PageController>> createState() =>
      _PageControllerHookState();
}

class _PageControllerHookState
    extends HookState<PageController, PageControllerHook> {
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
