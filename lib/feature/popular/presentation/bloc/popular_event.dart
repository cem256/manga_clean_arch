part of 'popular_bloc.dart';

abstract final class PopularEvent extends Equatable {
  const PopularEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch the popular mangas
final class MangasFetched extends PopularEvent {
  @override
  List<Object> get props => [];
}
