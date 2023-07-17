import 'package:manga_clean_arch/feature/favorites/data/datasources/local/favorites_cache_client.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

/// [FavoritesLocalDataSource] is a contract class which defines the methods
/// that any implementation of [FavoritesLocalDataSource] must implement.
abstract interface class FavoritesLocalDataSource {
  List<MangaEntity> getFavorites();
  Future<void> addToFavorites(MangaEntity item);
  Future<void> removeFromFavorites(int index);
}

final class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  FavoritesLocalDataSourceImpl({required FavoritesCacheClient cacheClient}) : _cacheClient = cacheClient;

  final FavoritesCacheClient _cacheClient;

  @override
  // Returns a list of [MangaEntity] from the cache. If the cache is empty,
  // returns an empty list.
  List<MangaEntity> getFavorites() {
    return _cacheClient.getAll() ?? <MangaEntity>[];
  }

  @override
  // Adds a [MangaEntity] to the cache.
  Future<void> addToFavorites(MangaEntity item) async {
    await _cacheClient.add(item);
  }

  @override
  // Removes a [MangaEntity] from the cache.
  Future<void> removeFromFavorites(int index) async {
    await _cacheClient.deleteAt(index);
  }
}
