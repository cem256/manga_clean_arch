// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i8;
import 'package:manga_clean_arch/feature/detail/presentation/view/detail_view.dart'
    as _i1;
import 'package:manga_clean_arch/feature/favorites/presentation/view/favorites_view.dart'
    as _i2;
import 'package:manga_clean_arch/feature/navbar/view/navbar_view.dart' as _i3;
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart'
    as _i7;
import 'package:manga_clean_arch/feature/popular/presentation/view/popular_view.dart'
    as _i4;
import 'package:manga_clean_arch/feature/search/presentation/view/search_view.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailView(
          manga: args.manga,
          key: args.key,
        ),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoritesView(),
      );
    },
    NavbarRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.NavbarView(),
      );
    },
    PopularRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PopularView(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SearchView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailView]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    required _i7.MangaEntity manga,
    _i8.Key? key,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            manga: manga,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const _i6.PageInfo<DetailRouteArgs> page =
      _i6.PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    required this.manga,
    this.key,
  });

  final _i7.MangaEntity manga;

  final _i8.Key? key;

  @override
  String toString() {
    return 'DetailRouteArgs{manga: $manga, key: $key}';
  }
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
/// [_i3.NavbarView]
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
/// [_i5.SearchView]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
