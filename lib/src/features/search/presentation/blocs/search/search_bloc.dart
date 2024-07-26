import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/features/search/domain/use_cases/search_podcasts_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(
    SearchPodcastsUseCase searchPodcasts,
  )   : _searchPodcastsUseCase = searchPodcasts,
        super(const SearchInitial()) {
    on<SearchPodcastsEvent>(_onSearchPodcasts);
    on<ClearSearchEvent>(_onClearSearch);
  }

  final SearchPodcastsUseCase _searchPodcastsUseCase;

  Future<void> _onSearchPodcasts(
    SearchPodcastsEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (state is SearchLoading) return;

    emit(const SearchLoading());

    final result = await _searchPodcastsUseCase.call(event.params);

    result.fold(
      (failure) => emit(SearchError(failure.userMessage)),
      (podcasts) {
        if (podcasts.isEmpty) {
          emit(const SearchError('No podcasts found'));
        }
        emit(SearchLoaded(podcasts));
      },
    );
  }

  void _onClearSearch(
    ClearSearchEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(const SearchInitial());
  }
}
