part of 'popular_bloc.dart';

final class PopularState extends Equatable {
  const PopularState({
    this.failure,
    this.status = ViewStatus.loading,
    this.mangas = const <MangaEntity>[],
    this.hasReachedMax = false,
  });

  final ViewStatus status;
  final List<MangaEntity> mangas;
  final bool hasReachedMax;
  final Failure? failure;

  @override
  List<Object?> get props => [status, mangas, hasReachedMax, failure];

  PopularState copyWith({
    ViewStatus? status,
    List<MangaEntity>? mangas,
    bool? hasReachedMax,
    Failure? failure,
  }) {
    return PopularState(
      failure: failure ?? this.failure,
      status: status ?? this.status,
      mangas: mangas ?? this.mangas,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
