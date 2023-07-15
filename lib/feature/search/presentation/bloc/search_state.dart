part of 'search_bloc.dart';

enum SearchStatus { initial, loading, success, failure, noResult }

class SearchState extends Equatable {
  const SearchState({
    this.query,
    this.failure,
    this.status = SearchStatus.initial,
    this.mangas = const <MangaEntity>[],
  });

  final SearchStatus status;
  final List<MangaEntity> mangas;
  final String? query;
  final Failure? failure;

  @override
  List<Object?> get props => [status, mangas, query, failure];

  SearchState copyWith({
    SearchStatus? status,
    List<MangaEntity>? mangas,
    String? query,
    Failure? failure,
  }) {
    return SearchState(
      status: status ?? this.status,
      mangas: mangas ?? this.mangas,
      query: query ?? this.query,
      failure: failure ?? this.failure,
    );
  }
}
