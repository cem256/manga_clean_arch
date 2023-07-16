import 'package:manga_clean_arch/feature/favorites/data/datasources/local/favorites_cache_client.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

class FavoritesLocalDataSource {
  FavoritesLocalDataSource({required FavoritesCacheClient cacheClient}) : _cacheClient = cacheClient;

  final FavoritesCacheClient _cacheClient;

  List<MangaEntity> getFavorites() {
    return _cacheClient.getAll() ?? <MangaEntity>[];
  }

  Future<void> addToFavorites(MangaEntity item) async {
    await _cacheClient.add(item);
  }

  Future<void> removeFromFavorites(int index) async {
    await _cacheClient.deleteAt(index);
  }
}
