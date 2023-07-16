import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:manga_clean_arch/app/env/env.dart';
import 'package:manga_clean_arch/app/router/app_router.dart';
import 'package:manga_clean_arch/app/router/custom_route_observer.dart';
import 'package:manga_clean_arch/app/theme/cubit/theme_cubit.dart';
import 'package:manga_clean_arch/app/theme/dark/app_theme_dark.dart';
import 'package:manga_clean_arch/app/theme/light/app_theme_light.dart';
import 'package:manga_clean_arch/core/utils/observers/custom_bloc_observer.dart';
import 'package:manga_clean_arch/feature/favorites/presentation/bloc/favorites_bloc.dart';
import 'package:manga_clean_arch/locator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // Set Portrait Orientation
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  // Load Environtment Variables
  await dotenv.load(fileName: Env.fileName);
  // Initialize Hive
  await Hive.initFlutter();
  // Initialize Locator
  await Locator.locateServices(baseUrl: Env.baseUrl);

  runApp(MangaAppCleanArch());
}

class MangaAppCleanArch extends StatelessWidget {
  MangaAppCleanArch({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
