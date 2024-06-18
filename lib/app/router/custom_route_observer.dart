// ignore_for_file: strict_raw_type

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:manga_clean_arch/core/utils/logger/logger_utils.dart';

/// Custom route observer that logs all route changes
final class CustomRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    LoggerUtils.instance.logInfo(
      '[AutoRoute] New route pushed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    LoggerUtils.instance
        .logInfo('[AutoRoute] Route popped: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    LoggerUtils.instance
        .logInfo('[AutoRoute] Route replaced: ${newRoute?.settings.name}, Old route: ${oldRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    LoggerUtils.instance
        .logInfo('[AutoRoute] Route removed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    LoggerUtils.instance
        .logInfo('[AutoRoute] Tab route initialized: ${route.name}, Previous tab route: ${previousRoute?.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    LoggerUtils.instance
        .logInfo('[AutoRoute] Tab route changed: ${route.name}, Previous tab route: ${previousRoute.name}');
  }
}
