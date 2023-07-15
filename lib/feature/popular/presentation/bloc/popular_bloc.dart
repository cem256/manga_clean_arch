import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/constants/duration_constants.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/core/enums/view_status.dart';
import 'package:manga_clean_arch/core/utils/event_transformer/event_tranformer_utils.dart';
import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';
import 'package:manga_clean_arch/feature/popular/domain/usecases/uc_get_popular_mangas.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc({required UCGetPopularMangas getPopularMangas})
      : _getPopularMangas = getPopularMangas,
        super(const PopularState()) {
    on<MangasFetched>(
      _onMangasFetched,
      transformer: EventTransformerUtils.throttle(DurationConstants.medium()),
    );
  }

  int _page = 1;
  final int _limit = 20;

  final UCGetPopularMangas _getPopularMangas;

  Future<void> _onMangasFetched(MangasFetched event, Emitter<PopularState> emit) async {
    if (state.hasReachedMax) return;
    if (state.status == ViewStatus.loading) {
      final result = await _getPopularMangas(page: _page, limit: _limit);
      return result.fold((failure) => emit(state.copyWith(status: ViewStatus.failure, failure: failure)), (success) {
        _page++;
        emit(
          success.isEmpty
              ? state.copyWith(hasReachedMax: true)
              : state.copyWith(
                  status: ViewStatus.success,
                  mangas: List.of(state.mangas)..addAll(success),
                  hasReachedMax: false,
                ),
        );
      });
    }

    final result = await _getPopularMangas(page: _page, limit: _limit);
    result.fold((failure) => emit(state.copyWith(status: ViewStatus.failure, failure: failure)), (success) {
      _page++;
      emit(
        success.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: ViewStatus.success,
                mangas: List.of(state.mangas)..addAll(success),
                hasReachedMax: false,
              ),
      );
    });
  }
}
