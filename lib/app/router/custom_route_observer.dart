// ignore_for_file: strict_raw_type

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Custom route observer that logs all route changes
final class CustomRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('[AutoRoute] New route pushed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('[AutoRoute] Route popped: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    debugPrint('[AutoRoute] Route replaced: ${newRoute?.settings.name}, Old route: ${oldRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    debugPrint('[AutoRoute] Route removed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('[AutoRoute] Tab route initialized: ${route.name}, Previous tab route: ${previousRoute?.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('[AutoRoute] Tab route changed: ${route.name}, Previous tab route: ${previousRoute.name}');
  }
}
