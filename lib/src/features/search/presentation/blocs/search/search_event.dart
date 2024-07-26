part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchPodcastsEvent extends SearchEvent {
  const SearchPodcastsEvent(this.params);

  final SearchPodcastsParams params;

  @override
  List<Object> get props => [params];
}

class ClearSearchEvent extends SearchEvent {
  const ClearSearchEvent();
}
