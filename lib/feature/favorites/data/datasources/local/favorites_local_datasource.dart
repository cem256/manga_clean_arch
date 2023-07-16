import 'package:manga_clean_arch/feature/favorites/data/datasources/local/favorites_cache_client.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

abstract interface class FavoritesLocalDataSource {
  List<MangaEntity> getFavorites();
  Future<void> addToFavorites(MangaEntity item);
  Future<void> removeFromFavorites(int index);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  FavoritesLocalDataSourceImpl({required FavoritesCacheClient cacheClient}) : _cacheClient = cacheClient;

  final FavoritesCacheClient _cacheClient;

  @override
  List<MangaEntity> getFavorites() {
    return _cacheClient.getAll() ?? <MangaEntity>[];
  }

  @override
  Future<void> addToFavorites(MangaEntity item) async {
    await _cacheClient.add(item);
  }

  @override
  Future<void> removeFromFavorites(int index) async {
    await _cacheClient.deleteAt(index);
  }
}
