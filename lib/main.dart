import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:manga_clean_arch/app/env/env.dart';
import 'package:manga_clean_arch/app/router/app_router.dart';
import 'package:manga_clean_arch/app/theme/dark/app_theme_dark.dart';
import 'package:manga_clean_arch/app/theme/light/app_theme_light.dart';
import 'package:manga_clean_arch/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  // Load environment variables
  await dotenv.load(fileName: Env.fileName);
  // Initialize ServiceLocator
  ServiceLocator.init(baseUrl: Env.baseUrl);

  runApp(MangaAppCleanArch());
}

class MangaAppCleanArch extends StatelessWidget {
  MangaAppCleanArch({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      // Theme
      theme: AppThemeLight().theme,
      darkTheme: AppThemeDark().theme,

      // Routing
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
