// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:manga_clean_arch/feature/detail/presentation/view/detail_view.dart'
    as _i5;
import 'package:manga_clean_arch/feature/favorites/presentation/view/favorites_view.dart'
    as _i2;
import 'package:manga_clean_arch/feature/navbar/view/navbar_view.dart' as _i1;
import 'package:manga_clean_arch/feature/popular/presentation/view/popular_view.dart'
    as _i4;
import 'package:manga_clean_arch/feature/search/presentation/view/search_view.dart'
    as _i3;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    NavbarRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.NavbarView(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoritesView(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SearchView(),
      );
    },
    PopularRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PopularView(),
      );
    },
    DetailRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DetailView(),
      );
    },
  };
}

/// generated route for
/// [_i1.NavbarView]
class NavbarRoute extends _i6.PageRouteInfo<void> {
  const NavbarRoute({List<_i6.PageRouteInfo>? children})
      : super(
          NavbarRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavbarRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoritesView]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SearchView]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PopularView]
class PopularRoute extends _i6.PageRouteInfo<void> {
  const PopularRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PopularRoute.name,
          initialChildren: children,
        );

  static const String name = 'PopularRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DetailView]
class DetailRoute extends _i6.PageRouteInfo<void> {
  const DetailRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
