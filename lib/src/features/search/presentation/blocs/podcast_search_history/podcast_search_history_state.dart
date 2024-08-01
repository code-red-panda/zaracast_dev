part of 'podcast_search_history_bloc.dart';

@immutable
sealed class PodcastSearchHistoryState extends Equatable {
  const PodcastSearchHistoryState();

  @override
  List<Object> get props => [];
}

class PodcastSearchHistoryIninital extends PodcastSearchHistoryState {
  const PodcastSearchHistoryIninital();
}

class PodcastSearchHistoryLoading extends PodcastSearchHistoryState {
  const PodcastSearchHistoryLoading();
}

class PodcastSearchHistoryLoaded extends PodcastSearchHistoryState {
  const PodcastSearchHistoryLoaded(this.podcastEntities);

  final List<PodcastEntity> podcastEntities;

  @override
  List<Object> get props => [podcastEntities];
}

class PodcastSearchHistoryError extends PodcastSearchHistoryState {
  const PodcastSearchHistoryError(this.userMessage);

  final String userMessage;

  @override
  List<Object> get props => [userMessage];
}
