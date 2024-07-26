import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';
import 'package:zaracast/src/features/search/presentation/blocs/search/search_bloc.dart';

class PodcastSearchBar extends StatefulWidget {
  const PodcastSearchBar({super.key});

  @override
  State<PodcastSearchBar> createState() => _PodcastSearchBarState();
}

class _PodcastSearchBarState extends State<PodcastSearchBar> {
  late final SearchController _controller;

  @override
  void initState() {
    _controller = SearchController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listenWhen: (previous, current) => current is SearchInitial,
      listener: (context, state) {
        _controller.clear();
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SearchAnchor(
          isFullScreen: false,
          searchController: _controller,
          viewOnSubmitted: (value) {
            // Close the keyboard
            FocusScope.of(context).unfocus();
            if (value.isNotEmpty) {
              context.read<SearchBloc>().add(
                    SearchPodcastsEvent(SearchPodcastsParams(value)),
                  );
            }

            if (_controller.isOpen) {
              _controller.closeView(value);
            }
          },
          builder: (context, controller) {
            return SearchBar(
              controller: _controller,
              hintText: 'Search for podcasts',
              trailing: <Widget>[
                Visibility(
                  visible: _controller.text.isNotEmpty,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      context.read<SearchBloc>().add(const ClearSearchEvent());
                    },
                  ),
                ),
              ],
              onChanged: (value) => _controller.text = value,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  context.read<SearchBloc>().add(
                        SearchPodcastsEvent(SearchPodcastsParams(value)),
                      );
                }

                if (_controller.isOpen) {
                  _controller.closeView(value);
                }

                // Close the keyboard
                FocusScope.of(context).unfocus();
              },
              onTap: () => _controller.openView(),
              textInputAction: TextInputAction.search,
            );
          },
          suggestionsBuilder: (context, controller) {
            return List<ListTile>.generate(5, (int index) {
              final item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          },
        );
      },
    );
  }
}

/*

return SearchAnchor.bar(
          barHintText: 'Search for podcasts',
          barTrailing: <Widget>[
            Visibility(
              visible: _controller.text.isNotEmpty,
              child: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  context.read<SearchBloc>().add(const ClearSearchEvent());
                },
              ),
            ),
          ],
          isFullScreen: false,
          onChanged: (value) => _controller.text = value,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              print('event');
              context.read<SearchBloc>().add(
                    SearchPodcastsEvent(SearchPodcastsParams(value)),
                  );
            }

            if (_controller.isOpen) {
              _controller.closeView(value);
            }

            // Close the keyboard
            print('close keyboard');
            FocusScope.of(context).unfocus();
            FocusScope.of(context).unfocus();
          },
          searchController: _controller,
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  setState(() {
                    controller.closeView(item);
                  });
                },
              );
            });
          },
          textInputAction: _controller.isAttached
              ? TextInputAction.search
              : TextInputAction.unspecified,
        );

        */