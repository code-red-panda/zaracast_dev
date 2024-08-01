import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/dependency_injection/search_singletons.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/features/search/presentation/blocs/podcast_search_history/podcast_search_history_bloc.dart';
import 'package:zaracast/src/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:zaracast/src/features/search/presentation/widgets/podcast_search_list_tile.dart';
import 'package:zaracast/src/shared/presentation/blocs/snack_bar/snack_bar_bloc.dart';

class PodcastSearchBar extends StatefulWidget {
  const PodcastSearchBar({super.key});

  @override
  State<PodcastSearchBar> createState() => _PodcastSearchBarState();
}

class _PodcastSearchBarState extends State<PodcastSearchBar> {
  late final SearchController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    _controller = SearchController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is SearchError) {
          context
              .read<SnackBarBloc>()
              .add(ShowSnackBarEvent(state.userMessage));

          _controller.clear();

          context.read<SearchBloc>().add(const ClearSearchEvent());
        } else if (state is SearchInitial) {
          _controller.clear();
        }
      },
      child: SearchAnchor(
        keyboardType: TextInputType.text,
        searchController: _controller,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.search,
        viewHintText: 'Search for podcasts...',
        viewLeading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_controller.isAttached) {
              _controller.closeView(null);
            }

            _focusNode.unfocus();
          },
        ),
        viewTrailing: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
            },
          ),
        ],
        viewOnSubmitted: (value) {
          if (value.isNotEmpty) {
            context.read<SearchBloc>().add(
                  SearchPodcastsEvent(
                    SearchPodcastsParams(value),
                  ),
                );
          }

          if (_controller.isAttached) {
            _controller.closeView(value);
          }

          // Close the search view keyboard
          FocusScope.of(context).unfocus();

          // Close the search bar keyboard
          _focusNode.unfocus();
        },
        viewBuilder: (suggestions) {
          return BlocProvider.value(
            value: podcastSearchHistoryBloc,
            child: BlocBuilder<PodcastSearchHistoryBloc,
                PodcastSearchHistoryState>(
              buildWhen: (previous, current) =>
                  previous != current && current is PodcastSearchHistoryLoaded,
              builder: (context, state) {
                var searchHistory = <PodcastEntity>[];

                if (state is PodcastSearchHistoryLoaded) {
                  searchHistory = state.podcastEntities;
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text('Search history'),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            context
                                .read<PodcastSearchHistoryBloc>()
                                .add(const DeletePodcastSearchEvent());
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        // Without this padding, the first list tile does not begin
                        // immediately beneath the widget above it.
                        padding: EdgeInsets.zero,
                        itemCount: searchHistory.length,
                        separatorBuilder: (context, index) => const Divider(
                          indent: 16,
                          endIndent: 16,
                        ),
                        itemBuilder: (context, index) => PodcastSearchListTile(
                          podcast: searchHistory[index],
                          onTap: () => print('nav to detail page'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
        // Not using the suggestions builder as the view builder includes a
        // BlocBuilder that rebuilds the search history.
        suggestionsBuilder: (context, controller) => [],
        builder: (anchorContext, controller) {
          return SearchBar(
            controller: _controller,
            elevation: const WidgetStatePropertyAll(0),
            focusNode: _focusNode,
            hintText: 'Search for podcasts...',
            leading: IconButton(
              icon: const Icon(Icons.search),
              padding: const EdgeInsets.only(left: 8),
              onPressed: () {
                _controller.openView();
              },
            ),
            onTap: () => _controller.openView(),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                context.read<SearchBloc>().add(
                      SearchPodcastsEvent(
                        SearchPodcastsParams(value),
                      ),
                    );
              }

              _focusNode.unfocus();
            },
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.search,
            trailing: [
              Visibility(
                visible: _controller.text.isNotEmpty,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    context.read<SearchBloc>().add(const ClearSearchEvent());
                    _controller.clear();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
