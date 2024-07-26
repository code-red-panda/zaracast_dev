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
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
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
            builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            elevation: WidgetStateProperty.all<double>(0),
            hintText: 'Search for podcasts',
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: SizedBox(
                height: 24,
                width: 24,
                child: Visibility(
                  visible: state is! SearchLoading,
                  replacement: const CircularProgressIndicator(strokeWidth: 2),
                  child: const Icon(Icons.search),
                ),
              ),
            ),
            onChanged: (String value) => controller.openView(),// _controller.text = value,
            onSubmitted: (String value) => value.isNotEmpty
                ? context.read<SearchBloc>().add(
                      SearchPodcastsEvent(SearchPodcastsParams(value)),
                    )
                : null,
            onTap: () => controller.openView(),
            // Close the keyboard when tapping outside the search bar
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            trailing: <Widget>[
              Visibility(
                visible: state is! SearchLoading,
                child: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () =>
                      context.read<SearchBloc>().add(const ClearSearchEvent()),
                ),
              ),
            ],
          );
        }, suggestionsBuilder:
                (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                });
              },
            );
          });
        });
      },
    );
  }
}
