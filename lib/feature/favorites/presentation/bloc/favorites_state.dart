part of 'favorites_bloc.dart';

enum FavoritesStatus { loading, success, failure, empty }

final class FavoritesState extends Equatable {
  const FavoritesState({
    this.failure,
    this.status = FavoritesStatus.loading,
    this.mangas = const <MangaEntity>[],
  });

  final Failure? failure;
  final FavoritesStatus status;
  final List<MangaEntity> mangas;

  @override
  List<Object?> get props => [failure, status, mangas];

  FavoritesState copyWith({
    Failure? failure,
    FavoritesStatus? status,
    List<MangaEntity>? mangas,
  }) {
    return FavoritesState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      mangas: mangas ?? this.mangas,
    );
  }
}
