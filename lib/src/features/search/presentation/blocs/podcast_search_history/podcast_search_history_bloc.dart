import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/params/create_podcast_search_params.dart';
import 'package:zaracast/src/features/search/domain/use_cases/create_podcast_search_use_case.dart';
import 'package:zaracast/src/features/search/domain/use_cases/delete_podcast_search_use_case.dart';
import 'package:zaracast/src/features/search/domain/use_cases/stream_podcast_search_use_case.dart';
import 'package:zaracast/src/shared/data/params/no_params.dart';

part 'podcast_search_history_event.dart';
part 'podcast_search_history_state.dart';

class PodcastSearchHistoryBloc
    extends Bloc<PodcastSearchHistoryEvent, PodcastSearchHistoryState> {
  PodcastSearchHistoryBloc(
    CreatePodcastSearchUseCase createPodcastSearchUseCase,
    DeletePodcastSearchUseCase deletePodcastSearchUseCase,
    StreamPodcastSearchUseCase streamPodcastSearchUseCase,
  )   : _createPodcastSearchUseCase = createPodcastSearchUseCase,
        _deletePodcastSearchUseCase = deletePodcastSearchUseCase,
        _streamPodcastSearchUseCase = streamPodcastSearchUseCase,
        super(const PodcastSearchHistoryIninital()) {
    on<CreatePodcastSearchEvent>(_onCreatePodcastSearch);
    on<DeletePodcastSearchEvent>(_onDeletePodcastSearch);
    on<StreamPodcastSearchEvent>(_onStreamPodcastSearch);
    on<_StreamUpdatePodcastSearchEvent>(_onStreamUpdatePodcastSearch);

    // Initialize the bloc
    add(const StreamPodcastSearchEvent());
  }

  final CreatePodcastSearchUseCase _createPodcastSearchUseCase;
  final DeletePodcastSearchUseCase _deletePodcastSearchUseCase;
  final StreamPodcastSearchUseCase _streamPodcastSearchUseCase;
  StreamSubscription<List<PodcastEntity>>? _podcastSearchSubscription;

  @override
  Future<void> close() async {
    await _podcastSearchSubscription?.cancel();
    return super.close();
  }

  Future<void> _onCreatePodcastSearch(
    CreatePodcastSearchEvent event,
    Emitter<PodcastSearchHistoryState> emit,
  ) async {
    final result = await _createPodcastSearchUseCase.call(event.params);

    if (result.isLeft) {
      emit(PodcastSearchHistoryError(result.left.userMessage));
    }
  }

  Future<void> _onDeletePodcastSearch(
    DeletePodcastSearchEvent event,
    Emitter<PodcastSearchHistoryState> emit,
  ) async {
    final result = await _deletePodcastSearchUseCase.call(const NoParams());

    if (result.isLeft) {
      emit(PodcastSearchHistoryError(result.left.userMessage));
    }
  }

  void _onStreamPodcastSearch(
    StreamPodcastSearchEvent event,
    Emitter<PodcastSearchHistoryState> emit,
  ) {
    unawaited(_podcastSearchSubscription?.cancel());

    final result = _streamPodcastSearchUseCase.call(const NoParams());

    // ignore: cascade_invocations
    result.fold(
      (failure) => emit(PodcastSearchHistoryError(failure.userMessage)),
      (stream) {
        _podcastSearchSubscription = stream.listen(
          (podcasts) {
            add(_StreamUpdatePodcastSearchEvent(podcasts));
          },
          onError: (Object error) {
            if (kDebugMode) {
              debugPrint('_onStreamPodcastSearch() unhandled error: $error');
            }
          },
        );
      },
    );
  }

  void _onStreamUpdatePodcastSearch(
    _StreamUpdatePodcastSearchEvent event,
    Emitter<PodcastSearchHistoryState> emit,
  ) {
    emit(PodcastSearchHistoryLoaded(event.podcastEntities));
  }
}
