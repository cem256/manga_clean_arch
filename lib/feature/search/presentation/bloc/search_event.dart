part of 'search_bloc.dart';

abstract final class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch the search results
final class SearchQueryChanged extends SearchEvent {
  const SearchQueryChanged({required this.query});

  final String query;
  @override
  List<Object> get props => [query];
}

/// Event to clear the search field
final class SearchFieldCleared extends SearchEvent {
  @override
  List<Object> get props => [];
}
