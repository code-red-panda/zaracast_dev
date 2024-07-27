import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/core/utils/extensions/format_helper.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/dependency_injection/search_singletons.dart';
import 'package:zaracast/src/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:zaracast/src/features/search/presentation/widgets/podcast_search_bar.dart';
import 'package:zaracast/src/shared/presentation/widgets/sliver_app_bar_builder.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => searchBloc,
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
      //physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBarBuilder.largeTitle(
          title: 'Discover',
          scrollController: _scrollController,
        ),
        // TODO(red): Move the loading indicator to a Stack so it doesn't move
        //  the other widgets around when its visible
        BlocBuilder<SearchBloc, SearchState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SliverToBoxAdapter(
              child: Stack(
                children: [
                  Visibility(
                    visible: state is SearchLoading,
                    child: const LinearProgressIndicator(minHeight: 0.5),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),

        // TODO(red): persist the search bar or make it "float" and come back
        //  when the user scrolls up
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
              itemBuilder: (context, index) {
                final podcast = podcasts[index];

                return ListTile(
                  leading: SizedBox(
                    height: 64,
                    width: 64,
                    child: Image.network(podcast.image),
                  ),
                  title: Text(
                    podcast.title,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    podcast.categories.toString(),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: SizedBox(
                    height: 64,
                    width: 64,
                    child: Column(
                      children: [
                        Text(formatDatePublished(podcast.newestItemPubdate ?? 0)),
                        Text(podcast.episodeCount.toString()),
                      ],
                    ),
                  ),
                  onTap: () => print('tap'),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                indent: 16,
                endIndent: 16,
              ),
            );
          },
        ),
      ],
    );
  }
}
