import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

part 'navigator_screen.dart';

class CustomNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final FluroRouter router = FluroRouter.appRouter;
  static const defaultTransition = TransitionType.inFromLeft;
  static const initRoute = "/";

  static Future? _replace({
    required BuildContext context,
    required Widget widget,
    required String path,
    TransitionType? transition = defaultTransition,
  }) {
    final route = ModalRoute?.of(context)?.settings.name ?? '';
    final targetPath = '${(route.split('/')..removeLast()..add(path)).join('/')}';
    return router.navigateTo(context, targetPath, transition: transition, replace: true);
  }

  static Future? _post({
    required BuildContext context,
    required Widget widget,
    required String path,
    TransitionType? transition = defaultTransition,
  }) {
    final route = ModalRoute?.of(context)?.settings.name ?? '';
    final targetPath = '${(route.split('/')..add(path)).join('/')}';
    return router.navigateTo(context, targetPath, transition: transition);
  }

  static Future? _setAsBaseScreen({
    required Widget widget,
    required String path,
    TransitionType? transition = defaultTransition,
  }) {
    final state = navigatorKey.currentState;
    _defineRoute(path, transition);
    return state?.pushNamedAndRemoveUntil(
      path,
      (_) => false,
      arguments: widget,
    );
  }

  static void _defineRoute(String path, TransitionType? transition) {
    router.define(path, handler: Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      if (context != null) {
        return ModalRoute.of(context)?.settings.arguments as Widget;
      }
    }), transitionType: transition);
  }
}
