import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:manga_clean_arch/app/env/env.dart';
import 'package:manga_clean_arch/core/utils/observers/custom_bloc_observer.dart';
import 'package:manga_clean_arch/locator.dart';
import 'package:path_provider/path_provider.dart';

abstract class AppInitializer {
  static Future<void> initialize() async {
    // Initialize Bloc Observer
    Bloc.observer = CustomBlocObserver();

    // Initialize Hydrated Bloc for Caching Theme Preference
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
    // Set Screen Orientation
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    // Initialize Hive
    await Hive.initFlutter();
    // Initialize Locator
    await Locator.locateServices(baseUrl: Env.baseUrl);
    // Initialize Localization
    await EasyLocalization.ensureInitialized();
  }
}
