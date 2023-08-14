import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/init/app_initialize.dart';
import 'package:manga_clean_arch/app/l10n/app_l10n.dart';
import 'package:manga_clean_arch/app/router/app_router.dart';
import 'package:manga_clean_arch/app/router/custom_route_observer.dart';
import 'package:manga_clean_arch/app/theme/cubit/theme_cubit.dart';
import 'package:manga_clean_arch/app/theme/dark/app_theme_dark.dart';
import 'package:manga_clean_arch/app/theme/light/app_theme_light.dart';
import 'package:manga_clean_arch/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:manga_clean_arch/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitialize.initialize();

  runApp(
    EasyLocalization(
      path: AppL10n.path,
      supportedLocales: AppL10n.supportedLocales,
      fallbackLocale: AppL10n.en,
      child: MangaAppCleanArch(),
    ),
  );
}

class MangaAppCleanArch extends StatelessWidget {
  MangaAppCleanArch({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Injecting ThemeCubit and FavoritesBloc to the widget tree
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<FavoritesBloc>(
          create: (_) => Locator.instance<FavoritesBloc>()..add(const FavoritesFetched()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,

            // Theme
            theme: AppThemeLight().theme,
            darkTheme: AppThemeDark().theme,
            themeMode: themeState.themeMode,

            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,

            // Routing
            routerConfig: _appRouter.config(
              navigatorObservers: () => [CustomRouteObserver()],
            ),
          );
        },
      ),
    );
  }
}
