part of 'search_bloc.dart';

abstract final class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

final class SearchQueryChanged extends SearchEvent {
  const SearchQueryChanged({required this.query});

  final String query;
  @override
  List<Object> get props => [query];
}

final class SearchFieldCleared extends SearchEvent {
  @override
  List<Object> get props => [];
}
