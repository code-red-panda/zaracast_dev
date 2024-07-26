class SearchPodcastsParams {
  const SearchPodcastsParams(this.searchTerm, {this.maxResults = 1000});

  final String searchTerm;
  final int maxResults;

  Map<String, dynamic> toJson() {
    return {
      'q': searchTerm,
      'max': '$maxResults',
    };
  }
}
