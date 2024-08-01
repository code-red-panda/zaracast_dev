part of 'podcast_search_history_bloc.dart';

sealed class PodcastSearchHistoryEvent extends Equatable {
  const PodcastSearchHistoryEvent();

  @override
  List<Object> get props => [];
}

class CreatePodcastSearchEvent extends PodcastSearchHistoryEvent {
  const CreatePodcastSearchEvent(this.params);

  final CreatePodcastSearchParams params;

  @override
  List<Object> get props => [params];
}

class DeletePodcastSearchEvent extends PodcastSearchHistoryEvent {
  const DeletePodcastSearchEvent();
}

class StreamPodcastSearchEvent extends PodcastSearchHistoryEvent {
  const StreamPodcastSearchEvent();

}

class _StreamUpdatePodcastSearchEvent extends PodcastSearchHistoryEvent {
  const _StreamUpdatePodcastSearchEvent(this.podcastEntities);

  final List<PodcastEntity> podcastEntities;
}
