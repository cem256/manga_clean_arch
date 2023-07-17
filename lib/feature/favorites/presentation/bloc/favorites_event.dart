part of 'favorites_bloc.dart';

abstract final class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class FavoritesFetched extends FavoritesEvent {
  /// An event to fetch the favorites
  const FavoritesFetched();

  @override
  List<Object> get props => [];
}

final class FavoriteButtonTapped extends FavoritesEvent {
  /// An event to add or remove manga from favorites
  const FavoriteButtonTapped(this.manga);

  final MangaEntity manga;

  @override
  List<Object> get props => [manga];
}
