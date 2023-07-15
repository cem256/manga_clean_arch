import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/constants/duration_constants.dart';

import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/core/utils/event_transformer/event_tranformer_utils.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/search/domain/usecases/uc_search_mangas.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required UCSearchMangas searchMangas})
      : _searchMangas = searchMangas,
        super(const SearchState()) {
    on<SearchQueryChanged>(
      _onSearchQueryChanged,
      transformer: EventTransformerUtils.debounce(DurationConstants.short()),
    );
    on<SearchFieldCleared>(_onSearchFieldCleared);
  }

  final UCSearchMangas _searchMangas;

  Future<void> _onSearchQueryChanged(SearchQueryChanged event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) return;
    emit(state.copyWith(status: SearchStatus.loading));
    final result = await _searchMangas(query: event.query);

    if (!isClosed) {
      result.fold((failure) => emit(state.copyWith(status: SearchStatus.failure)), (success) {
        if (success.isEmpty) {
          emit(state.copyWith(status: SearchStatus.noResult, query: event.query));
        } else {
          emit(state.copyWith(status: SearchStatus.success, mangas: success, query: event.query));
        }
      });
    }
  }

  void _onSearchFieldCleared(SearchFieldCleared event, Emitter<SearchState> emit) {
    emit(const SearchState());
  }
}
