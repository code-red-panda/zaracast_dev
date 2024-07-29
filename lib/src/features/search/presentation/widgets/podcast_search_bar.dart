import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/features/search/presentation/blocs/search/search_bloc.dart';
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
    return BlocConsumer<SearchBloc, SearchState>(
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
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SearchAnchor(
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
                    //padding: const EdgeInsets.only(right: 8),
                    onPressed: () {
                      context.read<SearchBloc>().add(const ClearSearchEvent());
                      _controller.clear();
                    },
                  ),
                ),
              ],
            );
          },
          suggestionsBuilder: (suggestionsContext, controller) {
            // TODO(red): Store podcast Ids in prefs list. Stream podcasts table by those IDs.
            return [
              ListTile(
                trailing: TextButton(
                  child: const Text('Clear previous searches'),
                  onPressed: () {
                    print('clear searches');
                  },
                ),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: const Text('Tile 1'),
                onTap: () => _controller.isAttached
                    ? _controller.closeView('Tile 1')
                    : null,
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: const Text('Tile 2'),
                onTap: () => _controller.isAttached
                    ? _controller.closeView('Tile 2')
                    : null,
              ),
            ];
          },
        );
      },
    );
  }
}
