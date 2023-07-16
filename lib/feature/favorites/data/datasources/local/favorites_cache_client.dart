import 'package:hive_flutter/adapters.dart';
import 'package:manga_clean_arch/app/constants/cache_constants.dart';
import 'package:manga_clean_arch/core/clients/cache/cache_client_interface.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/image_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/image/jpg/jpg_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

class FavoritesCacheClient extends CacheClientInterface<MangaEntity> {
  @override
  String get boxName => CacheConstants.favoritesBox;

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(CacheConstants.mangaEntityTypeId)) {
      Hive
        ..registerAdapter(MangaEntityAdapter())
        ..registerAdapter(ImageEntityAdapter())
        ..registerAdapter(JpgEntityAdapter());
    }
  }
}
