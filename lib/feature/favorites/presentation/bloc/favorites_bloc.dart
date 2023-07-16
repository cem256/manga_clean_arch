// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manga_clean_arch/app/errors/failures/failures.dart';
import 'package:manga_clean_arch/feature/favorites/domain/usecases/uc_add_or_remove_favorite.dart';
import 'package:manga_clean_arch/feature/favorites/domain/usecases/uc_get_favorites.dart';

import 'package:manga_clean_arch/feature/popular/domain/entities/manga/manga_entity.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({required UCGetFavorites getFavorites, required UCAddOrRemoveFavorite addOrRemoveFavorite})
      : _getFavorites = getFavorites,
        _addOrRemoveFavorite = addOrRemoveFavorite,
        super(const FavoritesState()) {
    on<FavoritesFetched>(_onFavoritesFetched);
    on<FavoriteButtonTapped>(_onFavoriteButtonTapped);
  }
  final UCGetFavorites _getFavorites;
  final UCAddOrRemoveFavorite _addOrRemoveFavorite;

  void _onFavoritesFetched(FavoritesFetched event, Emitter<FavoritesState> emit) {
    emit(state.copyWith(status: FavoritesStatus.loading));

    final response = _getFavorites();

    response.fold((l) => emit(state.copyWith(status: FavoritesStatus.failure)), (success) {
      success.isEmpty
          ? emit(state.copyWith(mangas: success, status: FavoritesStatus.empty))
          : emit(state.copyWith(status: FavoritesStatus.success, mangas: success));
    });
  }

  Future<void> _onFavoriteButtonTapped(FavoriteButtonTapped event, Emitter<FavoritesState> emit) async {
    final response = await _addOrRemoveFavorite(event.manga);

    response.fold((failure) => emit(state.copyWith(status: FavoritesStatus.failure)), (success) {
      success.isEmpty
          ? emit(state.copyWith(mangas: success, status: FavoritesStatus.empty))
          : emit(state.copyWith(mangas: success, status: FavoritesStatus.success));
    });
  }
}
