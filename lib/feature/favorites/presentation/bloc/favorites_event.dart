part of 'favorites_bloc.dart';

abstract final class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

final class FavoritesFetched extends FavoritesEvent {
  const FavoritesFetched();

  @override
  List<Object> get props => [];
}

final class FavoriteButtonTapped extends FavoritesEvent {
  const FavoriteButtonTapped(this.manga);

  final MangaEntity manga;

  @override
  List<Object> get props => [manga];
}
