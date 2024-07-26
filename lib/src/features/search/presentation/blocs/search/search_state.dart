part of 'search_bloc.dart';

@immutable
sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  const SearchLoaded(this.podcastEntities);

  final List<PodcastEntity> podcastEntities;

  @override
  List<Object> get props => [podcastEntities];
}

class SearchError extends SearchState {
  const SearchError(this.userMessage);

  final String userMessage;

  @override
  List<Object> get props => [userMessage];
}
