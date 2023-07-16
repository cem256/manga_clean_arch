import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:manga_clean_arch/app/l10n/app_l10n.g.dart';
import 'package:manga_clean_arch/app/router/app_router.gr.dart';

@RoutePage()
class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        PopularRoute(),
        FavoritesRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.book),
              label: LocaleKeys.popular.tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: LocaleKeys.favorites.tr(),
            ),
          ],
        );
      },
    );
  }
}
