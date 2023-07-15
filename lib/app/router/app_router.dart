import 'package:auto_route/auto_route.dart';
import 'package:manga_clean_arch/app/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AdaptiveRoute> get routes => [
        AdaptiveRoute(
          initial: true,
          page: NavbarRoute.page,
          children: [
            AdaptiveRoute(
              initial: true,
              page: PopularRoute.page,
            ),
            AdaptiveRoute(
              page: FavoritesRoute.page,
            )
          ],
        ),
        AdaptiveRoute(page: SearchRoute.page),
        AdaptiveRoute(page: DetailRoute.page),
      ];
}
