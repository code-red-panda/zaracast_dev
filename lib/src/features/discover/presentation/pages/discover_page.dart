import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/core/utils/helpers/format_helper.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/dependency_injection/search_singletons.dart';
import 'package:zaracast/src/features/search/data/params/create_podcast_search_params.dart';
import 'package:zaracast/src/features/search/presentation/blocs/podcast_search_history/podcast_search_history_bloc.dart';
import 'package:zaracast/src/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:zaracast/src/features/search/presentation/widgets/podcast_search_bar.dart';
import 'package:zaracast/src/features/search/presentation/widgets/podcast_search_list_tile.dart';
import 'package:zaracast/src/shared/presentation/widgets/sliver_app_bar_builder.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: searchBloc),
        BlocProvider.value(value: podcastSearchHistoryBloc),
      ],
      child: const DiscoverPageChild(),
    );
  }
}

class DiscoverPageChild extends StatefulWidget {
  const DiscoverPageChild({super.key});

  @override
  State<DiscoverPageChild> createState() => _DiscoverPageChildState();
}

class _DiscoverPageChildState extends State<DiscoverPageChild>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        // TODO(red): If search bar can't be persisted header, have a search icon action that is only visible when the user scrolls up. It activates the search screen.
        SliverAppBarBuilder.largeTitle(
          title: 'Discover',
          scrollController: _scrollController,
        ),
        BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SliverToBoxAdapter(
              child: Stack(
                children: [
                  Visibility(
                    visible: state is SearchLoading,
                    child: const LinearProgressIndicator(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: PodcastSearchBar(),
          ),
        ),
        BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            var podcasts = <PodcastEntity>[];

            if (state is SearchLoaded) {
              podcasts = state.podcastEntities;
            }

            return SliverList.separated(
              itemCount: podcasts.length,
              separatorBuilder: (context, index) => const Divider(
                indent: 16,
                endIndent: 16,
              ),
              itemBuilder: (context, index) {
                final podcast = podcasts[index];

                return PodcastSearchListTile(
                  podcast: podcast,
                  trailing: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      formatDatePublished(podcast.newestItemPubdate ?? 0),
                    ),
                  ),
                  onTap: () {
                    print('nav to podcast detail page ${podcast.id}');

                    final params = CreatePodcastSearchParams(podcast);

                    context.read<PodcastSearchHistoryBloc>().add(
                          CreatePodcastSearchEvent(params),
                        );
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
